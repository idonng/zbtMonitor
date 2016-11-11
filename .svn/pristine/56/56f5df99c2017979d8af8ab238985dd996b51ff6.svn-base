package com.zbt.yqjk.common;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class ReportDate {

	public static String parseStringByBoth(Date date) {
		if (date == null)
			return null;
		DateFormat formatParse = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return formatParse.format(date);
	}

	// 判断月日时
	public static String JudgeHouse(String specifiedDay) {
		Calendar c = Calendar.getInstance();
		Date date = null;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(specifiedDay);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		c.setTime(date);
		int month = c.get(Calendar.MONTH) + 1;
		int day = c.get(Calendar.DATE);
		int house = c.get(Calendar.HOUR_OF_DAY);
		return month + "/" + day + " " + house + "时";
	}

	// 判断月日
	public static String JudgeDay(String specifiedDay) {
		Calendar c = Calendar.getInstance();
		Date date = null;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(specifiedDay);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		c.setTime(date);
		int month = c.get(Calendar.MONTH) + 1;
		int day = c.get(Calendar.DATE);
		return month + "/" + day;
	}

	// 判断年月
	public static String JudgeYearMonth(String specifiedDay) {
		Calendar c = Calendar.getInstance();
		Date date = null;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(specifiedDay);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		c.setTime(date);
		c.add(Calendar.MONTH, 1);

		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH);
		return year + "-" + month;
	}

	// 判断某年某月多少天
	public static int JudgeDateAmount(String specifiedDay) {
		Calendar cal = Calendar.getInstance();
		Date date = null;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(specifiedDay);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		cal.setTime(date);
		int maxDate = cal.getActualMaximum(Calendar.DATE);
		return maxDate;
	}

	/**
	 * 获得指定日期的前一天
	 * 
	 * @param specifiedDay
	 * @return
	 * @throws Exception
	 */
	public static String getDayBefore(String specifiedDay, int number) {// 可以用new
																		// Date().toLocalString()传递参数
		Calendar c = Calendar.getInstance();
		Date date = null;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(specifiedDay);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		c.setTime(date);
		int day = c.get(Calendar.DATE);
		c.set(Calendar.DATE, day - number);

		String dayBefore = new SimpleDateFormat("yyyy-MM-dd").format(c
				.getTime());
		return dayBefore;
	}

	/**
	 * 获得指定日期的后一天
	 * 
	 * @param specifiedDay
	 * @return
	 */
	public static String getDayAfter(String specifiedDay, int number) {
		Calendar c = Calendar.getInstance();
		Date date = null;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(specifiedDay);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		c.setTime(date);
		int day = c.get(Calendar.DATE);
		c.set(Calendar.DATE, day + number);

		String dayAfter = new SimpleDateFormat("yyyy-MM-dd")
				.format(c.getTime());
		return dayAfter;
	}

	/**
	 * 增加小时
	 * 
	 * @param specifiedDay
	 * @return
	 */
	public static String addHouse(String specifiedDay, int number) {
		Calendar c = Calendar.getInstance();
		Date date = null;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(specifiedDay);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		c.setTime(date);
		int house = c.get(Calendar.HOUR_OF_DAY);
		c.set(Calendar.HOUR_OF_DAY, house + number);

		String addHouse = new SimpleDateFormat("yy-MM-dd HH:mm").format(c
				.getTime());
		return addHouse;
	}

	/**
	 * 得到当前日期
	 * 
	 * @return
	 */
	public static String getCurrentDate() {
		Calendar c = Calendar.getInstance();
		Date date = c.getTime();
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd");
		return simple.format(date);
	}

	/**
	 * 判断一年之中多少天
	 * 
	 * @return
	 */
	public static int compareDate(String date1, String date2) {
		int n = 0;
		date1 = date1 == null ? getCurrentDate() : date1;
		date2 = date2 == null ? getCurrentDate() : date2;
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		try {
			c1.setTime(df.parse(date1));
			c2.setTime(df.parse(date2));
		} catch (Exception e3) {
			System.out.println("wrong occured");
		}
		while (!c1.after(c2)) { // 循环对比，直到相等，n 就是所要的结果
			n++;
			c1.add(Calendar.DATE, 1);
		}
		return n;
	}

	public static void main(String[] args) {
		// System.out.println(addHouse("2016-11-01 00:00", 4));
		// System.out.println(getDayBefore("2016-11-01", 7));
		System.out.println(JudgeDay("2016-1-31 00:00"));
	}
}
