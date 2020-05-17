package com.shp.web.admin.web.controller;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
public class UploadController {
    @ResponseBody
    @RequestMapping(value = "upload",method = RequestMethod.POST)
    public Map<String,Object> upload(MultipartFile dropFile,MultipartFile wangEditorFile, HttpServletRequest request){
        MultipartFile myFile = dropFile == null?wangEditorFile:dropFile;

        Map<String,Object> result = new HashMap<>();
        String fileName = myFile.getOriginalFilename();
        String fileSuffix = fileName.substring(fileName.lastIndexOf("."));
        //文件路径
        String filePath = request.getSession().getServletContext().getRealPath("/static/upload");
        File file = new File(filePath);
        if(!file.exists()){
            file.mkdir();
        }
        //将文件写入目录
        file = new File(filePath, UUID.randomUUID()+fileSuffix);
        try{
            myFile.transferTo(file);
        }
        catch (IOException e){
            e.printStackTrace();
        }
        if(dropFile!=null){
            result.put("fileName","/static/upload/"+file.getName());
        }
        else {
            result.put("errno",0);
            result.put("data",new String[]{"/static/upload/"+file.getName()});
        }
        return result;
    }
}
