package com.ruoyi.web.controller.common;

/**
 * @author 冯根源
 * @version 1.0
 * @date 2021/5/12 11:38
 */

import com.ruoyi.common.FileUploader;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.*;
import java.util.stream.Collectors;


@RestController
@RequestMapping("/upload")
public class UploadCtrl extends BaseController {


    @Autowired
    FileUploader fileUploader;


    /**
     *   通用上传
     * @param file
     * @param type
     * @return
     */
    @PostMapping("")
    @ResponseBody
    public AjaxResult uploadFile(MultipartFile[] file, String type) {
        try {
            List<Map> resultList = new ArrayList<>();
            for (int i = 0; i < file.length; i++) {
                resultList.add(fileUploader.fileUpload(file[i],type));
            }
            AjaxResult ajaxResult = AjaxResult.success();
            ajaxResult.put("data", resultList);
            return ajaxResult;
        } catch (Exception e) {
            return AjaxResult.error(e.getMessage());
        }
    }

    /**
     *   富文本编辑器的图片上传
     * @param file
     * @return
     */
    @PostMapping("editorUpload")
    @ResponseBody
    public Map editorUpload(MultipartFile[] file) {
        Map map = new HashMap();
        try {
            List<Map> resultList = new ArrayList<>();
            for (int i = 0; i < file.length; i++) {
                resultList.add(fileUploader.fileUpload(file[i],"editor"));
            }
            map.put("errno", 0);
            map.put("data", resultList.stream().map(m ->m.get("fileUrl")).collect(Collectors.toList()));

        } catch (Exception e) {
            map.put("errno", 1);
        }

        return map;
    }

}
