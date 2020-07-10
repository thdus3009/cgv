package com.tm.cgv.couponInfo;

import java.sql.Date;

import lombok.Data;

@Data
public class CouponInfoVO {

	private int num;
	private String name;
	private String serialNum;
	private String pwd;
	private int price;
	private int type;
	private int count;
	private String sIssuance;
	private String eIssuance;
	
}
