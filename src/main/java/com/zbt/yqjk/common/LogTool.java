package com.zbt.yqjk.common;

import java.util.Date;
import javax.annotation.Resource;
import com.zbt.yqjk.service.ILogInfoService;
/**
 * 公共日志类
 */
public class LogTool {
	@Resource
	private ILogInfoService logInfoService;
	
	 
	/**
	 * 	记录日志 
	 * @param logUserid 用户id
	 * @param type 	       操作类型  1:添加;2:删除;3:更新;4:导入;5:导出
	 * @param logDate  操作时间
	 * @param logBody  操作内容
	 */
	public void insertLog(Long logUserid,int type, String logBody ){
		Date logDate =new Date();
		String logType="其他";
		switch(type){
		case 1:
			logType="添加"; 
			break;
		case 2:
			logType="删除";
			break;
		case 3:
			logType="更新";
			break;
		case 4:
			logType="导入";
			break;
		case 5:
			logType="导出";
			break;
		default:
				break;
		}
		logInfoService.insertLogInfo(logUserid, logType, logDate, logBody);
	}
}
