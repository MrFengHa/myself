package com.ruoyi.domian;

import java.math.BigDecimal;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;


/**
 * @author 冯根源
 * @version 1.0
 * @date 2021/5/11 13:50
 */
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
@TableName("member")
public class Member
{
    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Long id;
    /** 会员姓名 */
    @Excel(name = "会员姓名")
    private String name;
    /** 年龄 */
    @Excel(name = "年龄")
    private Integer age;
    /** 余额 */
    @Excel(name = "余额")
    private BigDecimal balance;
    /** 总计金额 */
    @Excel(name = "总计金额")
    private BigDecimal totalMoney;
    /** 状态 */
    @Excel(name = "状态")
    private Long state;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /** 更新时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;
}
