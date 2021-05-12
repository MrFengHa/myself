package com.ruoyi.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.domian.Member;
import com.ruoyi.service.MemberService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

/**
 * 【会员】Controller
 *
 * @author ruoyi
 * @date 2021-05-11
 */
@Controller
@RequestMapping("/member")
public class MemberController extends BaseController {
    private String prefix = "member";

    @Autowired
    private MemberService memberService;

    @RequiresPermissions("system:member:view")
    @GetMapping()
    public String member() {
        return prefix + "/list";
    }

    /**
     * 查询【请填写功能名称】列表
     */
    @RequiresPermissions("system:member:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Member member) {
        startPage();
        List<Member> list = memberService.selectList(member);
        return getDataTable(list);
    }


    /**
     * 导出【请填写功能名称】列表
     */
    @RequiresPermissions("system:member:export")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Member member) {
        List<Member> list = memberService.selectList(member);
        ExcelUtil<Member> util = new ExcelUtil<Member>(Member.class);
        return util.exportExcel(list, "member");
    }

    /**
     * 新增【请填写功能名称】
     */
    @GetMapping("/add")
    public String add(ModelMap mmap) {
        Member member = new Member();
        mmap.put("member", member);
        return prefix + "/form";
    }

    /**
     * 修改【请填写功能名称】
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap) {
        Member member =memberService.getById(id);
        mmap.put("member", member);
        return prefix + "/form";
    }

    /**
     * 修改and新增【请填写功能名称】
     */
    @RequiresPermissions("system:member:edit")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Member member) {
        if (ObjectUtils.isEmpty(member) || ObjectUtils.isEmpty(member.getId())){
            return toAjax(memberService.save(member));
        }
        return toAjax(memberService.updateById(member));
    }

    /**
     * 删除【请填写功能名称】
     */
    @RequiresPermissions("system:member:remove")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        //删除的id不能为空
        if (StringUtils.isEmpty(ids)){
            return toAjax(false);
        }
        String[] split = ids.split(",");
        return toAjax(memberService.removeByIds(Arrays.asList(Convert.toStrArray(ids))));

//        try{
//            for (String id:split){
//                memberService.removeById(id);
//            }
//            return toAjax(true);
//        }catch (Exception e){
//            return toAjax(false);
//        }
    }
}
