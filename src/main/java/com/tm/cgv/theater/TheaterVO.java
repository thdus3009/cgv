package com.tm.cgv.theater;


import java.util.List;

import com.tm.cgv.seat.SeatVO;
import com.tm.cgv.seatSpace.SeatSpaceVO;
import lombok.Data;

@Data
public class TheaterVO {

	private int num;
	private int cinemaNum;
	private String name;
	private int seatCount;
	private int filmType;
	

	private List<SeatVO> seatVOs;
	private List<SeatSpaceVO> seatSpaceVOs;
	

}
