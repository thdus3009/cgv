package com.tm.cgv.movieInfo;

import java.sql.Date;

import lombok.Data;

@Data
public class MovieInfoVO {
	
	private int num;
	private String title;//영화제목
	private String titleEng;//영어영화제목
	private String runtime;// 러닝타임
	private String director;//감독
	private String actor;//배우
	private String ganre;//장르
	private String ageLimit;//연령제한
	private String country;//국가
	private Date openDate;//개봉일
	private String contents; //영화줄거리
	private int visitor; //관람객
	private double rate;//예매율
	private double errRate;// 계란평점
	private Date createAt;//생성일
	private Date deleteAt;//삭제일
	
	
	
}
