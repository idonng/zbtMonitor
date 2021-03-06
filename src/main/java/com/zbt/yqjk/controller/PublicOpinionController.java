package com.zbt.yqjk.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.HashSet;
import java.util.Set;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zbt.yqjk.common.LogTool;
import com.zbt.yqjk.common.SendMail;
import com.zbt.yqjk.common.SendMsg;
import com.zbt.yqjk.common.TransType;
import com.zbt.yqjk.pojo.Keyword;
import com.zbt.yqjk.pojo.PageBean;
import com.zbt.yqjk.pojo.PublicOpinion;
import com.zbt.yqjk.pojo.Result;
import com.zbt.yqjk.pojo.ResultObject;
import com.zbt.yqjk.pojo.User;
import com.zbt.yqjk.service.IKeywordService;
import com.zbt.yqjk.service.IPublicOpinionService;


@Controller
@RequestMapping("/page")
@SuppressWarnings("all")
public class PublicOpinionController {
	@Resource
	private IKeywordService keywordService;
	@Resource
	private IPublicOpinionService publicOpinionService;
	
	private static final Logger logger = Logger.getLogger(PublicOpinionController.class);
	
	@ResponseBody
	@RequestMapping("/keywordFeature.do")
	public void toIndex(HttpServletRequest request,HttpServletResponse response){			
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		//专题名称
		String keywordFeature = request.getParameter("keywordFeature");
		String resultType = request.getParameter("ParamTypes");

		List<String> resultTypes1 = null;
		//分类参数(String)
		if(resultType.contains("#")){
			resultTypes1 = Arrays.asList(resultType.split("#"));
		}else{			
			resultTypes1 = Arrays.asList(resultType);
		}
		
		//分类参数(Integer)
		List<Integer> resultTypes = new ArrayList<Integer>(); 
		for(int i =0;i<resultTypes1.size();i++){
			resultTypes.add(new Integer(Integer.parseInt(resultTypes1.get(i))));				
		}
		
		//前台传进来的时间参数
		String beginToEnd = request.getParameter("beginToEnd");
		
		//查询的开始时间与结束时间
		Date begintime = null;
		Date endtime = null;
		if(beginToEnd.contains("#")){
			begintime = java.sql.Date.valueOf(beginToEnd.split("#")[0]);
			endtime = TransType.getDayAfter(beginToEnd.split("#")[1]);
		}else if(beginToEnd.equals("当天")){
			begintime = TransType.getToday();
			endtime = TransType.getAfter();
		}else if(beginToEnd.equals("一周内")){
			begintime = TransType.getOldWeek();
			endtime = TransType.getAfter();
		}else if(beginToEnd.equals("全部")){
			begintime = null;
			endtime = null;
		}
		//感情倾向性
		String emoType = request.getParameter("emoType");
		int resultEmotion=Integer.parseInt(emoType);
		
		//根据专题名称查找所属关键字对应的关键词条实体类
		List<Keyword> keywords = this.keywordService.selectKeywordsByKeywordFeature(keywordFeature,1);
		
		//记录总数
		int total;
		
		//传入舆情来源、感情倾向性、开始时间、结束时间、关键字词条集合，返回舆情总数
		total = publicOpinionService.getPublicOpinionRowsCount(
				resultTypes,resultEmotion,begintime,endtime,keywords);
		PageBean pageBean=new PageBean(total, request);
		
		//传入舆情来源、开始时间、结束时间、页对象、关键字词条集合，返回舆情集合
		List<PublicOpinion> publicOpinions = publicOpinionService.
				getPublicOpinionBykeywords(resultTypes,resultEmotion,begintime,endtime,pageBean,keywords);
		
		String urlString = null;
		for(int i=0;i<publicOpinions.size();i++){
			urlString = publicOpinions.get(i).getResultUrl();
			
			publicOpinions.get(i).setResultBody(
					TransType.getStandardDate(publicOpinions.get(i).getPublishedDate()));
			
			if(publicOpinions.get(i).getResultIsfocus() == 1){	
				publicOpinions.get(i).setResultTitle(
						"<a href='content.jsp?para="+publicOpinions.get(i).getResultKy()+"'  ><font color='red'>"// target='_blank'
						+publicOpinions.get(i).getResultTitle()+"</font></a>");
			}else{
				publicOpinions.get(i).setResultTitle(
						"<a href='content.jsp?para="+publicOpinions.get(i).getResultKy()+"' >"// target='_blank'
				+publicOpinions.get(i).getResultTitle()+"</a>");
			}
		}
		//把活动信息和活动总数存入map中
	    Map map=new HashMap();
	    map.put("list", publicOpinions);
	    map.put("total", total);	
		
	    try {
			response.getWriter().println(TransType.objectToJson(map));
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	  
	@RequestMapping("/emaPublic.do")
    @ResponseBody
    //根据key集合来发送邮件
	public int emaPublic(HttpServletRequest request,HttpServletResponse response) {
    	
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
		}
			
		String email = request.getParameter("email");
		
		//编号集合字符串
    	List<Long> keys = this.getKeys(request, response);
		List<PublicOpinion> pubs = this.publicOpinionService.getExportPublicOpinion(keys);
		
		String words = "";
		
		for (int i = 0; i < pubs.size(); i++) {
			 //情感分类  0:未分类;(默认为0)  1:正面; 2:中立; 3:负面;
			String type = null;
			if(pubs.get(i).getResultEffective() == 1){
				type = "正面";
			}else if(pubs.get(i).getResultEffective() == 2){
				type = "中立";
			}else if(pubs.get(i).getResultEffective() == 3){
				type = "负面";
			}else{
				type = "未分类";
			}
			
			words = words + "尊敬的领导:您好，检测到以下信息："
					+"<br />&nbsp;&nbsp;&nbsp;&nbsp;标题: "+pubs.get(i).getResultTitle()
					+"<br />&nbsp;&nbsp;&nbsp;&nbsp;作者: "+pubs.get(i).getResultAuthor()
					+"<br />&nbsp;&nbsp;&nbsp;&nbsp;时间: "+TransType.getStandardDate(pubs.get(i).getPublishedDate())
					+"<br />&nbsp;&nbsp;&nbsp;&nbsp;网址: <a  href="+pubs.get(i).getResultUrl()+" target=\"_blank\">"+pubs.get(i).getResultUrl()+"</a>"
					+"<br />&nbsp;&nbsp;&nbsp;&nbsp;属性: "+type
					+"<br />&nbsp;&nbsp;&nbsp;&nbsp;转发量: "+pubs.get(i).getResultForwarded()
					+"<br />&nbsp;&nbsp;&nbsp;&nbsp;内容: "+pubs.get(i).getResultBody()
					+"<br /><br /><br />";
		}
		
		try {
			SendMail.sendMessage(email,words);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		User user = (User)request.getSession().getAttribute("user");
		//操作写入日志
		new LogTool().insertLog(user.getUserId(), 7, "将编号："+this.getStringByList(keys)+"的记录通过邮件发送给"+email);
		return 1;
    }
	
	@RequestMapping("/phoPublic.do")
    @ResponseBody
    //根据key集合来发送短信
	public int phoPublic(HttpServletRequest request,HttpServletResponse response) {
    	
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
		}
		User user = (User)request.getSession().getAttribute("user");
		//编号集合字符串
		String phone = request.getParameter("phone");
		
    	List<Long> keys = this.getKeys(request, response);
		List<PublicOpinion> pubs = this.publicOpinionService.getExportPublicOpinion(keys);
			
		String text = null;
		SendMsg sendMsg = new SendMsg();
		for (int i = 0; i < pubs.size(); i++) {
			if(pubs.get(i).getResultBody().length()>60){
				pubs.get(i).setResultBody(pubs.get(i).getResultBody().substring(0,50));
			}
			text = "领导您好,我是"+user.getUserName()+"。 "
					+pubs.get(i).getResultUrl()
					+" 来自:"+pubs.get(i).getResultSource()
					+",标题:"+pubs.get(i).getResultTitle()
					+"。 主要内容:"+pubs.get(i).getResultBody();
			sendMsg.sends(phone, text);
		}
		 
		//操作写入日志
		new LogTool().insertLog(user.getUserId(), 6, "将编号："+this.getStringByList(keys)+"的记录通过短信发送给"+phone);
		return 1;
    }
	
    @RequestMapping("/delPublic.do")
    @ResponseBody
    //根据key集合来删除对应记录
	public int delPublic(HttpServletRequest request,HttpServletResponse response) {
    	
    	List<Long> keys = this.getKeys(request, response);
		
		int si = this.publicOpinionService.delPublicOpinion(keys);
		
		User user = (User)request.getSession().getAttribute("user");
		//操作写入日志
		new LogTool().insertLog(user.getUserId(), 2, "删除编号："+this.getStringByList(keys)+"的记录");
		return this.getCode(si, keys.size());
    }
    
    @RequestMapping("/focusPublic.do")
    @ResponseBody
    //根据key集合来收藏对应记录
	public int focusPublic(HttpServletRequest request,HttpServletResponse response) {    	
    	
    	List<Long> keys = this.getKeys(request, response);		
		
    	int si = this.publicOpinionService.focusPublicOpinion(keys);
    	User user = (User)request.getSession().getAttribute("user");
		//操作写入日志
		new LogTool().insertLog(user.getUserId(), 8, "收藏编号："+this.getStringByList(keys)+"的记录");
    	return this.getCode(si, keys.size());
    }
    
    @RequestMapping("/goodPublic.do")
    @ResponseBody
    //根据key集合来将对应记录改为正面分类
	public int goodPublic(HttpServletRequest request,HttpServletResponse response) {
    	
    	List<Long> keys = this.getKeys(request, response);
		
		int si = this.publicOpinionService.goodPublicOpinion(keys);
		User user = (User)request.getSession().getAttribute("user");
		//操作写入日志
		new LogTool().insertLog(user.getUserId(), 3, "将编号："+this.getStringByList(keys)+"的记录情感分类修改为正面！");
		return this.getCode(si, keys.size());
    }
    
    @RequestMapping("/midPublic.do")
    @ResponseBody
    //根据key集合来将对应记录改为中立分类
	public int midPublic(HttpServletRequest request,HttpServletResponse response) {
    	
    	List<Long> keys = this.getKeys(request, response);
		
		int si = this.publicOpinionService.midPublicOpinion(keys);
		User user = (User)request.getSession().getAttribute("user");
		//操作写入日志
		new LogTool().insertLog(user.getUserId(), 3, "将编号："+this.getStringByList(keys)+"的记录情感分类修改为中立！");
		return this.getCode(si, keys.size());
    }
    
    @RequestMapping("/badPublic.do")
    @ResponseBody
    //根据key集合来修改对应记录为负面分类
	public int badPublic(HttpServletRequest request,HttpServletResponse response) {    	
    	
    	List<Long> keys = this.getKeys(request, response);		
		
    	int si = this.publicOpinionService.badPublicOpinion(keys);
    	User user = (User)request.getSession().getAttribute("user");
		//操作写入日志
		new LogTool().insertLog(user.getUserId(), 3, "将编号："+this.getStringByList(keys)+"的记录情感分类修改为负面！");
    	return this.getCode(si, keys.size());
    }

    
    //通过请求来获取List<Long>的集合
    public static List<Long> getKeys(HttpServletRequest request,HttpServletResponse response){
    	
    	try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
		}
		
		//编号集合字符串
		String key = request.getParameter("keys");
		List<String> keys1 = null; 
		
		//编号参数(String)
		if(key.contains("、")){
			keys1 = Arrays.asList(key.split("、"));
		}else{			
			keys1 = Arrays.asList(key);
		}
		
		//编号参数(Integer)
		List<Long> keys = new ArrayList<Long>(); 
		for(int i =0;i<keys1.size();i++){
			keys.add(new Long(Integer.parseInt(keys1.get(i))));	
		}
    	return keys;
    }
    
