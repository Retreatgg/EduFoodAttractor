package com.example.edufood.service;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

@Service
public interface ImageService {

    ResponseEntity<?> downloadDefaultPhoto(String namePhot);
}
