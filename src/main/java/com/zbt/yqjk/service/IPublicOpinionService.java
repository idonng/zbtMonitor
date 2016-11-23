package com.zbt.yqjk.service;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zbt.yqjk.pojo.Keyword;
import com.zbt.yqjk.pojo.PageBean;
import com.zbt.yqjk.pojo.PublicOpinion;

public interface IPublicOpinionService {
	
	//根据关键词条集合获取分页的内容
	public List<PublicOpinion> getPublicOpinionBykeywords(List<Integer> resultTypes,int resultEmotion,Date begintime,
			Date endtime,PageBean pageBean,List<Keyword> keywords);
	
	//根据关键字词条集合获取总记录数
	public int getPublicOpinionRowsCount(List<Integer> resultTypes,int resultEmotion,Date begintime,
			Date endtime,List<Keyword> keywords);
	
	//根据key集合来删除对应记录
	public int delPublicOpinion(List<Long> keys);
	
	//根据key集合来收藏对应记录
	public int focusPublicOpinion(List<Long> keys);
	
	//根据key集合来将对应记录改为正面分类
	public int goodPublicOpinion(List<Long> keys);
	
	//根据key集合来将对应记录改为中立分类
	public int midPublicOpinion(List<Long> keys);
	
	//根据key集合来修改对应记录为负面分类
	public int badPublicOpinion(List<Long> keys);
	
	//根据是否关注获取分页的内容
    public List<PublicOpinion> getPublicOpinionByIsFocus(PageBean pageBean) ;
    
    //根据是否关注获取分页的总记录数
    public int getPublicOpinionIsFocusCount();
    
    //根据主键集合获取需要导出的舆情数据集合
    public List<PublicOpinion> getExportPublicOpinion(List<Long> resultKeys) ;
    
    //根据主键集合取消关注 
    public int setCancelPublicOpinion(List<Long> resultKeys);
	
	//根据日期获取总记录数 
	public int selectCountByDate(PublicOpinion record);
    
    //根据日期和情感分类获取总记录数 
	public int selectCountByDateAndEmotion(PublicOpinion record);
    
    //根据日期和数据来源分类获取总记录数 
	public int selectCountByResultType(PublicOpinion record);
	
	//根据日期和数据来源分类和情感分类获取总记录数 
	public int selectCountByResultTypeAndEmotion(PublicOpinion record);
	
    //根据媒体类型、情感分类获取全部舆情数据集合
    public List<PublicOpinion> getTop10PublicOpinion(String resultType, String resultEmotion);
	
	//根据日期和是否关注获取收藏内容 
	public List<PublicOpinion> selectByDateAndIsfocus(PublicOpinion record);

}
