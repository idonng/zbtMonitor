package com.zbt.yqjk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zbt.yqjk.pojo.Keyword;

public interface IKeywordDao {
	int deleteByPrimaryKey(Long keywordId);

	int insert(Keyword record);

	int insertSelective(Keyword record);

	Keyword selectByPrimaryKey(Long keywordId);

	int updateByPrimaryKeySelective(Keyword record);

	int updateByPrimaryKeyWithBLOBs(Keyword record);

	int updateByPrimaryKey(Keyword record);

	// 根据专题名称查找关键字
	public List<Keyword> selectKeywordsByKeywordFeature(
			@Param("keywordFeature") String keywordFeature,
			@Param("keywordIsenable") int keywordIsenable);

	// 查询专题名称
	public List<String> selectKeywordFeature(Keyword keyword);

	// 删除专题（更新关键字可用为0
	public int updateByKeywordFeature(Keyword keyword);

	// 更新关键字
	public int updateByKeywordName(Keyword keyword);

	// 激活关键字
	public int reactiveByKeywordName(Keyword keyword);
}
