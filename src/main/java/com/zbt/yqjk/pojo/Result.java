package com.zbt.yqjk.pojo;

/**
 * 公共实体类
 */
public class Result {
	private String message;
	private int status;
	private boolean isSuccess;
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public boolean isSuccess() {
		return isSuccess;
	}
	public void setSuccess(boolean isSuccess) {
		this.isSuccess = isSuccess;
	} 
}
