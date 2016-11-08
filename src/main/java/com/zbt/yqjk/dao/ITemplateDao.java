package com.zbt.yqjk.dao;

import java.util.List;

import com.zbt.yqjk.pojo.TemplateInfo;

public interface ITemplateDao {
	
		//模板删除字段由1变为0 ,增加最近操作人
	 	int deleteByPrimaryKey(TemplateInfo record);
	 	
	 	//查询是否存在默认模板
	 	TemplateInfo selectByIsDefault(int Default);
	 	
	 	//模板默认字段由0变为1 ,增加最近操作人
	 	int isDefault(TemplateInfo record);
	    
	 	int insert(TemplateInfo record);
	 	
	 	//通过id查找
	    TemplateInfo selectByPrimaryKey(Long tempId);
	    
	    TemplateInfo selectTemplate(TemplateInfo record);
	    
	    //模板更新,增加最近操作人
	    int updateByPrimaryKeySelective(TemplateInfo record);
	    
	    //页面展示
	    List<TemplateInfo> selectAll();
	    
}