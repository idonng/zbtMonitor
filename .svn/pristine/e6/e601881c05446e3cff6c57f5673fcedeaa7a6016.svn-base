package com.zbt.yqjk.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import sun.misc.BASE64Encoder;

import com.zbt.yqjk.common.ExportWord;
import com.zbt.yqjk.common.ReportDate;
import com.zbt.yqjk.pojo.PublicOpinion;
import com.zbt.yqjk.pojo.TemplateInfo;
import com.zbt.yqjk.service.IPublicOpinionService;
import com.zbt.yqjk.service.ITemplateService;

@Controller
@RequestMapping("/page")
public class ReportController {

	@Resource
	private ITemplateService templateService;

	@Resource
	private IPublicOpinionService publicOpinionService;

	@RequestMapping("/exportReport.do")
	@ResponseBody
	public String exportReport(
			@RequestParam("publishedDate") String publishedDate,
			@RequestParam("type") String type, 
			HttpServletRequest request,
			HttpServletResponse response) {
		String currentPath = request.getSession().getServletContext()
				.getRealPath("/")
				+ "page\\tempImages\\";
		// 导出默认模板的内容（若需要增加单选，增加通过名称查询模板对象，此处调用）
		TemplateInfo temp = templateService.selectByIsDefault(1);
		/**
		 * 等待fusioncharts后台生成3张图片
		 */
		File ff = deleteImages(currentPath);
		// 当前系统时间
		long date;
		do {
			long now = System.currentTimeMillis();
			long time = ff.lastModified();
			date = now - time;
		} while (date < 15000);
		/**
		 * 导出word
		 */
		Map<String, String> map =show(publishedDate, type, request, response);
		map.put("line", getImageStr(currentPath + "line.jpg"));
		map.put("pie", getImageStr(currentPath + "pie.jpg"));
		map.put("negativeLine", getImageStr(currentPath + "negativeLine.jpg"));
		map.put("negativePie", getImageStr(currentPath + "negativePie.jpg"));

		String xmlPath = this.getClass().getResource("/").getPath();
		new ExportWord().exported(map, xmlPath, temp.getTempName(), response);

		//返回一个界面刷新
		return "../analyse.jsp";
	}

	@RequestMapping("/show.do")
	@ResponseBody
	public Map<String, String> show(
			@RequestParam("publishedDate") String publishedDate,
			@RequestParam("type") String type, HttpServletRequest request,
			HttpServletResponse response) {

		// 0:未分类;(默认为0) 1:正面: 2:中立; 3:负面;

		Map<String, String> map = new HashMap<String, String>();
		publishedDate = publishedDate.replaceAll("/", "-");
		String endTime = request.getParameter("endTime");
		if(endTime!=null){
			endTime=endTime.replaceAll("/", "-");
		}
		Integer positiveCount=0;
		Integer count = 0;
		Integer negativeCount =0;
		String title=null;
		int day=0;
		String begin=null;
		String end=null;
		if ("day".equals(type)) {
			day=1;
			title="日报";
			begin=publishedDate;
			end=ReportDate.getDayAfter(publishedDate, 1);
			count = selectByEmotion(begin,end, 4);
			negativeCount = selectByEmotion(begin,end, 3);
			positiveCount = selectByEmotion(begin,end, 1);
		} else if ("week".equals(type)) {
			day=7;
			title="周报";
			begin=ReportDate.getDayBefore(publishedDate, 6);
			end=ReportDate.getDayAfter(publishedDate, 1);
			count = selectByEmotion(begin,end, 4);
			negativeCount = selectByEmotion(begin,end,3);
			positiveCount = selectByEmotion(begin,end,1);
		} else if ("month".equals(type)) {
			title="月报";
			// 判断本月多少天
			Integer month = ReportDate.JudgeDateAmount(publishedDate);
			day=month;
			begin = ReportDate.JudgeYearMonth(publishedDate) + "-1";
			end = ReportDate.getDayAfter((ReportDate.JudgeYearMonth(publishedDate) + "-" + month),1);
			count = selectByEmotion(begin,end, 4);
			negativeCount = selectByEmotion(begin,end, 3);
			positiveCount = selectByEmotion(begin,end, 1);
		} else if ("self".equals(type)) {
			// 判断这期间多少天
			day = ReportDate.compareDate(publishedDate, endTime);
			title="报告";
			begin = publishedDate;
			end = ReportDate.getDayAfter(endTime, 1);
			count = selectByEmotion(begin,end,4);
			negativeCount = selectByEmotion(begin,end, 3);
			positiveCount = selectByEmotion(begin,end, 1);
		}
		//下载模板使用
		Integer negativePercent=negativeCount/count*100;
		Integer average=count/day;
		Integer negativeAverage=negativeCount/day;
		Integer positivePercent=negativeCount/count*100;
		Integer positiveAverage=negativeCount/day;
		
		String situation ="总体而言，"+begin+"至"+end+"期间，社会舆论趋势比较正常 ，采集的文章中确认为负面的文章所占比例少，显示了良好的舆情发展趋势和社会关注度。";
		
		map.put("situation", situation);
		map.put("begin", begin);
		map.put("end", end);
		map.put("average", average.toString());
		map.put("negativePercent", negativePercent.toString());
		map.put("negativeAverage", negativeAverage.toString());
		map.put("positivePercent", positivePercent.toString());
		map.put("positiveAverage", positiveAverage.toString());
		map.put("title", title);
		map.put("count", count.toString());
		map.put("negativeCount", negativeCount.toString());
		map.put("positiveCount", positiveCount.toString());
		
		//jsp页面展示
		request.getSession().setAttribute("situation", situation);
		request.getSession().setAttribute("negativePercent", negativePercent);
		request.getSession().setAttribute("negativeAverage", negativeAverage);
		request.getSession().setAttribute("positivePercent", positivePercent);
		request.getSession().setAttribute("positiveAverage", positiveAverage);
		request.getSession().setAttribute("average", average);
		request.getSession().setAttribute("title", title);
		request.getSession().setAttribute("count", count);
		request.getSession().setAttribute("negativeCount", negativeCount);
		request.getSession().setAttribute("positiveCount", positiveCount);
		return map;

	}

