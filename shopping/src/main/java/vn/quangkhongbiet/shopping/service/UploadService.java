package vn.quangkhongbiet.shopping.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;

@Service
public class UploadService {
    private ServletContext servletContext;

    public UploadService(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    public String handleSaveUploadFile(MultipartFile file, String targetFolder) {
        // don't upload file
        if (file.isEmpty())
            return "";

        String finalName = "";
        try {
            byte[] bytes = file.getBytes();

            String rootPath = this.servletContext.getRealPath("/resources/images");
            File dir = new File(rootPath + File.separator + targetFolder);

            if (!dir.exists())
                dir.mkdirs();

            // Create the file on server
            // uuid in mongodb
            finalName = System.currentTimeMillis() + "-" + file.getOriginalFilename();
            File serverFile = new File(dir.getAbsolutePath() + File.separator + finalName);

            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));
            stream.write(bytes);
            stream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return finalName;
    }

    public List<String> handleSaveUploadMultiFile(MultipartFile[] multipartFiles, String targetFolder) {
        List<String> images = new ArrayList<>();
        for (MultipartFile file : multipartFiles) {
            // don't upload file
            if (file.isEmpty())
                return null;

            String finalName = "";
            try {
                byte[] bytes = file.getBytes();

                String rootPath = this.servletContext.getRealPath("/resources/images");
                File dir = new File(rootPath + File.separator + targetFolder);

                if (!dir.exists())
                    dir.mkdirs();

                // Create the file on server
                // uuid in mongodb
                finalName = System.currentTimeMillis() + "-" + file.getOriginalFilename();
                File serverFile = new File(dir.getAbsolutePath() + File.separator + finalName);

                BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            images.add(finalName);
        }
        return images;
    }
}
