package com.example.edufood.util;


import io.micrometer.common.util.StringUtils;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

@Component
@Slf4j
@RequiredArgsConstructor
public class FileUtil {

    private static final String UPLOAD_DIR = "data";

    @SneakyThrows
    public String saveUploadedFile(MultipartFile file, String subDir) {
        String uuidFile = UUID.randomUUID().toString();
        String resultFileName = uuidFile + "_" + file.getOriginalFilename();

        Path pathDir = Paths.get(UPLOAD_DIR + "/" + subDir);
        Files.createDirectories(pathDir);

        Path filePath = Paths.get(pathDir + "/" + resultFileName);
        if(!Files.exists(filePath)) {
            Files.createFile(filePath);
        }

        try(OutputStream os = Files.newOutputStream(filePath)) {
            os.write(file.getBytes());
        } catch (IOException e){
            log.error(e.getMessage());
        }

        return resultFileName;
    }

    public ResponseEntity<?> getOutputFile(String fileName, String subDir, MediaType mediaType) {
        try {
            byte[] image = Files.readAllBytes(Paths.get(UPLOAD_DIR + subDir + "/" + fileName));

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(mediaType);
            headers.setContentDispositionFormData("attachment", fileName);
            headers.setContentLength(image.length);

            return new ResponseEntity<>(image, headers, HttpStatus.OK);
        } catch (IOException e) {
            log.error("No file found:", e);
            return ResponseEntity.status(HttpStatus.NO_CONTENT).body("Image not found");
        }
    }
}
