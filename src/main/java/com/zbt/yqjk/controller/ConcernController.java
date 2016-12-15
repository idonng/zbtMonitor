package com.zbt.yqjk.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.zbt.yqjk.common.TransType;
import com.zbt.yqjk.pojo.PageBean;
import com.zbt.yqjk.pojo.PublicOpinion;
import com.zbt.yqjk.pojo.User;
import com.zbt.yqjk.service.IPublicOpinionService;
import freemarker.template.Configuration;

@Controller
@RequestMapping("/page")
public class ConcernController {
	
	private static final Logger logger = Logger.getLogger(ConcernController.class);

	static SimpleDateFormat sdf =new SimpleDateFormat("yyyyMMddHHmmss"); 
	
	private Configuration configuration = null;
	public ConcernController() {
		configuration = new Configuration();
		configuration.setDefaultEncoding("utf-8");
	}
	
	@Resource
	private IPublicOpinionService publicOpinionService;
	
	@RequestMapping("/exportFocus.do")
	public void ExportPublicOpinionIsFocus(@RequestParam("resultKeys") String resultKeys, 
			HttpServletRequest request,HttpServletResponse response) {

		List<Long> resultKeyIds =new ArrayList<Long>();
		String[] s=resultKeys.split(",");
		for(String key:s){
			resultKeyIds.add(Long.valueOf(key));
		}
		List<PublicOpinion> list = this.publicOpinionService.getExportPublicOpinion(resultKeyIds);
        
        Map<String, Object> dataMap = new HashMap<String, Object>();
        dataMap.put("PublicOpinion",list);
        //导出word文件
        ExportWord ew = new ExportWord();
     	ew.exported(dataMap, this.getClass().getResource("/").getPath(),"我的关注导出"+sdf.format(System.currentTimeMillis()), "FocusExportModel", response);
	}	
	
	@RequestMapping("/cancelFocus.do")
	@ResponseBody
	public String cancelFocus(@RequestParam("resultKeys") String resultKeys, 
			HttpServletRequest request,HttpServletResponse response) {

		List<Long> resultKeyIds =new ArrayList<Long>();
		String[] s=resultKeys.split(",");
		for(String key:s){
			resultKeyIds.add(Long.valueOf(key));
		}
		
		int f = this.publicOpinionService.setCancelPublicOpinion(resultKeyIds);
		User user = (User)request.getSession().getAttribute("user");
		String result="";
		if (f == resultKeyIds.size()) {
			result = "取消关注成功！";
			//操作写入日志
			new LogTool().insertLog(user.getUserId(), 3, "将编号："+this.getStringByList(resultKeyIds)+"的记录取消关注成功！");
		} else {
			result = "取消关注失败！";
			new LogTool().insertLog(user.getUserId(), 3, "将编号："+this.getStringByList(resultKeyIds)+"的记录取消关注失败！");
		}
		return result;
	}	   
	   
	@RequestMapping("/getPublicOpinionFocus.do")
	@ResponseBody
	public void toIndex(HttpServletRequest request,HttpServletResponse response){			
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			logger.error("前台请求转换成utf-8格式失败！", e);
		}
		
		//记录总数
		int total = publicOpinionService.getPublicOpinionIsFocusCount();
		PageBean pageBean=new PageBean(total, request);
		
		//传入页对象，返回已关注舆情集合
		List<PublicOpinion> publicOpinions = publicOpinionService.getPublicOpinionByIsFocus(pageBean);
		
		String urlString = null;
		for(int i=0;i<publicOpinions.size();i++){
			urlString = publicOpinions.get(i).getResultUrl();
			publicOpinions.get(i).setResultTitle(
//					"<a href='"+urlString+"'  target='_blank'>"
					"<a href='content.jsp?para="+publicOpinions.get(i).getResultKy()+"'  >"
			+publicOpinions.get(i).getResultTitle()+"</a>");
			
			publicOpinions.get(i).setResultBody(
					TransType.getStandardDate(publicOpinions.get(i).getPublishedDate()));
		}
	
	    Map<String, Object> map=new HashMap<String, Object>();
	    map.put("list", publicOpinions);
	    map.put("total", total);	
		
	    try {
			response.getWriter().println(TransType.objectToJson(map));
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			logger.error("后台获得的关注舆情数据集合转化成Json格式失败！", e);
		}
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
