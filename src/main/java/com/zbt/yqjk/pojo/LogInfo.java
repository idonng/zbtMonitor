package com.zbt.yqjk.pojo;

import java.util.Date;

/**
 * 日志表实体类
 */
public class LogInfo {
    private Long logKy;//主键

    private Long logUserid;//操作人id

    private String logType;//操作类型:    1:添加;2:删除;3:更新;4:导入;5:导出

    private Date logDate; //操作时间
    
    private String logBody;//操作内容

    private String logRemarks1;//备注1

    private String logRemarks2;//备注2

    private String logRemarks3;//备注3

	public Long getLogKy() {
		return logKy;
	}

	public void setLogKy(Long logKy) {
		this.logKy = logKy;
	}

	public Long getLogUserid() {
		return logUserid;
	}

	public void setLogUserid(Long logUserid) {
		this.logUserid = logUserid;
	}

	public String getLogType() {
		return logType;
	}

	public void setLogType(String logType) {
		this.logType = logType;
	}

	public Date getLogDate() {
		return logDate;
	}

	public void setLogDate(Date logDate) {
		this.logDate = logDate;
	}

	public String getLogBody() {
		return logBody;
	}

	public void setLogBody(String logBody) {
		this.logBody = logBody;
	}

	public String getLogRemarks1() {
		return logRemarks1;
	}

	public void setLogRemarks1(String logRemarks1) {
		this.logRemarks1 = logRemarks1;
	}

	public String getLogRemarks2() {
		return logRemarks2;
	}

	public void setLogRemarks2(String logRemarks2) {
		this.logRemarks2 = logRemarks2;
	}

	public String getLogRemarks3() {
		return logRemarks3;
	}

	public void setLogRemarks3(String logRemarks3) {
		this.logRemarks3 = logRemarks3;
	}
}
