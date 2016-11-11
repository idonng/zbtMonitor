package com.zbt.yqjk.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.zbt.yqjk.dao.ILogInfoDao;
import com.zbt.yqjk.pojo.LogInfo;
import com.zbt.yqjk.service.ILogInfoService;

@Service("logInfoService")
public class LogInfoServiceImpl implements ILogInfoService {
	@Resource
	private ILogInfoDao logInfoDao;

	@Override
	public void insertLogInfo(Long logUserid,String logType,Date logDate, String logBody ) {
		// TODO Auto-generated method stub
		LogInfo li=new LogInfo();
		li.setLogUserid(logUserid);
		li.setLogType(logType);
		li.setLogDate(logDate);
		li.setLogBody(logBody);
		this.logInfoDao.insertLogInfo(li);
	}
 
}
