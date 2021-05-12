package com.ruoyi.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ruoyi.domian.Member;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author 冯根源
 * @version 1.0
 * @date 2021/5/11 13:55
 */
@Mapper
public interface MemberMapper extends BaseMapper<Member> {

    /**
     *
     * 查询【请填写功能名称】列表
     *
     * @param Member 【请填写功能名称】信息
     * @return 【请填写功能名称】集合
     */
    List<Member> selectList(Member Member);

}
