package com.zbt.yqjk.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zbt.yqjk.common.ExportWord;
import com.zbt.yqjk.common.LogTool;
import com.zbt.yqjk.pojo.TemplateInfo;
import com.zbt.yqjk.pojo.User;
import com.zbt.yqjk.service.ITemplateService;

/**
 * 类名: TemplateController 
 * 功能: 舆情简报模板前后台处理——freemark导出
 * 作者: vivira
 * 日期: 2016/12/3
 */
@SuppressWarnings("all")
@Controller("templateController")
@RequestMapping("/page")
public class TemplateController {

	private static final Logger logger = Logger
			.getLogger(TemplateController.class);

	static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm"); // 获取系统时间

	@Resource
	private ITemplateService templateService;

	/**
	 *  功能: 实现flt文件生成功能的类对象
	 */
	ExportWord ew = new ExportWord();
	
	//得到xml路径
	String xmlPath = this.getClass().getResource("/").getPath();

	/**
	 * 功能: 实现模板添加
	 * 参数: 名称 tempName
	 * 参数: 内容 tempBody
	 * 参数: 是否默认 isDefault
	 * 参数: request
	 * 参数: response
	 * 返回值类型: Map<String,String>
	 * 时间:  2016/12/6 9:35
	 */
	@RequestMapping("/insertTemplate.do")
	@ResponseBody
	public Map<String, String> insert(
			@RequestParam("tempName") String tempName,
			@RequestParam("tempBody") String tempBody,
			@RequestParam("isDefault") String isDefault,
			HttpServletRequest request, HttpServletResponse response) {

		Map<String, String> map = new HashMap<String, String>();

		// User把值传到session里
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			map.put("result", "sessionfail");
		}
		if (templateService.selectByTempName(tempName) != 0) {
			map.put("result", "repeat");
		} else {
			int Default = 0;
			if (!(isDefault == null || "".equals(isDefault))) {
				Default = Integer.parseInt(isDefault);
			}
			TemplateInfo template = null;
			// 如果默认值为1，则将其他默认值设为0
			if (Default == 1) {

				template = templateService.selectByIsDefault(1);
				if (template != null) {
					isNotDefault(template, template.getTempId());
				}
			}
			template = new TemplateInfo();
			template.setIsDefault(Default);
			template.setTempName(tempName);
			template.setTempBody(tempBody);
			try {
				template.setCreateDate(sdf.parse(sdf.format(new Date())));
				template.setRcdDate(sdf.parse(sdf.format(new Date())));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				logger.error("日期转换失败！", e);
			}
			template.setCreateUserid(user.getUserId());
			template.setRcdUserid(user.getUserId());
			// 设置未删除
			template.setIsDelete(1);
			templateService.insert(template);

			// 新增flt文件
			try {
				ew.writerFltFile(xmlPath, template);
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			selectAll(request, response);
			// 操作写入日志
			new LogTool().insertLog(user.getUserId(), 1,
					"添加模板文件-" + template.getTempName());
			map.put("result", "ok");
		}
		map.put("name", tempName);
		return map;

	}

	/**
	 * 功能: 查找所有模板对象，将对象list放到session里前台调用
	 * 参数: request
	 * 参数: response
	 * 返回值类型: String
	 * 时间:  2016/12/6 10:28
	 */
	@RequestMapping("/selectAllTemplate.do")
	@ResponseBody
	public String selectAll(HttpServletRequest request,
			HttpServletResponse response) {

		List<TemplateInfo> templist = templateService.selectAll();

		TemplateInfo template = templateService.selectByIsDefault(1);
		// 将默认模板名称传给session，前台单选框设置选中
		if (template != null) {
			request.getSession().setAttribute("defaltId", template.getTempId());
		}
		// 前台展示模板
		request.getSession().setAttribute("templist", templist);

		return "ok";
	}

	/**
	 * 功能: 通过模板id返回模板对象，放到map里返回至前台
	 * 参数: 模板id tempId
	 * 参数: request
	 * 返回值类型: Map<String,String>
	 * 时间:  2016/12/6 14:23
	 */
	@ResponseBody
	@RequestMapping("/tempById.do")
	public Map<String, String> tempById(@RequestParam("tempId") String tempId,
			HttpServletRequest request) {

		long id = 0;
		if (!(tempId == null || "".equals(tempId))) {
			id = Long.parseLong(tempId);
		}
		TemplateInfo tempById = templateService.selectByPrimaryKey(id);
		Map<String, String> map = new HashMap<String, String>();
		map.put("Id", tempById.getTempId().toString());
		map.put("Name", tempById.getTempName());
		map.put("Defalt", tempById.getIsDefault().toString());
		map.put("Body", tempById.getTempBody());
		map.put("result", "ok");
		return map;
	}

