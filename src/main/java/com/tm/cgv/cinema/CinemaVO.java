package com.tm.cgv.cinema;

import lombok.Data;

@Data
public class CinemaVO {

	private int num;
	private String name;
	private String local;
	private String address;
	private String tel;
	private int totalTheater;
	private int totalSeat;
	private String trafficInfo;
	private String parkingInfo;
	private String intro;
	
	
	public String getLocal() {
		if(this.local == null || this.local.equals("")) {
			this.local = "서울";
		}
		return local;
	}

	
	
	
}
