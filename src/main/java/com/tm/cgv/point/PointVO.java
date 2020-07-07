package com.tm.cgv.point;

import lombok.Data;

@Data
public class PointVO {

	private int num;
	private String memberNum;
	private int price;
	private String type;
	
	private String kind;
	
	public String getKind() {
		if(this.kind == null || this.kind.equals("")) {
			this.kind = "update";
		}
		return this.kind;
	}
}
