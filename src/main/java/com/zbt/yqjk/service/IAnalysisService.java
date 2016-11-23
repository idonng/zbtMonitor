package com.zbt.yqjk.service;

import java.util.Date;
import com.github.abel533.echarts.*;

public interface IAnalysisService {
	//数据查询
	public Option getAnalysisData(String resultType,Date begintime,
			Date endtime,String mediaType1,String mediaType2,String mediaType3,String mediaType4,String mediaType5);
	public Option getAnalysisBarData(String resultType,Date begintime,
			Date endtime,String mediaType1,String mediaType2,String mediaType3,String mediaType4,String mediaType5);
	public Option getAnalysisPieData(String resultType,Date begintime,
			Date endtime,String mediaType1,String mediaType2,String mediaType3,String mediaType4,String mediaType5);
	public Option getAnalysisMedPieData(String resultType,Date begintime,
			Date endtime,String mediaType1,String mediaType2,String mediaType3,String mediaType4,String mediaType5);
	public Option getEmoLineData(String resultType,Date begintime,
			Date endtime,String mediaType1,String mediaType2,String mediaType3,String mediaType4,String mediaType5);
}
