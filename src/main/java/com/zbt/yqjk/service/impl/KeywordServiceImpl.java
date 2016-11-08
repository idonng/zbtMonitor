package com.zbt.yqjk.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.zbt.yqjk.dao.IKeywordDao;
import com.zbt.yqjk.pojo.Keyword;
import com.zbt.yqjk.service.IKeywordService;

@Service("keywordService")
public class KeywordServiceImpl implements IKeywordService {
	@Resource
	private IKeywordDao keywordDao;

	@Override
	public int deleteByPrimaryKey(Long keywordId) {
		// TODO Auto-generated method stub
		return this.keywordDao.deleteByPrimaryKey(keywordId);
	}

	@Override
	public int insert(Keyword record) {
		// TODO Auto-generated method stub
		return this.keywordDao.insert(record);
	}

	@Override
	public int insertSelective(Keyword record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Keyword selectByPrimaryKey(Long keywordId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKeySelective(Keyword record) {
		// TODO Auto-generated method stub
		return this.keywordDao.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKeyWithBLOBs(Keyword record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Keyword record) {
		// TODO Auto-generated method stub
		return this.keywordDao.updateByPrimaryKey(record);
	}

	@Override
	// 根据专题名称查找所属关键字对应的关键词条实体类
	public List<Keyword> selectKeywordsByKeywordFeature(String keywordFeature,
			int keywordIsenable) {
		// TODO Auto-generated method stub
		return this.keywordDao.selectKeywordsByKeywordFeature(keywordFeature,
				keywordIsenable);
	}

	@Override
	// 获取专题名称
	public List<String> selectKeywordFeature(Keyword keyword) {
		// TODO Auto-generated method stub
		return this.keywordDao.selectKeywordFeature(keyword);

	}

	@Override
	// 删除专题（更新关键字可用为0）
	public int updateByKeywordFeature(Keyword keyword) {
		// TODO Auto-generated method stub
		return this.keywordDao.updateByKeywordFeature(keyword);
	}

	@Override
	// 更新关键字
	public int updateByKeywordName(Keyword keyword) {
		// TODO Auto-generated method stub
		return this.keywordDao.updateByKeywordName(keyword);
	}

	@Override
	// 激活关键字
	public int reactiveByKeywordName(Keyword keyword) {
		// TODO Auto-generated method stub
		return this.keywordDao.reactiveByKeywordName(keyword);
	}
}
