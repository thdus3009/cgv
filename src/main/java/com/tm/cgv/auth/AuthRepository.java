package com.tm.cgv.auth;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AuthRepository {
	
	// 회원가입
	public int join(AuthVO memberBasicVO) throws Exception;
}
