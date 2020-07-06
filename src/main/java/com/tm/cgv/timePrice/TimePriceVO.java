package com.tm.cgv.timePrice;

import lombok.Data;

@Data
public class TimePriceVO {
	
	private int num;
	private int cinemaNum; 
	private String sTime; 
	private String eTime;
	private int filmType; //0:2D , 1:3D, 2:4D
	private int commonPrice;
	private int teenagerPrice;
	private int type; //1:조조 , 2:심야 
	
	
	private String time;

}
