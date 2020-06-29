package com.tm.cgv.movieTime;

import lombok.Data;

@Data
public class MovieTimeVO {
	private int num;
	private int movieNum;
	private int theaterNum;
	private String screenDate;
	private String screenTime;
	private int remainSeat;
}
