package com.tm.cgv.movieImage;

import lombok.Data;

@Data
public class MovieImageVO {
	
	private int num;//ai
	private int movieNum;//movie의 num과 연결되어있음.
	private String fileName;
	private String originName;

}
