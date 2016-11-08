package com.zbt.yqjk.common;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONException;

import org.codehaus.jackson.map.ObjectMapper;

public class TransType {

	// 数据库时间转化成标准时间，类型为String
	public static String getStandardDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(date);
	}
	
	//获取当前时间
	public static Date getToday(){		
		Calendar c=Calendar.getInstance();
		c.add(Calendar.MONTH, +1);
		int y=c.get(Calendar.YEAR);
		int m=c.get(Calendar.MONTH);
		int d=c.get(Calendar.DATE);
		String date = y+"-"+m+"-"+d;
		return java.sql.Date.valueOf(date);
	}
	
	//获取当前时间
	public static Date getAfter(){		
		Calendar c=Calendar.getInstance();
		c.add(Calendar.MONTH, +1);
		c.add(Calendar.DATE, +1);
		int y=c.get(Calendar.YEAR);
		int m=c.get(Calendar.MONTH);
		int d=c.get(Calendar.DATE);
		String date = y+"-"+m+"-"+d;
		return java.sql.Date.valueOf(date);
	}
	
	//获取前一周的时间
	public static Date getOldWeek(){
		Calendar calendar = Calendar.getInstance();
        Date date = new Date(System.currentTimeMillis());
        calendar.setTime(date);
        calendar.add(Calendar.WEEK_OF_YEAR, -1);
        date = calendar.getTime();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return java.sql.Date.valueOf(sdf.format(date));		 
	}
	 /** 
     * 获得指定日期的后一天 
     *  
     * @param specifiedDay 
     * @return 
     */  
    public static Date getDayAfter(String specifiedDay) {  
        Calendar c = Calendar.getInstance();  
        Date date = null;  
        try {  
            date = new SimpleDateFormat("yyyy-MM-dd").parse(specifiedDay);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        c.setTime(date);  
        int day = c.get(Calendar.DATE);  
        c.set(Calendar.DATE, day + 1);  
  
        String dayAfter = new SimpleDateFormat("yyyy-MM-dd")  
                .format(c.getTime());  
        return java.sql.Date.valueOf(dayAfter);  
    }  
	//将List<String>转换成JSONArray
	public JSONArray getJsonByListString(List<String> lists){
		JSONArray jsonString = JSONArray.fromObject(lists);
		return jsonString;
	}
	

	// 实体类、List、Map等类型转成json类型的String
	public static String objectToJson(Object obj) throws JSONException,
			IOException {
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(obj);
		return jsonStr;
	}
}
