package com.zbt.yqjk.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.github.abel533.echarts.Option;
import com.github.abel533.echarts.axis.AxisLabel;
import com.github.abel533.echarts.axis.CategoryAxis;
import com.github.abel533.echarts.axis.ValueAxis;
import com.github.abel533.echarts.code.Magic;
import com.github.abel533.echarts.code.Orient;
import com.github.abel533.echarts.code.Tool;
import com.github.abel533.echarts.code.Trigger;
import com.github.abel533.echarts.code.X;
import com.github.abel533.echarts.data.PieData;
import com.github.abel533.echarts.feature.MagicType;
import com.github.abel533.echarts.json.GsonOption;
import com.github.abel533.echarts.series.Line;
import com.github.abel533.echarts.series.Pie;
import com.github.abel533.echarts.series.Series;
import com.zbt.yqjk.service.IEchartsReportService;

/**
 * 类名: EchartsReportServiceImpl 
 * 功能: echarts所需option数据封装
 * 作者: vivira
 * 日期: 2016/12/3
 */
@SuppressWarnings("all")
@Service("echartsService")
public class EchartsReportServiceImpl implements IEchartsReportService {

	/* (non-Javadoc)
	 * @see com.zbt.yqjk.service.IEchartsReportService#getLineOption(java.lang.String, java.lang.String, int, java.util.List, java.util.List, java.util.List)
	 */
	@Override
	public Option getLineOption(String title,String subtext,int Interval, List listX,  List listName, List<Map> listValue) {
		// TODO Auto-generated method stub
		Option option = new Option();
		 //工具栏  
		option.toolbox()
				.x("right")
				.show(true)
				.feature(new MagicType(Magic.line, Magic.bar).show(true),
						Tool.saveAsImage);
		option.title().x("center").text(title).textStyle().fontSize(20);
		option.title().x("center").subtext(subtext).subtextStyle().color("red");
		 //提示框  
		option.tooltip().trigger(Trigger.axis);
		option.calculable(true);
		int sizeName = listName.size();
		String[] ArrayName = (String[]) listName.toArray(new String[sizeName]);
		//图例
		option.legend().x("left").orient(Orient.vertical).data(ArrayName).itemWidth(8).padding(0);
		int xsize = listX.size();
		String[] xArray = (String[]) listX.toArray(new String[xsize]);
		CategoryAxis categoryAxis = new CategoryAxis();
		categoryAxis.name("日期");
		AxisLabel axisLabel = new AxisLabel();
		axisLabel.setRotate(45);
		axisLabel.setInterval(Interval);
		categoryAxis.data(xArray).setAxisLabel(axisLabel);
		option.xAxis(categoryAxis);
		ValueAxis valueAxis = new ValueAxis();
		option.yAxis(valueAxis);
		valueAxis.name("条数");
		//数据
		List<Series> seriess = new ArrayList<Series>() ;
		for (Map map : listValue) {
			Line line=new Line().smooth(true); 
			int s = ((List) map.get("value")).size();
			String[] sArray = (String[])((List) map.get("value")).toArray(new String[s]);
			line.name((String) map.get("name"));
			line.data(sArray); 
			seriess.add(line);
		}
		option.series(seriess);
		return option;
	}

	/* (non-Javadoc)
	 * @see com.zbt.yqjk.service.IEchartsReportService#getpieOption(java.lang.String, java.lang.String, java.util.List, java.util.List)
	 */
	@Override
	public Option getpieOption(String title,String subtext, List listName, List<Map<String, Object>> listValue) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		GsonOption option = new GsonOption(); 			
		option.toolbox()
				.show(true)
				.x(X.right)
				.feature(new MagicType(Magic.pie, Magic.funnel).show(true),
						Tool.saveAsImage);
		option.calculable(true);
		option.title().x("center").text(title).textStyle().fontSize(20);
		option.title().x("center").subtext(subtext).subtextStyle().color("red");
		option.tooltip().trigger(Trigger.item);
		option.calculable(true);
		int sizeName = listName.size();
		String[] ArrayName = (String[]) listName.toArray(new String[sizeName]);
		option.legend().x("left").orient(Orient.vertical).data(ArrayName);
		Pie pie = new Pie();
		String[] center = new String[] { "50%", "60%" };
		pie.name("访问来源").radius("65%").center(center);
		
		for (Map<String, Object> objectMap : listValue)
		{
			pie.data(new PieData(objectMap.get("name").toString(), objectMap.get("value"))); 
		}
		option.series(pie);
		return option;
	}

}
