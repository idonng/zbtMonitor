package com.zbt.yqjk.pojo;

import java.util.Date;

public class User {
	
	//主键(用户ID)
    private Long userId;

    //账户
    private String userAdmin;

    //密码
    private String userPwd;

    //姓名
    private String userName;

    //部门
    private String userDepa;

    //邮箱
    private String userEmail;

    //移动电话
    private String userPhone;

    //分机
    private String userTel;

    //是否启用  0：未启用  1：已启用
    private Integer userIdenable;

    //添加人
    private String userAddperson;

    //添加时间
    private Date userAdddate;
    
    //备注1
    private String userRemarks1;

    //备注2
    private String userRemarks2;

    //备注3
    private String userRemarks3;

    //备注4
    private String userRemarks4;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserAdmin() {
        return userAdmin;
    }

    public void setUserAdmin(String userAdmin) {
        this.userAdmin = userAdmin == null ? null : userAdmin.trim();
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd == null ? null : userPwd.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserDepa() {
        return userDepa;
    }

    public void setUserDepa(String userDepa) {
        this.userDepa = userDepa == null ? null : userDepa.trim();
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail == null ? null : userEmail.trim();
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone == null ? null : userPhone.trim();
    }

    public String getUserTel() {
        return userTel;
    }

    public void setUserTel(String userTel) {
        this.userTel = userTel == null ? null : userTel.trim();
    }

    public Integer getUserIdenable() {
        return userIdenable;
    }

    public void setUserIdenable(Integer userIdenable) {
        this.userIdenable = userIdenable;
    }

    public String getUserAddperson() {
        return userAddperson;
    }

    public void setUserAddperson(String userAddperson) {
        this.userAddperson = userAddperson == null ? null : userAddperson.trim();
    }

    public Date getUserAdddate() {
        return userAdddate;
    }

    public void setUserAdddate(Date userAdddate) {
        this.userAdddate = userAdddate;
    }

    public String getUserRemarks1() {
        return userRemarks1;
    }

    public void setUserRemarks1(String userRemarks1) {
        this.userRemarks1 = userRemarks1 == null ? null : userRemarks1.trim();
    }

    public String getUserRemarks2() {
        return userRemarks2;
    }

    public void setUserRemarks2(String userRemarks2) {
        this.userRemarks2 = userRemarks2 == null ? null : userRemarks2.trim();
    }

    public String getUserRemarks3() {
        return userRemarks3;
    }

    public void setUserRemarks3(String userRemarks3) {
        this.userRemarks3 = userRemarks3 == null ? null : userRemarks3.trim();
    }

    public String getUserRemarks4() {
        return userRemarks4;
    }

    public void setUserRemarks4(String userRemarks4) {
        this.userRemarks4 = userRemarks4 == null ? null : userRemarks4.trim();
    }
}