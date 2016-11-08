package com.zbt.yqjk.service.impl;

import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.zbt.yqjk.dao.IPublicOpinionDao;
import com.zbt.yqjk.pojo.Keyword;
import com.zbt.yqjk.pojo.PageBean;
import com.zbt.yqjk.pojo.PublicOpinion;
import com.zbt.yqjk.service.IPublicOpinionService;

@Service("publicOpinionService")
public class PublicOpinionServiceImpl implements IPublicOpinionService {
	@Resource
	private IPublicOpinionDao publicOpinionDao;
	
	@Override
	//根据关键词条集合获取分页的内容
	public List<PublicOpinion> getPublicOpinionBykeywords(List<Integer> resultTypes,Date begintime,
			Date endtime,PageBean pageBean,
			List<Keyword> keywords) {		
		return this.publicOpinionDao.getPublicOpinionBykeywords(resultTypes,begintime,
				endtime,pageBean,keywords);
	}
	
	@Override
	//根据关键字词条集合获取总记录数
	public int getPublicOpinionRowsCount(List<Integer> resultTypes,Date begintime,
			Date endtime,List<Keyword> keywords) {
		return this.publicOpinionDao.getPublicOpinionRowsCount(resultTypes,begintime,
				endtime,keywords);
	}
	
	@Override
	//根据key集合来删除对应记录
	public int delPublicOpinion(List<Long> keys) {
		return this.publicOpinionDao.delPublicOpinion(keys);
	}
	
	@Override
	//根据key集合来收藏对应记录
	public int focusPublicOpinion(List<Long> keys) {
		// TODO Auto-generated method stub
		return this.publicOpinionDao.focusPublicOpinion(keys);
	}
	
	@Override
	//根据key集合来将对应记录改为正面分类
	public int goodPublicOpinion(List<Long> keys) {
		// TODO Auto-generated method stub
		return this.publicOpinionDao.goodPublicOpinion(keys);
	}

	@Override
	//根据key集合来将对应记录改为中立分类
	public int midPublicOpinion(List<Long> keys) {
		// TODO Auto-generated method stub
		return this.publicOpinionDao.midPublicOpinion(keys);
	}

	@Override
	//根据key集合来修改对应记录为负面分类
	public int badPublicOpinion(List<Long> keys) {
		// TODO Auto-generated method stub
		return this.publicOpinionDao.badPublicOpinion(keys);
	}
	
	@Override
	//根据是否关注获取分页的内容
    public List<PublicOpinion> getPublicOpinionByIsFocus(PageBean pageBean){
		return this.publicOpinionDao.getPublicOpinionByIsFocus(pageBean);
	}
    
	@Override
    //根据是否关注获取分页的总记录数
    public int getPublicOpinionIsFocusCount(){
		return this.publicOpinionDao.getPublicOpinionIsFocusCount();
	}
	
	@Override
	//根据主键集合获取需要导出的舆情数据集合
    public List<PublicOpinion> getExportPublicOpinion(List<Long> resultKeys) {
    	return this.publicOpinionDao.getExportPublicOpinion(resultKeys);
    }
	
	@Override
	//根据主键集合取消关注 
    public int setCancelPublicOpinion(List<Long> resultKeys){
		return this.publicOpinionDao.setCancelPublicOpinion(resultKeys);
	}
	
	//根据日期获取总记录数
	@Override
	public int selectCountByDate(PublicOpinion record) {
		// TODO Auto-generated method stub
		return this.publicOpinionDao.selectCountByDate(record);
	}

	//根据日期和情感分类获取总记录数 
	@Override
	public int selectCountByDateAndEmotion(PublicOpinion record) {
		// TODO Auto-generated method stub
		return this.publicOpinionDao.selectCountByDateAndEmotion(record);
	}

	//根据日期和数据来源分类获取总记录数 
	@Override
	public int selectCountByResultType(PublicOpinion record) {
		// TODO Auto-generated method stub
		return this.publicOpinionDao.selectCountByResultType(record);
	}

	//根据日期和数据来源分类和情感分类获取总记录数 
	@Override
	public int selectCountByResultTypeAndEmotion(PublicOpinion record) {
		// TODO Auto-generated method stub
		return this.publicOpinionDao.selectCountByResultTypeAndEmotion(record);
	}

	
}
