package com.example.edufood.api;

import com.example.edufood.service.ImageService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("images")
@RequiredArgsConstructor
public class ImageController {

    private final ImageService imageService;

    @GetMapping("default/{name}")
    public ResponseEntity<?> getDefaultPhoto(@PathVariable String name) {
        return imageService.downloadDefaultPhoto(name);
    }
}
