package com.tm.cgv.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberRepository {

	public MemberBasicVO read(String username) throws Exception;
	
	// 회원가입
	public int join(MemberBasicVO memberBasicVO) throws Exception;

	// 이미 등록된 id 인지 Check
	public MemberBasicVO memberIdCheck(MemberBasicVO memberBasicVO) throws Exception;
	
	// 이미 등록된 phone 번호인지 Check
	public MemberBasicVO phoneCheck(MemberBasicVO memberBasicVO) throws Exception;
}
