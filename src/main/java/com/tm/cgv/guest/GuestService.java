package com.tm.cgv.guest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GuestService {
	
	@Autowired
	private GuestRepository guestRepository;
	
	public int guestInsert(GuestVO guestVO) throws Exception{
		return guestRepository.guestInsert(guestVO);
	}
	
	public GuestVO guestReservationCheck(GuestVO guestVO) throws Exception{
		return guestRepository.guestReservationCheck(guestVO);
	}
	
	public GuestVO guestFindPwd(GuestVO guestVO) throws Exception{
		return guestRepository.guestFindPwd(guestVO);
	}
	
	public int guestDelete(int reservationNum) throws Exception{
		return guestRepository.guestDelete(reservationNum);
	}
	

}
