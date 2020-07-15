package com.tm.cgv.movieImage;

import java.util.List;

import com.tm.cgv.movieVideo.MovieVideoVO;

import lombok.Data;

@Data
public class MovieImageVO {
	
	private int num;//ai
	private int movieNum;//movie의 num과 연결되어있음.
	private String fileName;
	private String originName;
	private int type;
	
	private List<MovieVideoVO> movieVideoVOs;

}
