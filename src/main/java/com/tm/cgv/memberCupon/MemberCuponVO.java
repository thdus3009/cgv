package com.tm.cgv.memberCupon;

import com.tm.cgv.cuponInfo.CuponInfoVO;

import lombok.Data;

@Data
public class MemberCuponVO {

	private int num;
	private String uid;
	private int cuponInfoNum;
	
	private CuponInfoVO cuponInfoVO;
	
}
