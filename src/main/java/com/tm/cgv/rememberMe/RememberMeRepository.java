package com.tm.cgv.rememberMe;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RememberMeRepository {

	public int createNewToken(RememberMeVO rememberMeVO) throws Exception;

	public int updateToken(RememberMeVO rememberMeVO) throws Exception;
	
	public RememberMeVO findOne(RememberMeVO rememberMeVO) throws Exception;
	
	public int deleteByUsername(RememberMeVO rememberMeVO) throws Exception;
}
