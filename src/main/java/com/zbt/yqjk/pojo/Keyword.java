package com.zbt.yqjk.pojo;

import java.util.Date;

public class Keyword {
	//关键词ID
    private Long keywordId;
    
    //专题名称
    private String keywordFeature;
    
    //关键词条
    private String keywordName;
    
    //添加人ID
    private Long addUserid;
    
    //添加时间
    private Date addDate;
    
    //最新修改人ID
    private Long rcdUserid;

    //最新修改时间
    private Date rcdDate;

    //是否启用       0：未启用；1：已启用；
    private Integer keywordIsenable;

    //备注
    private String keywordRemarks1;

    private String keywordRemarks2;

    private String keywordRemarks3;

    private String keywordRemarks4;


    public Long getKeywordId() {
        return keywordId;
    }

    public void setKeywordId(Long keywordId) {
        this.keywordId = keywordId;
    }

    public String getKeywordFeature() {
        return keywordFeature;
    }

    public void setKeywordFeature(String keywordFeature) {
        this.keywordFeature = keywordFeature == null ? null : keywordFeature.trim();
    }

    public String getKeywordName() {
        return keywordName;
    }

    public void setKeywordName(String keywordName) {
        this.keywordName = keywordName == null ? null : keywordName.trim();
    }

    public Long getAddUserid() {
        return addUserid;
    }

    public void setAddUserid(Long addUserid) {
        this.addUserid = addUserid;
    }

    public Date getAddDate() {
        return addDate;
    }

    public void setAddDate(Date addDate) {
        this.addDate = addDate;
    }

    public Long getRcdUserid() {
        return rcdUserid;
    }

    public void setRcdUserid(Long rcdUserid) {
        this.rcdUserid = rcdUserid;
    }

    public Date getRcdDate() {
        return rcdDate;
    }

    public void setRcdDate(Date rcdDate) {
        this.rcdDate = rcdDate;
    }

    public Integer getKeywordIsenable() {
        return keywordIsenable;
    }

    public void setKeywordIsenable(Integer keywordIsenable) {
        this.keywordIsenable = keywordIsenable;
    }
    public String getKeywordRemarks1() {
        return keywordRemarks1;
    }

    public void setKeywordRemarks1(String keywordRemarks1) {
        this.keywordRemarks1 = keywordRemarks1 == null ? null : keywordRemarks1.trim();
    }

    public String getKeywordRemarks2() {
        return keywordRemarks2;
    }

    public void setKeywordRemarks2(String keywordRemarks2) {
        this.keywordRemarks2 = keywordRemarks2 == null ? null : keywordRemarks2.trim();
    }

    public String getKeywordRemarks3() {
        return keywordRemarks3;
    }

    public void setKeywordRemarks3(String keywordRemarks3) {
        this.keywordRemarks3 = keywordRemarks3 == null ? null : keywordRemarks3.trim();
    }

    public String getKeywordRemarks4() {
        return keywordRemarks4;
    }

    public void setKeywordRemarks4(String keywordRemarks4) {
        this.keywordRemarks4 = keywordRemarks4 == null ? null : keywordRemarks4.trim();
    }
}
