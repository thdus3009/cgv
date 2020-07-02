package com.tm.cgv.cuponInfo;

import java.sql.Date;

import lombok.Data;

@Data
public class CuponInfoVO {

	private int num;
	private String name;
	private String serialNum;
	private String pwd;
	private int price;
	private int type;
	private int count;
	private Date sIssuance;
	private Date eIssuance;
	
}
