package com.tm.cgv.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberRepository {
	
	public MemberBasicVO read(MemberBasicVO memberVO) throws Exception;
}
