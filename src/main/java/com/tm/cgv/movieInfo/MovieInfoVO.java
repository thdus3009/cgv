package com.tm.cgv.movieInfo;

import java.sql.Date;
import java.util.List;

import com.tm.cgv.movieImage.MovieImageVO;
import com.tm.cgv.movieVideo.MovieVideoVO;

import lombok.Data;

@Data
public class MovieInfoVO {
	private int num;
	private String title;
	private String titleEng;
	private String runtime;
	private String director;
	private String actor;
	private String ganre;
	private String ageLimit;
	private String country;
	private Date openDate;
	private String contents;
	private int visitor;
	private double rate;
	private double errRate;
	
	private Date createAt;
	private String kind;
	
	//이미지, 영상 주소 list로 받아오기
	private List<MovieImageVO> movieImageVOs;//영화 이미지 파일
	
	/*
	 * private List<MovieVideoVO> movieVideoVOs;//영화 영상 링크 주소
	 */	
	

	
	
	
}
