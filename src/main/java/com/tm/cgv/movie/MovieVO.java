package com.tm.cgv.movie;

import java.sql.Date;

import lombok.Data;

@Data
public class MovieVO {
	private int num;
	private String title;
	private String titleEng;
	private String runtime;
	private String director;
	private String actor;
	private String genre;
	private String ageLimit;
	private String country;
	private Date openDate;
	private String contents;
	private int visitor;
	private double rate;
	private double errRate;
	
	private Date createAt;
	private String kind;

	
	
	
}
