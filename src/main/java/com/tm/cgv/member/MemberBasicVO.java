package com.tm.cgv.member;

import java.util.List;

import com.tm.cgv.auth.AuthVO;

import lombok.Data;

@Data
public class MemberBasicVO {

	private String username;
	private String password;
	private String name;
	private String birth;
	private String phone;
	private String email;
	private boolean gender;
	private int age;
	private String nick;
	private String fileName;
	private int enabled;	// 0 : false / 1 : true
	
	private List<AuthVO> authVOs;
}
