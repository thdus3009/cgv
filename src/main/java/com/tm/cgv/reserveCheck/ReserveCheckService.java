package com.tm.cgv.reserveCheck;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReserveCheckService {

	@Autowired
	private ReserveCheckRepository reserveCheckRepository;
	
	public List<ReserveCheckVO> reservationCheckedSelect(ReserveCheckVO reserveCheckVO) throws Exception{
		return reserveCheckRepository.reservationCheckedSelect(reserveCheckVO);
	}
	
}