	@RequestMapping("/showLine.do")
	@ResponseBody
	public Map<String, Object[]> showLine(
			@RequestParam("publishedDate") String publishedDate,
			@RequestParam("type") String type,
			@RequestParam("emotion") String emotion,
			HttpServletRequest request, HttpServletResponse response) {

		String endTime = request.getParameter("endTime");
		int emo = Integer.parseInt(emotion);
		List<Map<String, String>> list = null;
		if ("day".equals(type)) {
			list = dayLine(publishedDate, emo);
		} else if ("week".equals(type)) {
			list = weekLine(publishedDate, emo);
		} else if ("month".equals(type)) {
			list = monthLine(publishedDate, emo);
		} else if ("self".equals(type)) {
			list = selfLine(publishedDate, endTime, emo);
		}
		Map<String, Object[]> map = new HashMap<String, Object[]>();
		Object[] objs1 = null;
		if (emo == 3) {
			objs1 = header("negativeLine","负面舆情趋势").toArray();
		} else {
			objs1 = header("line","总体舆情趋势").toArray();
		}
		Object[] objs2 = list.toArray();
		map.put("chart", objs1);
		map.put("data", objs2);
		return map;
	}

	@RequestMapping("/showPie.do")
	@ResponseBody
	public Map<String, Object[]> showPie(
			@RequestParam("publishedDate") String publishedDate,
			@RequestParam("type") String type,
			@RequestParam("emotion") String emotion,
			HttpServletRequest request, HttpServletResponse response) {

		String endTime = request.getParameter("endTime");
		if(endTime!=null){
			endTime=endTime.replaceAll("/", "-");
		}
		publishedDate = publishedDate.replaceAll("/", "-");
		int emo = Integer.parseInt(emotion);

		List<Map<String, String>> list = null;
		if ("day".equals(type)) {
			list = pie(publishedDate, ReportDate.getDayAfter(publishedDate, 1),
					emo);
		} else if ("week".equals(type)) {
			list = pie(ReportDate.getDayBefore(publishedDate, 6),
					ReportDate.getDayAfter(publishedDate, 1), emo);
		} else if ("month".equals(type)) {
			String begin = ReportDate.JudgeYearMonth(publishedDate) + "-1";
			// 判断本月多少天
			int month = ReportDate.JudgeDateAmount(publishedDate);
			String end = ReportDate.JudgeYearMonth(publishedDate) + "-" + month;
			list = pie(begin, ReportDate.getDayAfter(end, 1), emo);
		} else if ("self".equals(type)) {
			System.out.println("selfpie:" + publishedDate
					+ ReportDate.getDayAfter(endTime, 1));
			list = pie(publishedDate, ReportDate.getDayAfter(endTime, 1), emo);
		}
		Map<String, Object[]> map = new HashMap<String, Object[]>();
		Object[] objs1 = null;
		if (emo == 3) {
			objs1 = header("negativePie","负面舆情来源分类").toArray();
		} else {
			objs1 = header("pie","总体舆情来源分类").toArray();
		}
		Object[] objs2 = list.toArray();
		map.put("chart", objs1);
		map.put("data", objs2);
		return map;
	}

