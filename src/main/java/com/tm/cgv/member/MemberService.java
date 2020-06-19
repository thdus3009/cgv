package com.tm.cgv.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class MemberService implements UserDetailsService{

	@Autowired
	private MemberRepository memberRepository;
	
	public MemberBasicVO read(MemberBasicVO memberVO) throws Exception {
		
		System.out.println(memberVO.toString());
		
		return memberVO;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		System.out.println("Load User By UserName : " + username);
		
		// username = uid
		MemberBasicVO vo = new MemberBasicVO();
		vo.setUid(username);
		
		try {
			vo = memberRepository.read(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			// 로그 찍기
		}
		
		System.out.println("queried by member mapper: "+vo);
		return vo==null?null:new MemberVO(vo);
	}
}
