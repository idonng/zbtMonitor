package com.zbt.yqjk.service;

import java.util.Date;

public interface ILogInfoService{
	
	public void insertLogInfo(Long logUserid,String logType,Date logDate, String logBody );

}
