package com.item.utils;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Created by Ming on 2018/2/10.
 */
public class FileUtil {
    /**
     *
     * @param multipartFile 上传的文件
     * @param saveDir  在images文件夹下面的哪个文件夹
     * @param request
     * @return 返回一个文件路径 如果null则上传失败
     */
    public static String uploadImage(MultipartFile multipartFile, String saveDir,HttpServletRequest request){
    	/*System.out.println(multipartFile.getContentType().startsWith("uploads/"));*/
            /*if(!multipartFile.getContentType().startsWith("uploads/"))
                return null;*/
            String filename = multipartFile.getOriginalFilename();
            String type = filename.substring(filename.lastIndexOf("."));
            String path = request.getServletContext().getRealPath("/uploads/"+saveDir)+"/"+filename;
            System.out.println(path);
            try{
                FileCopyUtils.copy(multipartFile.getInputStream(), new FileOutputStream(path));
                return "/uploads/"+saveDir+"/"+filename;
            }catch (IOException e){
                e.printStackTrace();
                return null;
            }

    }
}