	private List<Map<String, String>> header(String imageName,String title) {
		Map<String, String> childmap = new HashMap<String, String>();

		childmap.put("rotateYAxisName", "0");
		childmap.put("caption", title);
		childmap.put("useEllipsesWhenOverflow", "0");
		childmap.put("xAxisName", "日期");
		childmap.put("yAxisName", "数量");
	    childmap.put("chartLeftMargin", "20");
		childmap.put("chartTopMargin", "20");
		childmap.put("chartRightMargin", "20");
		childmap.put("chartBottomMargin", "20");
		childmap.put("exportShowMenuItem", "0");
		childmap.put("labelDisplay", "Rotate");
		childmap.put("slantLabels", "1");
		childmap.put("bgColor", "FFFFFF,FFFFFF");
		childmap.put("exportHandler", "../../FCExporter");
		childmap.put("exportEnabled", "1");
		childmap.put("exportCallback", "FC_Exported");
		childmap.put("exportAtClient", "0");
		childmap.put("exportFileName", imageName);
		childmap.put("showExportDialog", "1");
		childmap.put("ShowAboutMenuItem", "0");
		childmap.put("showTooltipforWrappedLabels", "0");
		childmap.put("showPrintMenuItem", "0");
		childmap.put("exportAction", "save");

		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		list.add(childmap);

		return list;

	}

	// 每4小时查询一次数据
	private List<Map<String, String>> dayLine(String publishedDate, int emotion) {

		publishedDate = publishedDate.replaceAll("/", "-");

		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		for (int i = 0; i <= 24; i = i + 4) {

			Map<String, String> map = new HashMap<String, String>();

			String end = ReportDate.addHouse(publishedDate, i);
			String x=ReportDate.JudgeHouse(end);
			PublicOpinion po = new PublicOpinion();
			po.setBegintime(ReportDate.addHouse(publishedDate, i - 4));
			po.setEndtime(end);
			Integer in = 0;
			if (3 == emotion) {
				po.setResultEmotion(3);
				in = this.publicOpinionService.selectCountByDateAndEmotion(po);
				map.put("color", "cc0000");
			} else {
				in = this.publicOpinionService.selectCountByDate(po);
				map.put("color", "59b90e");
			}
			map.put("label", x);
			map.put("value", in.toString());
			list.add(map);
		}
		return list;

	}

	// 前推一周的数据
	private List<Map<String, String>> weekLine(String publishedDate, int emotion) {

		publishedDate = publishedDate.replaceAll("/", "-");

		List<Map<String, String>> list = new ArrayList<Map<String, String>>();

		for (int i = 6; i >= 0; i--) {

			Map<String, String> map = new HashMap<String, String>();

			String begin = ReportDate.getDayBefore(publishedDate, i);
			PublicOpinion po = new PublicOpinion();
			po.setBegintime(begin);
			po.setEndtime(ReportDate.getDayBefore(publishedDate, i - 1));
			Integer in = 0;
			if (3 == emotion) {
				po.setResultEmotion(3);
				in = this.publicOpinionService.selectCountByDateAndEmotion(po);
				map.put("color", "cc0000");
			} else {
				in = this.publicOpinionService.selectCountByDate(po);
				map.put("color", "59b90e");
			}
			String x=ReportDate.JudgeDay(begin);
			map.put("label", x);
			map.put("value", in.toString());
			list.add(map);
		}

		return list;
	}

