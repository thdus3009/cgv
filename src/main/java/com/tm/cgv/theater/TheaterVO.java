package com.tm.cgv.theater;

import lombok.Data;

@Data
public class TheaterVO {
	private int num;
	private int cinemaNum;//극장번호
	private String name;
	private int seatCount;
	private int filmType;//2D/3D
	
}
