package com.tm.cgv.review;

import com.tm.cgv.board.BoardVO;

import lombok.Data;

@Data
public class ReviewVO extends BoardVO {
	
	private int like;	//좋아요 수
	private int movieNum;	//영화번호
	private int mId;	//아이디
	private String fileName;	//이미지
	
	private int common;
	private int teenager;
	private int preference;
	
	private int people; //common(일반)+teenager(학생)+preference(우대)

	private String cinemaName; //영화관
	private String theaterName; //상영관
	
	private int movieTimeNum;
	private String screenDate; 
	private String screenTime;
	
	
// <BoardVO>	
//	private int num;
//	private String title;
//	private String writer;	//id, Filename
//	private String contents;
//	private String hireDate;
//	private int hit;
}
