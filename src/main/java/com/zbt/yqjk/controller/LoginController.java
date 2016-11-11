package com.zbt.yqjk.controller;


 

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.zbt.yqjk.common.LogTool;
import com.zbt.yqjk.pojo.Result;
import com.zbt.yqjk.pojo.ResultObject;
import com.zbt.yqjk.pojo.User;
import com.zbt.yqjk.service.IUserService;

@Controller
@RequestMapping("/page")
public class LoginController {
	private static final Logger logger = Logger.getLogger(LoginController.class);
	@Resource
	private IUserService userService;
 
	@ResponseBody
	@RequestMapping("/login.do")
	public ResultObject<User> toIndex(
			@RequestParam("userAdmin") String userAdmin,
			@RequestParam("userPwd") String userPwd,
			HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		ResultObject<User> returnValue = new ResultObject<User>();
		User uservo = new User();
		uservo.setUserAdmin(userAdmin);
		uservo.setUserPwd(userPwd);
		uservo = userService.selectUser(uservo);
		if (uservo != null) {
			returnValue.setMessage("登录成功");
			returnValue.setStatus(1);
			returnValue.setSuccess(true);
			returnValue.setObject(uservo);
			session.setAttribute("user", uservo);
		} else {
			returnValue.setMessage("登录失败");
			returnValue.setStatus(0);
			returnValue.setSuccess(false);
		}
		return returnValue;
	}

	@RequestMapping("/index.do")
	public String toMain(HttpServletRequest request, Model model) {
		Result returnValue = new Result();
		returnValue.setMessage("跳转成功");
		returnValue.setStatus(1);
		returnValue.setSuccess(true);
		model.addAttribute(returnValue);
		return "index";
	}
	@ResponseBody
	@RequestMapping("/test.do")
	public String toJson(HttpServletRequest request, Model model) {
		Long logUserid=(long) 1;
		int  type=1;
		String logBody="11231231";
		logger.info("123456");
		 new LogTool().insertLog(logUserid, type, logBody);
		  return "";
	}

}
