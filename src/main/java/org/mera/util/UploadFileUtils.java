package org.mera.util;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

/**
 * 1. 자동적인 폴더를 생성하여 한폴더에 너무 많은 파일이 저장되지 않도록 한다.
 * 2. 파일 저장시 UUID를 이용하여 중복을 제거
 * 3. 썸네일을 생성하는 기능
 */
public class UploadFileUtils {

    private static final Logger logger = LoggerFactory.getLogger(UploadFileUtils.class);

    public static String uploadFile(String uploadPath, String originName, byte[] fileData) throws Exception {
        UUID uid = UUID.randomUUID();
        String savedName = uid.toString() + "_" + originName;
        String savedPath = calcPath(uploadPath);

        File target = new File(uploadPath + savedPath, savedName);
        FileCopyUtils.copy(fileData, target);

        String formatName = originName.substring(originName.lastIndexOf(".")+1);
        String uploadFileName = null;

        if(MediaUtils.getMediaType(formatName) != null) {
            uploadFileName = makeThumbnail(uploadPath, savedPath, savedName);
        } else {
            uploadFileName = makeIcon(uploadPath, savedPath, savedName);
        }

        return uploadFileName;
    }

    private static String calcPath(String uploadPath) {
        Calendar cal = Calendar.getInstance();
        String yearPath = File.separator+cal.get(Calendar.YEAR);
        String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
        String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));

        makeDir(uploadPath, yearPath, monthPath, datePath);
        logger.info(datePath);

        return datePath;
    }

    private static void makeDir(String uploadPath, String...paths) {
        if(new File(paths[paths.length-1]).exists()) {
            return;
        }
        for(String path : paths) {
            File dirPath = new File(uploadPath + path);
            if(!dirPath.exists()) {
                dirPath.mkdir();
            }
        }
    }

    private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
        BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
        BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);

        String thumbnailName = uploadPath + path + File.separator + "s_"+fileName;
        File newFile = new File(thumbnailName);
        String formatName = fileName.substring(fileName.lastIndexOf(".")+1);

        ImageIO.write(destImg, formatName.toUpperCase(), newFile);
        return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');

    }

    private static String makeIcon(String uploadPath, String path, String fileName) throws Exception {
        String iconName = uploadPath + path + File.separator + fileName;

        return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
    }

}
