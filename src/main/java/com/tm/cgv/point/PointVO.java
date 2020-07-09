package com.tm.cgv.point;

import lombok.Data;

@Data
public class PointVO {

	private int num;
	private String username;
	private int price;
	private String type; //CGV포인트(cgvGiftPrePayipt) ,CJ포인트(cjOnePointipt)
	
	private String kind;
	
	public String getKind() {
		if(this.kind == null || this.kind.equals("")) {
			this.kind = "update";
		}
		return this.kind;
	}
}
