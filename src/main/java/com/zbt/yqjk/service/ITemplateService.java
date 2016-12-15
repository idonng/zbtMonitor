package com.zbt.yqjk.service;

import java.util.List;

import com.zbt.yqjk.pojo.TemplateInfo;

/**
 * 类名: ITemplateService 
 * 功能: 模板文件逻辑处理
 * 作者: vivira
 * 日期: 2016/12/4
 */
public interface ITemplateService {
	
	//通过id查找
	public TemplateInfo selectByPrimaryKey(Long tempId);
	
	//查询是否存在默认模板
	public TemplateInfo selectByIsDefault(int Default);
	
	//通过模板名称查询是否存在此模板（名称不能重复）
	public int selectByTempName(String tempName);

	//新增模板
	public int insert(TemplateInfo record);
	
	//模板删除字段由1变为0 ,增加最近操作人
	public int deleteByPrimaryKey(TemplateInfo record) ;
	
	//模板默认字段由0变为1 ,增加最近操作人
	public int isDefault(TemplateInfo record) ;
	
	//模板更新,增加最近操作人
	public int updateByPrimaryKeySelective(TemplateInfo record);
	
	//页面展示
	public List<TemplateInfo>  selectAll();
	
}
