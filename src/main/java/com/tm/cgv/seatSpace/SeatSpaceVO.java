package com.tm.cgv.seatSpace;

import lombok.Data;

@Data
public class SeatSpaceVO {

	private int num;
	private int theaterNum;
	private int rowOrCol; //0: row / 1:col
	private int index;
}
