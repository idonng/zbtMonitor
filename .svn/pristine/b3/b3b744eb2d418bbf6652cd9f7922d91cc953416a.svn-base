package com.zbt.yqjk.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zbt.yqjk.pojo.Keyword;
import com.zbt.yqjk.pojo.PageBean;
import com.zbt.yqjk.pojo.PublicOpinion;

public interface IPublicOpinionDao {
	int deleteByPrimaryKey(Long resultKy);

    int insert(PublicOpinion record);

    int insertSelective(PublicOpinion record);
    
    //根据日期获取总记录数 
    int selectCountByDate(PublicOpinion record);
    
    //根据日期和情感分类获取总记录数 
    int selectCountByDateAndEmotion(PublicOpinion record);
    
    //根据日期和数据来源分类获取总记录数 
    int selectCountByResultType(PublicOpinion record);
    
    //根据日期和数据来源分类和情感分类获取总记录数 
  	int selectCountByResultTypeAndEmotion(PublicOpinion record);

    PublicOpinion selectByPrimaryKey(Long resultKy);

    int updateByPrimaryKeySelective(PublicOpinion record);

    int updateByPrimaryKey(PublicOpinion record);
    
    //根据关键词条集合获取分页的内容
    List<PublicOpinion> getPublicOpinionBykeywords(@Param("resultTypes") List<Integer> resultTypes,
			@Param("begintime") Date begintime,@Param("endtime") Date endtime,
			@Param("pageBean") PageBean pageBean,@Param("keywords") List<Keyword> keywords);
    
    //根据关键字词条集合获取总记录数
    int getPublicOpinionRowsCount(@Param("resultTypes") List<Integer> resultTypes,
			@Param("begintime") Date begintime,@Param("endtime") Date endtime,
    		@Param("keywords") List<Keyword> keywords);
    
    //根据key集合来删除对应记录
  	int delPublicOpinion(@Param("keys") List<Long> keys); 
  	
  	//根据key集合来收藏对应记录
  	int focusPublicOpinion(@Param("keys") List<Long> keys);
  	
  	//根据key集合来将对应记录改为正面分类
  	int goodPublicOpinion(@Param("keys") List<Long> keys);
    
  	//根据key集合来将对应记录改为中立分类
  	int midPublicOpinion(@Param("keys") List<Long> keys);
    
  	//根据key集合来修改对应记录为负面分类
  	int badPublicOpinion(@Param("keys") List<Long> keys);
    
  	//根据是否关注获取分页的内容
    List<PublicOpinion> getPublicOpinionByIsFocus(@Param("pageBean") PageBean pageBean);
    
    //根据是否关注获取分页的总记录数
    int getPublicOpinionIsFocusCount();
    
    //根据主键集合获取需要导出的舆情数据集合
    List<PublicOpinion> getExportPublicOpinion(@Param("resultKeys") List<Long> resultKeys);
    
    //根据主键集合取消关注 
    int setCancelPublicOpinion(@Param("resultKeys") List<Long> resultKeys);
}
