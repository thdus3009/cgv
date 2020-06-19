package com.tm.cgv.member;

import java.util.List;

import lombok.Data;

@Data
public class MemberBasicVO {

	private int num;
	private String uid;
	private String pwd;
	private String name;
	private String birth;
	private String phone;
	private String email;
	private String gender;
	private String age;
	private String nick;
	private String fileName;
	private int enabled;	// 0 : false / 1 : true
	private List<AuthVO> authVOs;
}
