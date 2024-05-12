package com.example.edufood.service.impl;


import com.example.edufood.service.ImageService;
import com.example.edufood.util.FileUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ImageServiceImpl implements ImageService {

    private final FileUtil fileUtil;

    @Override
    public ResponseEntity<?> downloadDefaultPhoto(String namePhot) {
        return fileUtil.getOutputFile(namePhot, "/images", MediaType.IMAGE_JPEG);
    }
}
