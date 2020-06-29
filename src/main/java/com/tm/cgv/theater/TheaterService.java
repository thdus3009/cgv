package com.tm.cgv.theater;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tm.cgv.cinema.CinemaVO;
import com.tm.cgv.seat.SeatRepository;
import com.tm.cgv.seat.SeatVO;
import com.tm.cgv.seatSpace.SeatSpaceRepository;
import com.tm.cgv.seatSpace.SeatSpaceVO;

@Service
public class TheaterService {
	@Autowired
	private TheaterRepository theaterRepository;
	
	@Autowired
	private SeatRepository seatRepository;
	
	@Autowired
	private SeatSpaceRepository seatSpaceRepository;
	
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
	public int theaterInsert(TheaterVO theaterVO, String [] row, String [] col, String [] grade, String [] row_space, String [] col_space) throws Exception{
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
				seatVO.setRowIdx(row[i]);
				seatVO.setColIdx(Integer.parseInt(col[i]));
				seatVO.setGrade(Integer.parseInt(grade[i]));
				result2 = seatRepository.seatInsert(seatVO);
			}
		}
		
		if(result2>0) {
			//seatSpaceVO Insert 하기
			//SeatNum 필요
			int theaterNum = seatRepository.theaterSelect();
			SeatSpaceVO seatSpaceVO = new SeatSpaceVO();
			
			//row 넣기
			if(row_space!=null && row_space.length>0) {
				for(int i=0; i<row_space.length; i++) {
					//다녀오기
					seatSpaceVO.setTheaterNum(theaterNum);
					seatSpaceVO.setRowOrCol(0);
					seatSpaceVO.setIndex(Integer.parseInt(row_space[i]));
					seatSpaceRepository.seatSpaceInsert(seatSpaceVO);
				}
			}
			
			if(col_space!=null && col_space.length>0) {
				for(int i=0; i<col_space.length; i++) {
					//다녀오기
					seatSpaceVO.setTheaterNum(theaterNum);
					seatSpaceVO.setRowOrCol(1);
					seatSpaceVO.setIndex(Integer.parseInt(col_space[i]));
					seatSpaceRepository.seatSpaceInsert(seatSpaceVO);
				}
			}
		}
		
		return result;
	}
	
	

	//Select
	public TheaterVO theaterSelect(int num) throws Exception {
		return theaterRepository.theaterSelect(num);
	}
	
	public List<SeatVO> theaterSeat(int num) throws Exception{
		return theaterRepository.theaterSeat(num);
	}
	
	public List<SeatSpaceVO> theaterSpace(int num) throws Exception{
		return theaterRepository.theaterSpace(num);
	}
	
	public String selectRow(int num) throws Exception{
		return theaterRepository.selectRow(num);
	}
	
	public int selectCol(int num) throws Exception{
		return theaterRepository.selectCol(num);
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
