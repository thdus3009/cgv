package com.tm.cgv.user;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserRepository {
	
	public UserBasicVO read(String username) throws Exception;
	
	public long insert(UserBasicVO userVO) throws Exception;
}
