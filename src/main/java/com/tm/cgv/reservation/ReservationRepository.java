package com.tm.cgv.reservation;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tm.cgv.util.Pager;

@Mapper
public interface ReservationRepository {

	public int reservationInsert(ReservationVO reservationVO) throws Exception;
	
	public ReservationVO reservationResultSelectOne(int num) throws Exception;
	
	public ReservationVO reservationSelectOne(ReservationVO reservationVO) throws Exception;
	
	public int reservationDelete(ReservationVO reservationVO) throws Exception;
	
	public List<ReservationVO> reservationSelectList(Pager pager) throws Exception;
	
	public long reservationNumCount(Pager pager) throws Exception;
	
	public List<ReservationVO> pointAccumlate(ReservationVO reservationVO) throws Exception;
	
	public List<ReservationVO> guestReservationList() throws Exception;
 	
	public List<ReservationVO> reservationAllList() throws Exception;
	
	public List<ReservationVO> myReservationList(ReservationVO reservationVO) throws Exception;
}
