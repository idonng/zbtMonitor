package com.zbt.yqjk.pojo;

import java.util.Date;

public class PublicOpinion {
	
	//主键（ID）
	private Long resultKy;

	//链接加密
    private String resultUrlmd5;

    //标题
    private String resultTitle;

    //数据来源
    private String resultSource;

    //数据来源分类  1：微博  2：新闻   3：论坛  4：博客  5：微信
    private Integer resultType;

    //关键字
    private String keyword;

    //作者
    private String resultAuthor;

    //转发量
    private Integer resultForwarded;

    //评论量
    private Integer resultComments;

    //发布时间
    private Date publishedDate;

    //首次抓取时间
    private Date fcrawlDate;

    //最新抓取时间
    private Date rcrawlDate;

    //情感分类  0:未分类;(默认为0)  1:正面; 2:中立; 3:负面;
    private Integer resultEmotion;

    //有效性  0:无效; 1:有效;(默认为1)
    private Integer resultEffective;

    //是否已读  0：未读   1：已读
    private Integer resultIsread;

    //是否收藏 0：未收藏 1：已收藏
    private Integer resultIsfocus;
   
    //链接
    private String resultUrl;

    //正文
    private String resultBody;

    //备注1
    private String resultRemarks1;

    //备注2
    private String resultRemarks2;

    //备注3
    private String resultRemarks3;

    //备注4
    private String resultRemarks4;

    //开始时间（数据库没有，方便查询增加）
    private String resultRemarks5;
    
    //结束时间（数据库没有，方便查询增加）
    private String begintime;

    public String getBegintime() {
		return begintime;
	}

	public void setBegintime(String begintime) {
		this.begintime = begintime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	//备注5
    private String endtime;

    public Long getResultKy() {
        return resultKy;
    }

    public void setResultKy(Long resultKy) {
        this.resultKy = resultKy;
    }

    public String getResultUrlmd5() {
        return resultUrlmd5;
    }

    public void setResultUrlmd5(String resultUrlmd5) {
        this.resultUrlmd5 = resultUrlmd5 == null ? null : resultUrlmd5.trim();
    }

    public String getResultTitle() {
        return resultTitle;
    }

    public void setResultTitle(String resultTitle) {
        this.resultTitle = resultTitle == null ? null : resultTitle.trim();
    }

    public String getResultSource() {
        return resultSource;
    }

    public void setResultSource(String resultSource) {
        this.resultSource = resultSource == null ? null : resultSource.trim();
    }

    public Integer getResultType() {
        return resultType;
    }

    public void setResultType(Integer resultType) {
        this.resultType = resultType;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword == null ? null : keyword.trim();
    }

    public String getResultAuthor() {
        return resultAuthor;
    }

    public void setResultAuthor(String resultAuthor) {
        this.resultAuthor = resultAuthor == null ? null : resultAuthor.trim();
    }

    public Integer getResultForwarded() {
        return resultForwarded;
    }

    public void setResultForwarded(Integer resultForwarded) {
        this.resultForwarded = resultForwarded;
    }

    public Integer getResultComments() {
        return resultComments;
    }

    public void setResultComments(Integer resultComments) {
        this.resultComments = resultComments;
    }

    public Date getPublishedDate() {
        return publishedDate;
    }

    public void setPublishedDate(Date publishedDate) {
        this.publishedDate = publishedDate;
    }

    public Date getFcrawlDate() {
        return fcrawlDate;
    }

    public void setFcrawlDate(Date fcrawlDate) {
        this.fcrawlDate = fcrawlDate;
    }

    public Date getRcrawlDate() {
        return rcrawlDate;
    }

    public void setRcrawlDate(Date rcrawlDate) {
        this.rcrawlDate = rcrawlDate;
    }

    public Integer getResultEmotion() {
        return resultEmotion;
    }

    public void setResultEmotion(Integer resultEmotion) {
        this.resultEmotion = resultEmotion;
    }

    public Integer getResultEffective() {
        return resultEffective;
    }

    public void setResultEffective(Integer resultEffective) {
        this.resultEffective = resultEffective;
    }

    public Integer getResultIsread() {
        return resultIsread;
    }

    public void setResultIsread(Integer resultIsread) {
        this.resultIsread = resultIsread;
    }

    public Integer getResultIsfocus() {
        return resultIsfocus;
    }

    public void setResultIsfocus(Integer resultIsfocus) {
        this.resultIsfocus = resultIsfocus;
    }
    
    public String getResultUrl() {
        return resultUrl;
    }

    public void setResultUrl(String resultUrl) {
        this.resultUrl = resultUrl == null ? null : resultUrl.trim();
    }

    public String getResultBody() {
        return resultBody;
    }

    public void setResultBody(String resultBody) {
        this.resultBody = resultBody == null ? null : resultBody.trim();
    }

    public String getResultRemarks1() {
        return resultRemarks1;
    }

    public void setResultRemarks1(String resultRemarks1) {
        this.resultRemarks1 = resultRemarks1 == null ? null : resultRemarks1.trim();
    }

    public String getResultRemarks2() {
        return resultRemarks2;
    }

    public void setResultRemarks2(String resultRemarks2) {
        this.resultRemarks2 = resultRemarks2 == null ? null : resultRemarks2.trim();
    }

    public String getResultRemarks3() {
        return resultRemarks3;
    }

    public void setResultRemarks3(String resultRemarks3) {
        this.resultRemarks3 = resultRemarks3 == null ? null : resultRemarks3.trim();
    }

    public String getResultRemarks4() {
        return resultRemarks4;
    }

    public void setResultRemarks4(String resultRemarks4) {
        this.resultRemarks4 = resultRemarks4 == null ? null : resultRemarks4.trim();
    }

    public String getResultRemarks5() {
        return resultRemarks5;
    }

    public void setResultRemarks5(String resultRemarks5) {
        this.resultRemarks5 = resultRemarks5 == null ? null : resultRemarks5.trim();
    }
}
