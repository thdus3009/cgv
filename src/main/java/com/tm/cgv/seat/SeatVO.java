package com.tm.cgv.seat;

import lombok.Data;

@Data
public class SeatVO {
	private int num;
	private int theaterNum;
	private String rowIdx;
	private int colIdx;
	private int grade;
	
}
