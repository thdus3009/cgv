package com.tm.cgv.util;


public class Pager_movieSelect {

	//마지막 페이지에서 5개 이하의 글이 출력되면 숨김기능 6개 채우면 보이기
	
	private Long curPage; //현재페이지
	private Integer perPage; //한페이지당 출력할 글 갯수(6개)
	
	private long curBlock; //현재 블록 (1블록:1~10페이지 2블록:11~20페이지 3블록:21~30페이지 ..)
	private long perBlock = 10L; //한 블록당 몇개의 페이지를 보여줄건지 (10페이지씩)

	private long totalCount; //전체 갯수(글 전체 갯수? ex.62개)
	private long totalPage; //전체 페이지 수(페이지 전체 갯수? ex.11페이지)
	private long totalBlock; //10+a개씩 보여지는게 몇개 인지? (ex.2블럭)
	
	private long startRow; //0 6 12 .. (한 페이지에서 시작번호와 끝번호)
	private long lastRow; //6 12 18 ..
	
	private long startNum; //블록 시작번호 (1 11 ..) (한 블록에서 시작페이지번호와 끝페이지번호)
	private long lastNum; //블록 끝번호 (10 20 ..)
	
	private String search;
	private String kind;
	
	
	public void makeRow() {
		this.startRow = (this.getCurPage()-1)*this.getPerPage(); 
		this.lastRow = this.getCurPage() * this.getPerPage();
	}
	
	public void makeBlock(long totalCount) {
		this.totalCount = totalCount;
		totalPage = totalCount/ this.perPage;
		//if(totalCount<10) {
		if(totalCount % this.perPage != 0) {  //만약 전체글갯수(62개)에서 한페이지당 출력할 갯수(6개)를 나눈만큼 페이지설정을 하는데 나머지가 생긴다면(2개), 
			totalPage++;					  //그나머지가 들어갈 페이지를 하나더 추가시켜 준다. >>but cgv는 나머지 생기면 출력x only6개씩만 출력 (이 설정은 지워준다.)
		}
		
		totalBlock = totalPage/this.getPerBlock(); //전체페이지갯수(10)에서 perBlock(10)을 나누어 준다. (1 출력 >> totalBlock) 
		if(totalPage%this.getPerBlock()!=0) {
			totalBlock++;
		}
		
		//몇번째 블록인가
		curBlock = this.curPage/this.perBlock; //현재 페이지에서 perBlock(10)을 나누어준다. 
		if(this.curPage%this.perBlock != 0) {
			curBlock++;						   //현재 페이지가9라면 10을 나누면 나머지가 생기기때문에, curBlock++해줘서 curBlock은 1이 된다.
		}
		
		startNum = ((curBlock-1)*this.perBlock)+1; //9페이지 까지 있을때 : ((1-1)*10)+1 =1 /((2-1)*10)+1 =11 ...
		this.lastNum = curBlock * this.perBlock;   //1*10 =10 /2*10 =20 ...
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
