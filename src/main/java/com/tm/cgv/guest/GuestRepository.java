package com.tm.cgv.guest;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GuestRepository {
	
	public int guestInsert(GuestVO guestVO) throws Exception;

}
