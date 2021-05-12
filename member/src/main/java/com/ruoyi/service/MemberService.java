package com.ruoyi.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.domian.Member;
import com.ruoyi.mapper.MemberMapper;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * @author 冯根源
 * @version 1.0
 * @date 2021/5/11 13:59
 */
@Service
public class MemberService extends ServiceImpl<MemberMapper, Member> {

    /**
     * 查询【请填写功能名称】列表
     *
     * @param member 【请填写功能名称】信息
     * @return 【请填写功能名称】集合
     */
    public List<Member> selectList(Member member){
        LambdaQueryWrapper<Member> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper
                .orderByDesc(Member::getId);
        return baseMapper.selectList(queryWrapper);
    }

}
