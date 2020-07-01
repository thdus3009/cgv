package com.tm.cgv.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
class ReservationService{

	@Autowired
	private ReservationRepository reservationRepository;
	
	public int reservationInsert(ReservationVO reservationVO) throws Exception{
		return reservationRepository.reservationInsert(reservationVO);
	}
	
	public ReservationVO reservationResultSelectOne(int num) throws Exception{
		return reservationRepository.reservationResultSelectOne(num);
	}
	
	public ReservationVO reservationSelectOne(ReservationVO reservationVO) throws Exception{
		return reservationRepository.reservationSelectOne(reservationVO);
	}
	
	public int reservationDelete(ReservationVO reservationVO) throws Exception{
		return reservationRepository.reservationDelete(reservationVO);
	}
	
}
