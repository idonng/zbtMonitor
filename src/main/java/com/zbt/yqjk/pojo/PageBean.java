package com.zbt.yqjk.pojo;

import javax.servlet.http.HttpServletRequest;

public class PageBean {

	private int rowSum;//总共记录
	
	private int rowSize;//页大小
	
	private int pageSize;//总页数
	
	private int currentPage;//当前页
	
	private int firstRows;//第一行
	
	private int maxRows;//最大行
	
	public PageBean(int rowSum, int rowSize, HttpServletRequest req) {
		
		this.rowSum = rowSum;
		String rows=req.getParameter("rowSize");
		
		if(rows!=null&& !"".equals(rows)){
			this.rowSize =Integer.parseInt(rows);
		}else this.rowSize = rowSize;
		currentPage = 1;
		if (req.getParameter("currentPage") != null && !"".equals(req.getParameter("currentPage")))
			currentPage = Integer.parseInt(req.getParameter("currentPage"));
//		this.currentPage = currentPage;
//		pageSize = rowSum % rowSize == 0 ? rowSum / rowSize : (rowSum / rowSize) + 1;
		pageSize = (rowSum + (this.rowSize - 1)) / this.rowSize;
		firstRows = (currentPage - 1) * this.rowSize;
		if (currentPage == pageSize) {
			maxRows = rowSum - firstRows;
		} else {
			maxRows = this.rowSize;
		}
	}
	
	public PageBean(int rowSum, HttpServletRequest req) {
		this(rowSum, 10, req);
	}
	
	public int getRowSum() {
		return rowSum;
	}

	public void setRowSum(int rowSum) {
		this.rowSum = rowSum;
	}

	public int getRowSize() {
		return rowSize;
	}

	public void setRowSize(int rowSize) {
		this.rowSize = rowSize;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getFirstRows() {
		return firstRows;
	}

	public void setFirstRows(int firstRows) {
		this.firstRows = firstRows;
	}

	public int getMaxRows() {
		return maxRows;
	}

	public void setMaxRows(int maxRows) {
		this.maxRows = maxRows;
	}
}
