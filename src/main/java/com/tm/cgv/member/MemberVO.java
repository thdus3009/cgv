package com.tm.cgv.member;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class MemberVO extends User{

	private static final long serialVersionUID = 1L;

	private MemberBasicVO memberVO;
	
	public MemberVO(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
		// TODO Auto-generated constructor stub
	}

	public MemberVO(MemberBasicVO memberVO) {
		
		super(
			memberVO.getUid(), 
			memberVO.getPwd(), 
			memberVO.getAuthVOs().stream()
			.map(auth -> new SimpleGrantedAuthority(auth.getAuth()))
			.collect(Collectors.toList()));
	
		this.memberVO = memberVO;
	}
}
