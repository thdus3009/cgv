package com.tm.cgv.guest;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GuestRepository {
	
	public int guestInsert(GuestVO guestVO) throws Exception;
	
	public GuestVO guestReservationCheck(GuestVO guestVO) throws Exception;
	
	public GuestVO guestFindPwd(GuestVO guestVO) throws Exception;

	public int guestDelete(int reservationNum) throws Exception;
}
