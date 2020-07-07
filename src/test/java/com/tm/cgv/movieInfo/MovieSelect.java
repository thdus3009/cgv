package com.tm.cgv.movieInfo;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.platform.commons.annotation.Testable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.tm.cgv.reservation.ReservationVO;
import com.tm.cgv.review.ReviewVO;

@SpringBootTest
class MovieSelect {
	
	@Autowired
	private MovieInfoRepository movieInfoRepository;
	
	@Test
	public void charm() throws Exception{
		ReservationVO reservationVO= new ReservationVO();
		reservationVO.setMovieNum(19);
		List<Integer> m = movieInfoRepository.charmPoint(reservationVO);
		for(int i=0;i<m.size();i++) {
			System.out.println(m.get(i)+"번");
		}
	}
	

}
