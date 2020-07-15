package com.tm.cgv.pointHistory;

import lombok.Data;

@Data
public class PointHistoryVO {

	private int num;
	private String username;
	private int inputPrice;
	private int outputPrice;
	private String type;
	private String createAt;
	
}
