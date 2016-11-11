package com.zbt.yqjk.common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.codehaus.jackson.map.ObjectMapper;

import com.zbt.yqjk.pojo.LogInfo;

import net.sf.json.JSONArray;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;

public class Test extends LogTool{
	public static void main(String[] args) throws JSONException, IOException {
		 String newkwns = "a   1 ";
		 newkwns=newkwns.replaceAll("(\\s)+", " ").trim();
		 System.out.println(newkwns);
		 Set<String> set = new HashSet<String>();
		 for (int i = 0; i < newkwns.split(" ").length; i++) {
		 set.add(newkwns.split(" ")[i]);
		 }
		 for(String s:set){
			 System.out.println(s);
		 }
		/*Date d=new Date(Long.parseLong("1477897065881"));
		System.out.println(d);*/
		 
	/*	List<String> list1=new ArrayList<String>();
		list1.add("a");
		list1.add("b");
		List<String> list2=new ArrayList<String>();
		list2.add("c");
		list2.add("a");
			list1.removeAll(list2);
		System.out.println(list1.size());*/
		
		/*List<String> list = new ArrayList<String>();
		list.add("1");
		list.add("2");
		list.add("3");
		String key="";
		String result=new Test().toJson(key, list);
		System.out.println(result);*/
		
		/*
		
		JSONObject json = new JSONObject();
	 	Map<String, List<String>> map = new HashMap<String, List<String>>();
		List<String> list = new ArrayList<String>();
		list.add("1");
		list.add("2");
		list.add("3");
		map.put("key", list);
		List<String> list1 = new ArrayList<String>();
		list1.add("4");
		list1.add("5");
		map.put("value", list1);
		json.putAll(map); 
		System.out.println(json.toString());*/
		//json.add(JSONArray.fromObject(map)); 
		/*List<Map<String, String>> list1=new ArrayList<Map<String,String>>();
		Map<String, String> map1=new HashMap<String, String>();
		map1.put("key", "1");
		Map<String, String> map2=new HashMap<String, String>();
		map2.put("key", "2");
		list1.add(map1);
		list1.add(map2);
		Map<String, List<String>> map1 = new HashMap<String, List<String>>();
		List<String> list1 = new ArrayList<String>();
		list1.add("4");
		list1.add("5");
		list1.add("6");
		map1.put("key", list1);
		json.add(JSONArray.fromObject(list1));*/
	}
	 
	public String toJson(String key , List<String> list){
		JSONObject json = new JSONObject();
	 	Map<String, List<String>> map = new HashMap<String, List<String>>();
		map.put(key, list);
		json.putAll(map); 
		return json.toString();
	} 
	
     
}
