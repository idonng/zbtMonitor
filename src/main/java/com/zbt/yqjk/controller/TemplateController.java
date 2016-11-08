package com.zbt.yqjk.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zbt.yqjk.pojo.TemplateInfo;
import com.zbt.yqjk.pojo.User;
import com.zbt.yqjk.service.ITemplateService;

@Controller
@RequestMapping("/page")
public class TemplateController {
	
	static SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm"); //获取系统时间
	
	@Resource
	private ITemplateService templateService;
	
	@RequestMapping("/insertTemplate.do")
	@ResponseBody
	public String insert(@RequestParam("tempName") String tempName, @RequestParam("tempBody") String tempBody,@RequestParam("isDefault")String isDefault,
			HttpServletRequest request,HttpServletResponse response){
		TemplateInfo template=null;
		//如果默认值为1，则将其他默认值设为0
		int Default=Integer.parseInt(isDefault);
		if(Default==1){
			template=templateService.selectByIsDefault(1);
			if(template!=null){
				isNotDefault(template,template.getTempId());
				Default=1;
			}else {
				Default=0;
			}
		}
		template=new TemplateInfo();
		template.setIsDefault(Default);
		template.setTempName(tempName);
		template.setTempBody(tempBody);
		try {
			template.setCreateDate(sdf.parse(sdf.format(new Date())));
			template.setRcdDate(sdf.parse(sdf.format(new Date())));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//User把值传到session里
		User user=(User)request.getSession().getAttribute("user");
		template.setCreateUserid(user.getUserId());
		template.setRcdUserid(user.getUserId());
		//未删除
		template.setIsDelete(1);
		
		templateService.insert(template);
		return "ok"; 
	}
	
	@RequestMapping("/selectAllTemplate.do")
	@ResponseBody
	public List<TemplateInfo> selectAll(HttpServletRequest request,HttpServletResponse response){
		
		List<TemplateInfo> templist=templateService.selectAll();
		
		request.getSession().setAttribute("templist", templist);
		
		return templist; 
	}
	
	@ResponseBody
	@RequestMapping("/showTemplate")
	public TemplateInfo toIndex(@RequestParam("tempId") String tempId,HttpServletRequest request,Model model){
		
		TemplateInfo tempById=templateService.selectByPrimaryKey(Long.parseLong(tempId));
		
		request.getSession().setAttribute("tempById", tempById);
		
		return tempById;
	}
	
	@RequestMapping("/updateTemplate.do")
	@ResponseBody
	public String update(@RequestParam("tempName") String tempName, @RequestParam("tempBody") String tempBody,@RequestParam("isDefault")String isDefault,
			HttpServletRequest request,HttpServletResponse response){
		
		TemplateInfo template=null;
		//如果默认值为1，则将其他默认值设为0
		int Default=Integer.parseInt(isDefault);
		if(Default==1){
			template=templateService.selectByIsDefault(1);
			if(template!=null){
				isNotDefault(template,template.getTempId());
				Default=1;
			}else {
				Default=0;
			}
		}
		template=new TemplateInfo();
		template.setIsDefault(Default);
		template.setTempName(tempName);
		template.setTempBody(tempBody);
		//User把值传到session里
		User user=(User)request.getSession().getAttribute("user");
		template.setRcdUserid(user.getUserId());
		try {
			template.setRcdDate(sdf.parse(sdf.format(new Date())));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		TemplateInfo temp =(TemplateInfo)request.getSession().getAttribute("temp");
		template.setTempId(temp.getTempId());
		
		templateService.updateByPrimaryKeySelective(template);
		
		return "ok"; 
	}
	
	@RequestMapping("/deleteTemplate.do")
	@ResponseBody
	public String delete(@RequestParam("tempId") String tempId,
			HttpServletRequest request,HttpServletResponse response){
		
		TemplateInfo template=new TemplateInfo();
		template.setIsDelete(0);
		//User把值传到session里
		User user=(User)request.getSession().getAttribute("user");
		template.setRcdUserid(user.getUserId());
		try {
			template.setRcdDate(sdf.parse(sdf.format(new Date())));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		template.setTempId(Long.parseLong(tempId));
		templateService.deleteByPrimaryKey(template);
		
		return "ok"; 
	}
	
	@RequestMapping("/isDefaultTemplate.do")
	@ResponseBody
	public TemplateInfo isDefault(@RequestParam("tempId") String tempId,
			HttpServletRequest request,HttpServletResponse response){
		
		TemplateInfo template=null;
		
		template=templateService.selectByIsDefault(1);
		if(template!=null){
			isNotDefault(template,template.getTempId());
		}
		
		template=new TemplateInfo();
		
		template.setIsDefault(1);
		//User把值传到session里
		User user=(User)request.getSession().getAttribute("user");
		template.setRcdUserid(user.getUserId());
		try {
			template.setRcdDate(sdf.parse(sdf.format(new Date())));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		template.setTempId(Long.parseLong(tempId));
		templateService.isDefault(template);
		
		return template; 
	}
	//将其他默认模板的属性变成0
	public String isNotDefault(TemplateInfo template,Long tempId){
		template.setIsDefault(0);
		template.setTempId(tempId);
		templateService.isDefault(template);
		return "ok"; 
	}
}
