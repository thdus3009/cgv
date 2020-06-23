package com.tm.cgv.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberRepository {

public MemberBasicVO read(String username) throws Exception;
	
	public long insert(MemberBasicVO memberBasicVO) throws Exception;
}
