package com.tm.cgv.theater;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tm.cgv.cinema.CinemaVO;
import com.tm.cgv.seat.SeatRepository;
import com.tm.cgv.seat.SeatVO;

@Service
public class TheaterService {
	@Autowired
	private TheaterRepository theaterRepository;
	
	@Autowired
	private SeatRepository seatRepository;
	
	//List
	public List<TheaterVO> theaterList()throws Exception{
		
		return theaterRepository.theaterList();
	}
	
	
	
	//CinemaList
	public List<CinemaVO> cinemaList() throws Exception{
		return theaterRepository.cinemaList();
	}
	
	
	//Insert
	@Transactional
	public int theaterInsert(TheaterVO theaterVO, String [] row, String [] col, String [] grade) throws Exception{
		//theaterVO Insert 하고 오기
		int result = theaterRepository.theaterInsert(theaterVO);
		int result2 = 0;
		if(result>0) {
			System.out.println("성공 >.<");
			//맨 위에 있는 theater의 theaterNum 가져오기
			int theaterNum = theaterRepository.theaterNum();
			System.out.println("theaterNum : " + theaterNum);
			
			//seatVO Insert하기
			for(int i=0; i<row.length; i++) {
				SeatVO seatVO = new SeatVO();
				seatVO.setTheaterNum(theaterNum);
				seatVO.setRow(row[i]);
				seatVO.setCol(Integer.parseInt(col[i]));
				seatVO.setGrade(Integer.parseInt(grade[i]));
				seatRepository.seatInsert(seatVO);
			}
		}
		
		return result;
	}
	
	

	//Select
	public TheaterVO theaterSelect(int num) throws Exception{
		return theaterRepository.theaterSelect(num);
	}
	
	//Update
	public int theaterUpdate(TheaterVO  theaterVO) throws Exception{
		return theaterRepository.theaterUpdate(theaterVO);
	}
	
	//Delete
	public int theaterDelete(int num) throws Exception{
		System.out.println("service : " + num);
		return theaterRepository.theaterDelete(num);
	}
}
