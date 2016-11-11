package com.zbt.yqjk.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		}
		
		//根据专题名称查找所属关键字对应的关键词条实体类
		List<Keyword> keywords = this.keywordService.selectKeywordsByKeywordFeature(keywordFeature,1);
		
		//记录总数
		int total;
		
		//传入舆情来源、开始时间、结束时间、关键字词条集合，返回舆情总数
		total = publicOpinionService.getPublicOpinionRowsCount(
				resultTypes,begintime,endtime,keywords);
		PageBean pageBean=new PageBean(total, request);
		
		//传入舆情来源、开始时间、结束时间、页对象、关键字词条集合，返回舆情集合
		List<PublicOpinion> publicOpinions = publicOpinionService.
				getPublicOpinionBykeywords(resultTypes,begintime,endtime,pageBean,keywords);
		
		String urlString = null;
		for(int i=0;i<publicOpinions.size();i++){
			urlString = publicOpinions.get(i).getResultUrl();
			
			publicOpinions.get(i).setResultBody(
					TransType.getStandardDate(publicOpinions.get(i).getPublishedDate()));
			
			if(publicOpinions.get(i).getResultIsfocus() == 1){	
				publicOpinions.get(i).setResultTitle(
						"<a href='"+urlString+"'><font color='red'>"
						+publicOpinions.get(i).getResultTitle()+"</font></a>");
			}else{
				publicOpinions.get(i).setResultTitle(
						"<a href='"+urlString+"'>"
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
	    
    @RequestMapping("/delPublic.do")
    @ResponseBody
    //根据key集合来删除对应记录
	public int delPublic(HttpServletRequest request,HttpServletResponse response) {
    	
    	List<Long> keys = this.getKeys(request, response);
		
		int si = this.publicOpinionService.delPublicOpinion(keys);
		return this.getCode(si, keys.size());
    }
    
    @RequestMapping("/focusPublic.do")
    @ResponseBody
    //根据key集合来收藏对应记录
	public int focusPublic(HttpServletRequest request,HttpServletResponse response) {    	
    	
    	List<Long> keys = this.getKeys(request, response);		
		
    	int si = this.publicOpinionService.focusPublicOpinion(keys);
    	return this.getCode(si, keys.size());
    }
    
    @RequestMapping("/goodPublic.do")
    @ResponseBody
    //根据key集合来将对应记录改为正面分类
	public int goodPublic(HttpServletRequest request,HttpServletResponse response) {
    	
    	List<Long> keys = this.getKeys(request, response);
		
		int si = this.publicOpinionService.goodPublicOpinion(keys);
		return this.getCode(si, keys.size());
    }
    
    @RequestMapping("/midPublic.do")
    @ResponseBody
    //根据key集合来将对应记录改为中立分类
	public int midPublic(HttpServletRequest request,HttpServletResponse response) {
    	
    	List<Long> keys = this.getKeys(request, response);
		
		int si = this.publicOpinionService.midPublicOpinion(keys);
		return this.getCode(si, keys.size());
    }
    
    @RequestMapping("/badPublic.do")
    @ResponseBody
    //根据key集合来修改对应记录为负面分类
	public int badPublic(HttpServletRequest request,HttpServletResponse response) {    	
    	
    	List<Long> keys = this.getKeys(request, response);		
		
    	int si = this.publicOpinionService.badPublicOpinion(keys);
    	return this.getCode(si, keys.size());
    }

    
    //通过请求来获取List<Long>的集合
    public static List<Long> getKeys(HttpServletRequest request,HttpServletResponse response){
    	
    	try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
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
}