	/**
	 * 功能: 实现模板更新
	 * 参数: id tempId
	 * 参数: 内容 tempBody
	 * 参数: 是否默认 isDefault
	 * 参数: request
	 * 参数: response
	 * 返回值类型: String
	 * 时间:  2016/12/6 14:35
	 */
	@ResponseBody
	@RequestMapping("/updateTemplate.do")
	public String update(@RequestParam("tempId") String tempId,
			@RequestParam("tempBody") String tempBody,
			@RequestParam("isDefault") String isDefault,
			HttpServletRequest request, HttpServletResponse response) {
		// User把值传到session里
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			return "sessionfail";
		}
		// 参数为空处理
		long id = 0;
		if (!(tempId == null || "".equals(tempId))) {
			id = Long.parseLong(tempId);
		}
		int Default = 0;
		if (!(isDefault == null || "".equals(isDefault))) {
			Default = Integer.parseInt(isDefault);
		}
		// 如果默认值为1，则将其他默认值设为0
		if (Default == 1) {
			TemplateInfo temp = templateService.selectByIsDefault(1);
			if (temp != null && temp.getTempId() != id) {
				isNotDefault(temp, temp.getTempId());
			}
		}
		TemplateInfo template = new TemplateInfo();
		template.setIsDefault(Default);
		template.setTempBody(tempBody);
		template.setRcdUserid(user.getUserId());
		try {
			template.setRcdDate(sdf.parse(sdf.format(new Date())));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			logger.error("最近操作日期转换失败！", e);
		}
		template.setTempId(id);
		templateService.updateByPrimaryKeySelective(template);
		// 修改flt文件
		TemplateInfo tempById = templateService.selectByPrimaryKey(id);
		try {
			ew.writerFltFile(xmlPath, tempById);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		selectAll(request, response);
		// 操作写入日志
		new LogTool().insertLog(user.getUserId(), 3,
				"更新模板文件-" + tempById.getTempName());
		return "ok";
	}

	/**
	 * 功能: 模板删除
	 * 参数: 模板id tempId
	 * 参数: request
	 * 参数: response
	 * 返回值类型: String
	 * 时间:  2016/12/6 10:50
	 */
	@RequestMapping("/deleteTemplate.do")
	@ResponseBody
	public String delete(@RequestParam("tempId") String tempId,
			HttpServletRequest request, HttpServletResponse response) {
		// User把值传到session里
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			return "sessionfail";
		}
		long id = 0;
		if (!(tempId == null || "".equals(tempId))) {
			id = Long.parseLong(tempId);
		}
		TemplateInfo template = new TemplateInfo();
		template.setIsDelete(0);

		template.setRcdUserid(user.getUserId());
		try {
			template.setRcdDate(sdf.parse(sdf.format(new Date())));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			logger.error("最近操作日期转换失败！", e);
		}
		template.setTempId(id);
		templateService.deleteByPrimaryKey(template);
		selectAll(request, response);
		// 删除flt文件
		TemplateInfo temp = templateService.selectByPrimaryKey(id);
		ew.deleteFlt(xmlPath, temp.getTempName());
		// 操作写入日志
		new LogTool().insertLog(user.getUserId(), 2,
				"删除模板文件为-" + temp.getTempName());
		return "ok";
	}

	/**
	 * 功能: 设置默认模板
	 * 参数: id tempId
	 * 参数: request
	 * 参数: response
	 * 返回值类型: String
	 * 时间:  2016/12/6 15:55
	 */
	@RequestMapping("/isDefaultTemplate.do")
	@ResponseBody
	public String isDefault(@RequestParam("tempId") String tempId,
			HttpServletRequest request, HttpServletResponse response) {

		long id = 0;
		if (!(tempId == null || "".equals(tempId))) {
			id = Long.parseLong(tempId);
		}
		// 判断如果有默认值，将其修改为0
		TemplateInfo template = templateService.selectByPrimaryKey(id);
		String templateName = null;
		Integer templateIsDefault = null;
		if (template != null) {
			templateName = template.getTempName();
			templateIsDefault = template.getIsDefault();
		}
		if (templateIsDefault == 1) {
			return "ok";
		} else {
			// User把值传到session里
			User user = (User) request.getSession().getAttribute("user");
			if (user == null) {
				return "sessionfail";
			}
			TemplateInfo tempDefault = templateService.selectByIsDefault(1);
			String tempDefaultName = null;

			if (tempDefault != null) {
				//将默认模板设置为非默认
				isNotDefault(tempDefault, tempDefault.getTempId());
				tempDefaultName = tempDefault.getTempName();
			}
			TemplateInfo temp = new TemplateInfo();
			// 设置默认值为1
			temp.setIsDefault(1);
			temp.setRcdUserid(user.getUserId());
			try {
				temp.setRcdDate(sdf.parse(sdf.format(new Date())));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				logger.error("最近操作日期转换失败！", e);
			}
			temp.setTempId(id);
			templateService.isDefault(temp);
			selectAll(request, response);
			// 操作写入日志

			new LogTool().insertLog(user.getUserId(), 3, "默认模板由"
					+ tempDefaultName + "变更为" + templateName);
			return "ok";
		}
	}

	/**
	 * 功能: 将默认模板设置为非默认0
	 * 参数: 模板对象 template
	 * 参数: id tempId
	 * 返回值类型: String
	 * 时间:  2016/12/6 16:32
	 */
	public String isNotDefault(TemplateInfo template, Long tempId) {
		template.setIsDefault(0);
		template.setTempId(tempId);
		templateService.isDefault(template);
		return "ok";
	}
}
