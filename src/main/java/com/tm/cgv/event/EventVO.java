package com.tm.cgv.event;

import java.util.Date;

import lombok.Data;

@Data
public class EventVO {
	private int num;
	private String category;
	private String title;
	private Date startDate;
	private Date endDate;
	
}
