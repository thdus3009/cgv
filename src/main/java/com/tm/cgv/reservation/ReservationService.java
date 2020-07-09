package com.tm.cgv.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tm.cgv.util.Pager;

@Service
public class ReservationService{

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
	
	public List<ReservationVO> reservationSelectList(Pager pager) throws Exception{
		
		pager.makeRow();
		long totalCount = reservationRepository.reservationNumCount(pager);
		pager.makeBlock(totalCount);
		
		return reservationRepository.reservationSelectList(pager);
	}
	
	public List<ReservationVO> pointAccumlate(ReservationVO reservationVO) throws Exception{
		return reservationRepository.pointAccumlate(reservationVO);
	}
	
}