    //获取返回值代号
    public static int getCode(int a,int b){   		
		int result=0;
		if(b == a){
			result=1;
		}else{
			result=0;
		}
		return result;
    }

    @RequestMapping("/Top10PublicOpinion.do")
    @ResponseBody
    //根据媒体类型、情感分类获取全部舆情数据集合
	public void Top10PublicOpinion(@RequestParam("resultType") String resultType,@RequestParam("resultEmotion") String resultEmotion,HttpServletRequest request,HttpServletResponse response) {

    	try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			logger.error("前台请求转换成utf-8格式失败！", e);
		}
    	
		List<PublicOpinion> top10=this.publicOpinionService.getTop10PublicOpinion(resultType, resultEmotion);
		 
		String urlString = null;
		for(int i=0;i<top10.size();i++){
			urlString = top10.get(i).getResultUrl();
			top10.get(i).setResultTitle(
					"<a href='content.jsp?para="+top10.get(i).getResultKy()+"'  >"// target='_blank'
			+top10.get(i).getResultTitle()+"</a>");
			
			top10.get(i).setResultBody(
					TransType.getStandardDate(top10.get(i).getPublishedDate()));
		}
	
	    Map<String, Object> map=new HashMap<String, Object>();
	    map.put("list", top10);
	
	    try {
			response.getWriter().println(TransType.objectToJson(map));
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
			logger.error("后台获得的舆情数据集合转化成Json格式失败！", e);
		}
    }
    
    @ResponseBody
    @RequestMapping("/getPublicOpinion.do")
    //add by qiujincheng
    //根据主键集合获取需要导出的舆情数据集合，并拼接对应的html内容
	public PublicOpinion getPublicOpinion(@RequestParam("resultKey") List resultKey,HttpServletRequest request,HttpServletResponse response) {
    	
    	//根据主键集合获取需要导出的舆情数据集合，
    	List<PublicOpinion> pOpinion=this.publicOpinionService.getExportPublicOpinion(resultKey);
		
		//根据专题名称查找所属关键字对应的关键词条实体类
		List<Keyword> keywords = this.keywordService.selectKeywordsByKeywordFeature("all",1);
		Set<String> keyWordSet = new LinkedHashSet<String>();
		for(Keyword keyword:keywords){
			//处理关键字中带“+”号，拆分数组后存到keyWordSet里面
			if(StringUtils.isNotBlank(keyword.getKeywordName())){
				String[] sKeyWord = keyword.getKeywordName().toString().split("\\+");
				for(int i=0;i<sKeyWord.length;i++){
					keyWordSet.add(sKeyWord[i]);
				}
			}
		}
		//获取舆情数据中的正文
		String sBody = pOpinion.get(0).getResultBody();
		sBody=sBody.replace("\n", "").replace("\r", "");
		//遍历关键词集合，将文本内容中的关键词标红显示
		for(String keyword:keyWordSet){
			String sDesKeyword ="";
			//判断正文中是否包含关键词
			if(sBody.indexOf(keyword.toString())>=0){
//				logger.info("匹配的关键词是："+keyword.toString());
				//增加判断，如果关键词替换过了，则遍历下一个关键词
				String sEnableKey = "<font color='red'>"+keyword.toString();
				if(sBody.contains(sEnableKey)){
					continue;
				}else{
					sDesKeyword = "<font color='red'>"+keyword.toString()+"</font>";
					sBody = sBody.replace(keyword.toString(), sDesKeyword);
				}
			}
		}
//		logger.info("替换后的Body内容是："+sBody);
		pOpinion.get(0).setResultBody(sBody);
		pOpinion.get(0).setResultRemarks1(TransType.getStandardDate(pOpinion.get(0).getPublishedDate()));
		return pOpinion.get(0);
	}
    
    //List组装String
    public static String getStringByList(List<Long> keys){
    	String key = "";
		for (int i = 0; i < keys.size(); i++) {
			if(i == 0){
				key = key+keys.get(i);
			}else{
				key = key+"、"+keys.get(i);
			}		
		}
    	return key;
    } 
}
