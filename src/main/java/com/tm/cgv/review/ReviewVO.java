package com.tm.cgv.review;

import com.tm.cgv.board.BoardVO;

import lombok.Data;

@Data
public class ReviewVO {
//review (reviewWrite)
	private int num;
	private int reservationNum;
	private String contents;
	private int like;
	private int egg;
	private int charmPoint;
	private int emotionPoint;
	
// --------------------------------------------	
//reservation (reviewList)	

	private int movieNum;	//영화번호
	private int mId;		//아이디
	private String fileName;//이미지
	
	//인원수
	private int common;
	private int teenager;
	private int preference;
	
	private int people; //common(일반)+teenager(학생)+preference(우대)

	private String cinemaName; //영화관
	private String theaterName; //상영관
	
	
//movieInfo
	private String title;
//movieTime
	private int movieTimeNum;
	private String screenDate; 
	private String screenTime;


}
