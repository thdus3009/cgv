package com.tm.cgv.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

	@Autowired
	private MemberRepository memberRepository;
	
	public MemberVO memberLogin(MemberVO memberVO) throws Exception{
		return memberRepository.memberLogin(memberVO);
	}
	
	public MemberVO memberIdCheck(String id) throws Exception{
		return memberRepository.memberIdCheck(id);
	}
	
	public int memberJoin(MemberVO memberVO) throws Exception{
		return memberRepository.memberJoin(memberVO);
	}
	
	public MemberVO memberSelect(MemberVO memberVO) throws Exception{
		return memberRepository.memberSelect(memberVO);
	}
	
	public int memberUpdate(MemberVO memberVO) throws Exception{
		return memberRepository.memberUpdate(memberVO);
	}
	
	public int memberDelete(MemberVO memberVO) throws Exception{
		return memberRepository.memberDelete(memberVO);
	}
	
}
