package com.tm.cgv.member;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Data;

@Data
public class MemberVO extends User{

	private static final long serialVersionUID = 1L;

	private MemberBasicVO memberBasicVO;
	
	public MemberVO(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	public MemberVO(MemberBasicVO memberBasicVO) {
		super(memberBasicVO.getUsername(), memberBasicVO.getPassword(), 
				memberBasicVO.getAuthVOs().stream().map(auth -> new SimpleGrantedAuthority(auth.getAuth()))
				.collect(Collectors.toList()));
		
		this.memberBasicVO = memberBasicVO;
		
		// 위의 람다식 대체
//		List<SimpleGrantedAuthority> map = new ArrayList();
//				
//		for(Auth2VO auth2vo: userVO.getAuth2VOs()) {
//			SimpleGrantedAuthority simpleGrantedAuthority=new SimpleGrantedAuthority(auth2vo.getAuth());
//			map.add(simpleGrantedAuthority);
//			
//		}
	}
}
