package com.tm.cgv.event;

import java.sql.Date;
import java.util.List;

import com.tm.cgv.eventImage.EventImageVO;

import lombok.Data;

@Data
public class EventVO {
	private int num;
	private String category;
	private String title;
	private String contents;
	private Date startDate;
	private Date endDate;
	
	private List<EventImageVO> eventImageVOs;
	
}
