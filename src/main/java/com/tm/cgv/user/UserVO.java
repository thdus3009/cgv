package com.tm.cgv.user;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Data;

@Data
public class UserVO extends User{

	private static final long serialVersionUID = 1L;

	private UserBasicVO userVO;
	
	public UserVO(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	public UserVO(UserBasicVO userVO) {
		super(userVO.getUsername(), userVO.getPassword(), 
				userVO.getAuth2VOs().stream().map(auth -> new SimpleGrantedAuthority(auth.getAuth()))
				.collect(Collectors.toList()));
		
		this.userVO = userVO;
		
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
