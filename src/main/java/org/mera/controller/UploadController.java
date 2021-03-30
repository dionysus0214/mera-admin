package org.mera.controller;

import java.io.File;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {

    private static final Logger logger = LoggerFactory.getLogger(UploadController.class);

    @GetMapping("/uploadAjax")
	public void uploadAjax() {
		logger.info("upload ajax");
	}

    @PostMapping("/uploadAjaxAction")
    public void uploadAjaxPost(MultipartFile[] uploadFile) {
        logger.info("update ajax post.........");

        String uploadFolder = "C:\\upload";
        for (MultipartFile multipartFile : uploadFile) {
            logger.info("-------------------------------------");
            logger.info("Upload File Name: " + multipartFile.getOriginalFilename());
            logger.info("Upload File Size: " + multipartFile.getSize());

            String uploadFileName = multipartFile.getOriginalFilename();

            uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
            logger.info("only file name: " + uploadFileName);

            File saveFile = new File(uploadFolder, uploadFileName);

            try {
                multipartFile.transferTo(saveFile);
            } catch (Exception e) {
                logger.error(e.getMessage());
            } 
        }
    }
}