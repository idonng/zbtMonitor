package com.zbt.yqjk.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zbt.yqjk.dao.ITemplateDao;
import com.zbt.yqjk.pojo.TemplateInfo;
import com.zbt.yqjk.service.ITemplateService;


@Service("templateService")
public class TemplateServiceImpl implements ITemplateService {
	@Resource
	private ITemplateDao templateDao;
	@Override
	public TemplateInfo selectByPrimaryKey(Long tempId) {
		// TODO Auto-generated method stub
		return this.templateDao.selectByPrimaryKey(tempId);
	}

	public TemplateInfo selectTemplate(TemplateInfo record) {
		// TODO Auto-generated method stub
		return this.templateDao.selectTemplate(record);
	}

	public int insert(TemplateInfo record) {
		// TODO Auto-generated method stub
		return this.templateDao.insert(record);
	}
	
	public int deleteByPrimaryKey(TemplateInfo record) {
		// TODO Auto-generated method stub
		return this.templateDao.deleteByPrimaryKey(record);
	}

	public TemplateInfo selectByIsDefault(int Default) {
		// TODO Auto-generated method stub
		return this.templateDao.selectByIsDefault(Default);
	}
	
	public int isDefault(TemplateInfo record) {
		// TODO Auto-generated method stub
		
		return this.templateDao.isDefault(record);
	}
	
	public List<TemplateInfo>  selectAll() {
		// TODO Auto-generated method stub
		return this.templateDao.selectAll();
	}

	@Override
	public int updateByPrimaryKeySelective(TemplateInfo record) {
		// TODO Auto-generated method stub
		return this.templateDao.updateByPrimaryKeySelective(record);
	}

}
