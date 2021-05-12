package com.ruoyi.common;


import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.ruoyi.common.utils.DateUtil;
import com.ruoyi.common.utils.SpringContextUtil;
import com.ruoyi.common.utils.security.IDUtil;
import org.jsoup.helper.StringUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

/**
 * @author 冯根源
 * @version 1.0
 * @date 2021/5/12 11:39
 */
@Component
public class FileUploader {

    @Value("${uploadWay}")
    private String uploadWay;

    private FileUpload fileUpload = new DefaultUpload();

    private void init() throws NullPointerException{
        if("ossUpload".equals(uploadWay)){
            fileUpload = SpringContextUtil.getBean(AliyunOSSUpload.class) ;
        } else if ("localUpload".equals(uploadWay)){
            fileUpload = SpringContextUtil.getBean(LocalUpload.class) ;
        } else {
            fileUpload = null;
        }
    }


    public   Map fileUpload(MultipartFile file, String type) throws IOException,NullPointerException {
        if(fileUpload instanceof DefaultUpload){
            init();
        }
        if(fileUpload == null){
            throw  new NullPointerException("未初始化上传方式");
        }
        Map resultMap = new HashMap();
        resultMap.put("fileName", file.getOriginalFilename());
        if(StringUtil.isBlank(type)){
            type = "common";
        }
        String fileUrl =  restFileUrl(type,file.getOriginalFilename());
        try {
            resultMap.put("fileUrl", fileUpload.upload(file, fileUrl));
        } catch (IOException e) {
            throw  new IOException("上传文件失败");
        }
        return resultMap;

    }


    public  String restFileUrl(String bizType, String fileName) {
        String suffix = fileName.replaceAll(".*(\\..{3,5})$", "$1");
        StringBuilder path = new StringBuilder("/");
        path.append(bizType);
        path.append("/");
        path.append(DateUtil.getCurrentDate("yyyyMMdd"));
        path.append("/");
        path.append(IDUtil.getID());
        path.append(suffix);
        return path.toString();
    }
}

interface   FileUpload{

    String upload(MultipartFile file , String path) throws IOException;
}

class  DefaultUpload implements FileUpload {

    @Override
    public String upload(MultipartFile file, String path) throws IOException {
        return null;
    }
}

@Component
class  LocalUpload implements FileUpload {
    @Value("${localFile.accessDomain}")
    private   String accessDomain; // 访问地址

    @Value("${localFile.basePath}")
    private  String basePath; //文件目录



    /**
     * 保存为本地磁盘文件
     */
    public String upload(MultipartFile file, String path) throws IOException {
        String absolutePath;
        if (path.startsWith("/")) {
            absolutePath = basePath + path;
        } else {
            absolutePath = basePath + "/" + path;
        }
        Path pathToFile = Paths.get(absolutePath);
        Files.createDirectories(pathToFile.getParent());
        if(pathToFile.getFileName() == null){
            Files.createFile(pathToFile);
        }
        file.transferTo(new File(absolutePath));

        return accessDomain + path;
    }
}

@Component
class AliyunOSSUpload  implements FileUpload {

    @Value("${aliyunoss.accessDomain}")
    private   String accessDomain; // 访问地址

    @Value("${aliyunoss.endpoint}")
    private  String endpoint; // 上传地址

    @Value("${aliyunoss.accessKeyId}")
    private  String accessKeyId;

    @Value("${aliyunoss.accessKeySecret}")
    private  String accessKeySecret;

    @Value("${aliyunoss.bucketName}")
    private  String bucketName;

    @Value("${aliyunoss.basePath}")
    private  String basePath;

    private OSS client;

    private void init() {
        if (client == null) {
            client = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);
        }
    }

    /**
     * byte数组，指定path路径和文件名
     *
     * @param data
     * @param path
     * @return
     */
    public String upload(byte[] data, String path) {
        return upload(new ByteArrayInputStream(data), path);
    }

    /**
     * 输入流，指定path路径和文件名
     *
     * @param inputStream
     * @param path
     * @return
     */
    public String upload(InputStream inputStream, String path) {
        init();
        client.putObject(bucketName, path, inputStream);
        return accessDomain + path;
    }

    @Override
    public String upload(MultipartFile file, String path) throws IOException {
        return  upload(file.getBytes(),path);
    }
}
