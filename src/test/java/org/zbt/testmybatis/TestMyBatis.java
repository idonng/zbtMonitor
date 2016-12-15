package org.zbt.testmybatis;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zbt.yqjk.common.TransType;
import com.zbt.yqjk.pojo.Keyword;
import com.zbt.yqjk.pojo.PageBean;
import com.zbt.yqjk.pojo.PublicOpinion;
import com.zbt.yqjk.service.IKeywordService;
import com.zbt.yqjk.service.IPublicOpinionService;

@RunWith(SpringJUnit4ClassRunner.class)		//表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})

public class TestMyBatis {
	@Resource
	private IKeywordService keywordService = null;
	@Resource
	private IPublicOpinionService publicOpinionService;
	
	@Test
	
	public void test1() {
		
		/*//根据专题名称查找所属关键字对应的关键词条实体类
		List<Keyword> keywords = this.keywordService.selectKeywordsByKeywordFeature("企业动态",1);
		PageBean pageBean = new PageBean();	
		
		//传入舆情来源、开始时间、结束时间、页对象、关键字词条集合，返回舆情集合
		List<PublicOpinion> publicOpinions = publicOpinionService.
				getPublicOpinionBykeywords(0,null,null,pageBean,keywords);
		
		String jsonString = null;
	
		try {
			jsonString = TransType.objectToJson(publicOpinions);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		System.out.println(jsonString);*/
		/*List<Keyword> keywords = this.keywordService.selectKeywordsByKeywordFeature("企业动态");
			
		//定义PageBean类
		PageBean pageBean = new PageBean();
		pageBean.setPageNum(1);
		
		//记录类别
		int resultType = 1;
		SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		//开始时间
		Date begintime = null;
		//结束时间
		Date endtime = null;
		try {
			begintime = dateFormat1.parse("2014-06-01 00:00:00");
			endtime = dateFormat1.parse("2016-10-25 00:00:00");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//查询行记录数
		int rowsCount = this.publicOpinionService.getPublicOpinionRowsCount(
				resultType,begintime,endtime,keywords);
		pageBean.setRowsCount(rowsCount);
		System.out.println("查询总记录数:"+pageBean.getRowsCount());
		
		//存储查询出的信息记录
		List<PublicOpinion> publicOpinions = new ArrayList<PublicOpinion>();
		*/
		/*
		 * 第一种：全部查询
		 */
		//全部查询对应页的内容
		/*publicOpinions = this.publicOpinionService.
				getPublicOpinionBykeywords(resultType,begintime,endtime,pageBean,keywords);		
		
		for(int i = 0;i<publicOpinions.size();i++){			
			new TransType();
			System.out.println(TransType.
					getStandardDate(publicOpinions.get(i).getPublishedDate()));
		}
		*/
		
		/*
		 * 第二种：根据类别查询
		 *	1:微博  2：新闻   3：论坛  4：博客  5：微信
		 */
		//根据类别查询对应页的内容
		/*publicOpinions = this.publicOpinionService.
				getPublicOpinionBykeywords(pageBean.getPageSize(),
						pageBean.getPageNum(), keywords);		
		
		for(int i = 0;i<publicOpinions.size();i++){			
			System.out.println(new TransType().
					getStandardDate(publicOpinions.get(i).getPublishedDate()));
		}*/
		
	}
}
