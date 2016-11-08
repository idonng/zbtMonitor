package com.zbt.yqjk.service;

import java.util.List;

import com.zbt.yqjk.pojo.Keyword;

public interface IKeywordService {
	public int deleteByPrimaryKey(Long keywordId);

	public int insert(Keyword record);

	public int insertSelective(Keyword record);

	public Keyword selectByPrimaryKey(Long keywordId);

	public int updateByPrimaryKeySelective(Keyword record);

	public int updateByPrimaryKeyWithBLOBs(Keyword record);

	public int updateByPrimaryKey(Keyword record);

	// 根据专题名称查找所属关键字对应的关键词条实体类
	public List<Keyword> selectKeywordsByKeywordFeature(String keywordFeature,
			int keywordIsenable);

	// 获取专题名称
	public List<String> selectKeywordFeature(Keyword keyword);

	// 删除专题（更新关键字可用为0）
	public int updateByKeywordFeature(Keyword keyword);

	// 更新关键字
	public int updateByKeywordName(Keyword keyword);

	// 激活关键字
	public int reactiveByKeywordName(Keyword keyword);
}
