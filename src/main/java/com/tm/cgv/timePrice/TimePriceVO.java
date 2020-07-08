package com.tm.cgv.timePrice;

import lombok.Data;

@Data
public class TimePriceVO {
	
	private int num;
	private int cinemaNum; 
	private String eTime;
	private int filmType; //1:2D , 2:3D, 4:4D	
	private int commonPrice;
	private int teenagerPrice;
	
	
	private String morning; //조조
	private String night; //심야
	
	private String time;

}
