package com.tm.cgv.util;


public class Pager_movieSelect {

	//마지막 페이지에서 5개 이하의 글이 출력되면 숨김기능 6개 채우면 보이기
	
	private Long curPage; //현재페이지
	private Integer perPage; //한페이지당 출력할 글 갯수(6개)
	
	private long curBlock; //현재 블록 (1블록:1~10 2블록:11~20 3블록:21~30 ..)
	private long perBlock = 10L; //몇개의 블록을 보여줄건지 (10개씩)

	private long totalCount; //전체 갯수(글 전체 갯수? ex.)
	private long totalPage; //전체 페이지 수(페이지 전체 갯수?)
	private long totalBlock; //10개씩 보여지는게 몇개 인지?
	
	private long startRow; //0 6 12 .. 
	private long lastRow; //6 12 18 ..
	
	private long startNum; //블록 시작번호 
	private long lastNum; //블록 끝번호
	
	private String search;
	private String kind;
	
	
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
			this.perPage=6;
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
