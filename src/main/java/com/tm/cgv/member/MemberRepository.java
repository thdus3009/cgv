package com.tm.cgv.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tm.cgv.util.Pager;

@Mapper
public interface MemberRepository {

	public MemberBasicVO read(String username) throws Exception;
	
	// 회원가입
	public int join(MemberBasicVO memberBasicVO) throws Exception;

	// 이미 등록된 id 인지 Check
	public MemberBasicVO memberIdCheck(MemberBasicVO memberBasicVO) throws Exception;
	
	// 이미 등록된 nick 인지 Check
	public MemberBasicVO memberNickCheck(MemberBasicVO memberBasicVO) throws Exception;
	
	// 이미 등록된 phone 번호인지 Check
	public MemberBasicVO phoneCheck(MemberBasicVO memberBasicVO) throws Exception;
	
	// pager를 위한 count 값 가져오기
	public Long memberCount(Pager pager) throws Exception;
	
	// 멤버 list 가져오기
	public List<MemberBasicVO> memberList(Pager pager) throws Exception;
	
	// 멤버 하나 지우기
	public int memberDelete(MemberBasicVO memberBasicVO) throws Exception;
}
