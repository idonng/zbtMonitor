package org.zbt.testmybatis;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
import com.zbt.yqjk.pojo.LogInfo;
import com.zbt.yqjk.pojo.User;
import com.zbt.yqjk.service.ILogInfoService;
import com.zbt.yqjk.service.IUserService;

@RunWith(SpringJUnit4ClassRunner.class)		//表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})
public class TestMyBatis {
	private static Logger logger = Logger.getLogger(TestMyBatis.class);
//	private ApplicationContext ac = null;
	@Resource
	private ILogInfoService logInfoService;
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
		   User uservo=new User();
			uservo.setUserAdmin("10000");
			uservo.setUserPwd("1");
		User	uservo1=null;
		uservo1=userService.selectUser(uservo);
		 System.out.println(uservo1.getUserName());  
		 
	 
		 System.out.println("2222222"); 
		// logger.info("值："+user.getUserName());
		//logger.info(JSON.toJSONString(user));
	}
}
