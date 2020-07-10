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

}
