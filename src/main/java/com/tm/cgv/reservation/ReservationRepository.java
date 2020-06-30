package com.tm.cgv.reservation;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReservationRepository {

	public int reservationInsert(ReservationVO reservationVO) throws Exception;
	
	
	public ReservationVO reservationResultSelectOne(int num) throws Exception;
	
}
