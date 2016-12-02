package org.zbt.testmybatis;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.annotation.Resource;
import javax.print.DocFlavor.STRING;

import org.apache.log4j.Logger;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.alibaba.fastjson.JSON;
import com.zbt.yqjk.common.LogTool;
import com.zbt.yqjk.pojo.Keyword;
import com.zbt.yqjk.pojo.LogInfo;
import com.zbt.yqjk.pojo.User;
import com.zbt.yqjk.service.IKeywordService;
import com.zbt.yqjk.service.ILogInfoService;
import com.zbt.yqjk.service.IUserService;

@RunWith(SpringJUnit4ClassRunner.class)		//表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class TestMyBatis {
	private static Logger logger = Logger.getLogger(TestMyBatis.class);
//	private ApplicationContext ac = null;
	@Resource
	private IKeywordService keywordService;
	@Resource
	private IUserService userService;

//	@Before
//	public void before() {
//		ac = new ClassPathXmlApplicationContext("applicationContext.xml");
//		userService = (IUserService) ac.getBean("userService");
//	}

	@Test
	public void test1() {
		 System.out.println("11111111");
		 Keyword keyword = new Keyword();
			keyword.setKeywordIsenable(1);
			
			List<String> keywordFeatures= this.keywordService.selectKeywordFeature(keyword);
			 System.out.println(keywordFeatures);
			Set<String> set=new LinkedHashSet<String>();
			/*set.add("企业动态");
			set.add("领导人动态");
			set.add("产品动态");
			set.add("其他");*/
			for(String keywordFeature:keywordFeatures){
				set.add(keywordFeature);
			}
			 System.out.println(set);
		 
	 
		 System.out.println("2222222"); 
		// logger.info("值："+user.getUserName());
		//logger.info(JSON.toJSONString(user));
	}
}
