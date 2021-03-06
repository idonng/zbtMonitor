package com.zbt.yqjk.service;

import java.util.List;
import java.util.Map;

import com.github.abel533.echarts.Option;

/**
 * 类名: IEchartsReportService 
 * 功能: echarts所需option数据封装
 * 作者: vivira
 * 日期: 2016/12/3
 */
@SuppressWarnings("all")
public interface IEchartsReportService {

	/**
	 * 功能: 得到echarts饼图所需option数据
	 * 参数: 标题 title
	 * 参数: 副标题 subtext
	 * 参数: 图例名称 listName
	 * 参数: 数据  listValue
	 * 返回值类型: Option
	 * 时间:  2016/12/3 11:22
	 */
	public Option getpieOption(String title,String subtext, List listName, List<Map<String, Object>> listValue) ;
	/**
	 * 功能: 得到echarts折线图所需option数据
	 * 参数: 标题 title
	 * 参数: 副标题 subtext
	 * 参数: 图例名称 listName
	 * 参数: 数据  listValue
	 * 参数: x轴间隔 Interval
	 * 参数: x轴数据listX
	 * 参数: 图例名称 listName
	 * 参数: y轴数据  listValue
	 * 返回值类型: Option
	 * 时间:  2016/12/3 10:38
	 */
	public Option getLineOption(String title,String subtext,int Interval, List listX,  List listName, List<Map> listValue) ;

}
