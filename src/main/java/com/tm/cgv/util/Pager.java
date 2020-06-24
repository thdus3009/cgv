package com.tm.cgv.util;

public class Pager {

	private Long curPage;
	private Integer perPage;
	
	private long curBlock;
	private long perBlock = 5L;

	private long totalCount;
	private long totalPage;
	private long totalBlock;
	
	private long startRow;
	private long lastRow;
	
	private long startNum;
	private long lastNum;
	
	private String search;
	private String kind;
	
	
	public void makeRow() {
		this.startRow = (this.getCurPage()-1)*this.getPerPage();
		this.lastRow = this.getCurPage() * this.getPerPage();
	}
	
	public void makeBlock(long totalCount) {
		this.totalCount = totalCount;
		totalPage = totalCount/ this.perPage;
		if(totalCount % this.perPage != 0) {
			totalPage++;
		}
		
		totalBlock = totalPage/this.getPerBlock();
		if(totalPage%this.getPerBlock()!=0) {
			totalBlock++;
		}
		
		curBlock = this.curPage/this.perBlock;
		if(this.curPage%this.perBlock != 0) {
			curBlock++;
		}
		
		startNum = (curBlock-1)*this.perBlock+1;
		this.lastNum = curBlock * this.perBlock;
		if(totalPage <= this.lastNum) {
			this.lastNum = totalPage;
		}
		
	}
	
	public Long getCurPage() {
		if(this.curPage == null || this.curPage == 0) {
			this.curPage=1L;
		}
		return curPage;
	}
	public void setCurPage(Long curPage) {
		this.curPage = curPage;
	}
	public Integer getPerPage() {
		if(this.perPage == null || this.perPage == 0) {
			this.perPage=7;
		}
		return perPage;
	}
	public void setPerPage(Integer perPage) {
		System.out.println("aaaa: "+perPage);
		
		this.perPage = perPage;
	}
	public long getCurBlock() {
		return curBlock;
	}
	public void setCurBlock(long curBlock) {
		this.curBlock = curBlock;
	}
	public long getPerBlock() {
		return perBlock;
	}
	public void setPerBlock(long perBlock) {
		this.perBlock = perBlock;
	}
	public long getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(long totalPage) {
		this.totalPage = totalPage;
	}
	public long getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(long totalBlock) {
		this.totalBlock = totalBlock;
	}
	public long getStartRow() {
		return startRow;
	}
	public void setStartRow(long startRow) {
		this.startRow = startRow;
	}
	public long getLastRow() {
		return lastRow;
	}
	public void setLastRow(long lastRow) {
		this.lastRow = lastRow;
	}
	public long getStartNum() {
		return startNum;
	}
	public void setStartNum(long startNum) {
		this.startNum = startNum;
	}
	public long getLastNum() {
		return lastNum;
	}
	public void setLastNum(long lastNum) {
		this.lastNum = lastNum;
	}
	public String getSearch() {
		if(this.search == null) {
			this.search ="";
		}
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}

	public long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}
	
	
	
	
	
	
}