	// 本月的数据
	private List<Map<String, String>> monthLine(String publishedDate,
			int emotion) {

		publishedDate = publishedDate.replaceAll("/", "-");

		// 判断本月多少天
		int month = ReportDate.JudgeDateAmount(publishedDate);

		List<Map<String, String>> list = new ArrayList<Map<String, String>>();

		int ss=0;
		for (int i = 1; i <= month; i++) {
			publishedDate = ReportDate.JudgeYearMonth(publishedDate) + "-" + i;

			Map<String, String> map = new HashMap<String, String>();

			String begin = ReportDate.getDayAfter(publishedDate, 0);

			PublicOpinion po = new PublicOpinion();
			po.setBegintime(begin);
			po.setEndtime(ReportDate.getDayAfter(publishedDate, 1));
			String x = ReportDate.JudgeDay(begin);
			Integer in = 0;
			if (3 == emotion) {
				po.setResultEmotion(3);
				in = this.publicOpinionService.selectCountByDateAndEmotion(po);
				map.put("color", "cc0000");
			} else {
				in = this.publicOpinionService.selectCountByDate(po);
				map.put("color", "59b90e");
			}
			map.put("label", x);
			map.put("value", in.toString());
			list.add(map);
		}
		System.out.println(ss);
		return list;
	}

	// 自定义时间的数据
	private List<Map<String, String>> selfLine(String publishedDate,
			String endTime, int emotion) {

		publishedDate = publishedDate.replaceAll("/", "-");
		endTime = endTime.replaceAll("/", "-");
		// 判断这期间多少天
		int day = ReportDate.compareDate(publishedDate, endTime);

		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		if (day < 1) {
			dayLine(publishedDate, emotion);
		} else {
			for (int i = 0; i < day; i++) {

				Map<String, String> map = new HashMap<String, String>();

				String begin = ReportDate.getDayAfter(publishedDate, i);
				String end = ReportDate.getDayAfter(publishedDate, i + 1);
				PublicOpinion po = new PublicOpinion();
				po.setBegintime(begin);
				po.setEndtime(end);
				Integer in = 0;
				if (3 == emotion) {
					po.setResultEmotion(3);
					in = this.publicOpinionService
							.selectCountByDateAndEmotion(po);
					map.put("color", "cc0000");
				} else {
					in = this.publicOpinionService.selectCountByDate(po);
					map.put("color", "59b90e");
				}
				map.put("label", begin);
				map.put("value", in.toString());
				list.add(map);
			}
		}
		return list;
	}

	// 类别图
	private List<Map<String, String>> pie(String begintime, String endtime,
			int emotion) {

		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		for (int i = 1; i <= 5; i++) {
			Map<String, String> map = new HashMap<String, String>();

			PublicOpinion po = new PublicOpinion();
			po.setBegintime(begintime);
			po.setEndtime(endtime);
			po.setResultType(i);
			Integer in = 0;
			if (3 == emotion) {
				po.setResultEmotion(3);
				in = this.publicOpinionService
						.selectCountByResultTypeAndEmotion(po);
			} else {
				in = this.publicOpinionService.selectCountByResultType(po);
			}
			if (i == 1) {
				map.put("label", "微博");
			} else if (i == 2) {
				map.put("label", "新闻");
			} else if (i == 3) {
				map.put("label", "论坛");
			} else if (i == 4) {
				map.put("label", "博客");
			} else if (i == 5) {
				map.put("label", "微信");
			} else {
				map.put("label", "");
			}
			map.put("value", in.toString());
			list.add(map);
		}
		return list;
	}

	private int selectByEmotion(String begintime, String endtime, int emotion) {

		PublicOpinion po = new PublicOpinion();
		po.setBegintime(begintime);
		po.setEndtime(endtime);
		Integer in = 0;
		if(emotion==4){
			in=this.publicOpinionService.selectCountByDate(po);
		}else{
		 po.setResultEmotion(emotion);
		 in = this.publicOpinionService.selectCountByDateAndEmotion(po);
		}
		return in;

	}

	private File deleteImages(String path) {
		File dir = new File(path);
		if (dir.isDirectory()) {
			String[] children = dir.list();
			for (String fileName : children) {
				new File(path + fileName).delete();
			}
		}
		return dir;
	}

	private String getImageStr(String imgFile) {
		InputStream in = null;
		byte[] data = null;
		try {
			in = new FileInputStream(new File(imgFile));
			data = new byte[in.available()];
			in.read(data);
			in.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		BASE64Encoder encoder = new BASE64Encoder();
		return encoder.encode(data);
	}

}
