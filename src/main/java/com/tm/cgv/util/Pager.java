package com.tm.cgv.util;


public class Pager {

	private Long curPage; //현재페이지
	private Integer perPage; //출력할 갯수
	
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
	private String sDate;
	private String eDate;
	
	
	public String getsDate() {
		return sDate;
	}

	public void setsDate(String sDate) {
		this.sDate = sDate;
	}

	public String geteDate() {
		return eDate;
	}

	public void seteDate(String eDate) {
		this.eDate = eDate;
	}

	public void makeRow() {
		this.startRow = (this.getCurPage()-1)*this.getPerPage(); //0 10 20
		this.lastRow = this.getCurPage() * this.getPerPage(); //10 20 30
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
		
		//몇번째 블록인가
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
		if(this.search == null || this.search.equals("")) {
			this.search ="";
		}
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKind() {
		if(this.kind == null) {
			this.kind ="";
		}
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
