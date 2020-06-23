package com.tm.cgv.member;

import java.util.List;

import lombok.Data;

@Data
public class MemberBasicVO {

	private String username;
	private String password;
	private String name;
	private String birth;
	private String phone;
	private String email;
	private String gender;
	private int age;
	private String nick;
	private String fileName;
	private int enabled;	// 0 : false / 1 : true
	
	private List<AuthVO> authVOs;
}
