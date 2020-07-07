package com.tm.cgv.theater;



import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tm.cgv.cinema.CinemaVO;
import com.tm.cgv.movieTime.MovieTimeVO;
import com.tm.cgv.seat.SeatRepository;
import com.tm.cgv.seat.SeatVO;
import com.tm.cgv.seatBooking.SeatBookingRepository;
import com.tm.cgv.seatSpace.SeatSpaceRepository;
import com.tm.cgv.seatSpace.SeatSpaceVO;
import com.tm.cgv.util.BitFilmType;

@Service
public class TheaterService {
	@Autowired
	private TheaterRepository theaterRepository;
	
	@Autowired
	private SeatRepository seatRepository;
	
	@Autowired
	private SeatSpaceRepository seatSpaceRepository;
	
	@Autowired
	private SeatBookingRepository seatBookingRepository;
	
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
	public int theaterInsert(TheaterVO theaterVO, int [] filmType, String [] row, String [] col, String [] grade, String [] row_space, String [] col_space) throws Exception{
		//theater insert 하기 전에 받아온 filmType을 비트플래그로 한 자리 수로 만들어서 theaterVO의 filmType에 넣어주기 >> select에서^^
		BitFilmType bitFilmType = new BitFilmType();

		System.out.println("======필름 타입=======");
		int film = 0;
		for(int i:filmType) {
			film += i;
		}
		theaterVO.setFilmType(film);
		
		
		
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
	@Transactional
	public int theaterUpdate(TheaterVO theaterVO, int [] filmType, String [] row, String [] col, String [] grade, String [] row_space, String [] col_space, String [] stop_row, String [] stop_col) throws Exception{
		//theater update
		System.out.println("======필름 타입=======");
		int film = 0;
		for(int i:filmType) {
			film += i;
		}
		theaterVO.setFilmType(film);
		
		theaterRepository.theaterUpdate(theaterVO);
//		System.out.println("service");
		//System.out.println(stop_row.length);
		//System.out.println(stop_col.length);
		//System.out.println(stop_row[0]);
		//System.out.println(stop_col[0]);
		
		//seat update insert
		//int result2=0;
		for(int i=0; i<row.length; i++) {
			SeatVO seatVO = new SeatVO();
			seatVO.setTheaterNum(theaterVO.getNum());
			System.out.println("theaterNum : " + seatVO.getTheaterNum());
			seatVO.setRowIdx(row[i]);
			System.out.println("row[i] : " + row[i]);
			seatVO.setColIdx(Integer.parseInt(col[i]));
			System.out.println("col[i] : " + col[i]);
			seatVO.setGrade(Integer.parseInt(grade[i]));
			System.out.println("grade[i] : " + grade[i]);
			//seatRepository.seatUpdate(seatVO);
			//싹 업데이트를 하고 나서
		}
		
		//여기서 ..reservation 어쩌구를 하기
		if(stop_row!=null) {
			for(int j=0; j<stop_row.length; j++) {
				SeatVO seatVO = new SeatVO();
				
	//			String str = stop_row[j];  //A
	//			System.out.println("str : " + str);
	//			char ch = str.charAt(j);
	//		
	//		    int num =  str.charAt(j)+65;
	//		    System.out.println("num : " + num);
	//		    
	//		    
	//			System.out.println("ch : " + ch);
	//			String r = String.valueOf(ch);
	//			
			
				//System.out.println("r : " + r);
				seatVO.setTheaterNum(theaterVO.getNum());
				seatVO.setRowIdx(stop_row[j]);	//문자로 바꿔 넣기
				seatVO.setColIdx(Integer.parseInt(stop_col[j]));
				int seatNum = seatRepository.selectSeatNum(seatVO);
				//찾아온 seatNum으,로 reservationNum 0으로 바꾸기
				//System.out.println("seatNum : " + seat.getNum());
				seatBookingRepository.updateReservationNum(seatNum);
			}
		}
		
		//seatSpace update insert
		//해당 theaterNum 다 삭제하고 다시 넣기
		
		
		
		
		return theaterRepository.theaterUpdate(theaterVO);
	}
	
	
	
	//Delete
	public int theaterDelete(int num) throws Exception{
		System.out.println("service : " + num);
		return theaterRepository.theaterDelete(num);
	}
	
	
	
	//MovieTimeInfo
	public List<MovieTimeVO> theaterMovieTime(int num) throws Exception{
		List<MovieTimeVO> list = theaterRepository.theaterMovieTime(num);
		
		return list;
	}
	
	
	
	//MovieTime
	public List<String[]> movieTime(List<MovieTimeVO> list) throws Exception{
		//screenDate 년 월 일로 쪼개기
		//screen time -10분 >> 시작시간  >>시 분
		//screen tile + runtime + 10 >> 끝나는시간
		//영화제목 / 요일 / 시작 년 월 일 시 분 / 끝 년 월 일 시 분
		
		List<String[]> totalInfo = new ArrayList<>();
		//String [] info = new String[12];
		// 제목 / 요일 / 년 / 월 / 일 / 시 / 분 / 년 / 월 / 일 / 시 / 분
		// 0    1    2   3   4  5   6   7   8   9  10  11
		
		for(int i=0; i<list.size(); i++) {
			String [] info = new String[12];
			//영화 제목
			String title = list.get(i).getMovieInfoVOs().getTitle();
			info[0] = title;
			System.out.println("영화 제목 : " + title);
			
			
			//요일
			String date = list.get(i).getScreenDate();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String[] week = {"일","월","화","수","목","금","토"}; 
			Calendar cal = Calendar.getInstance(); 
			Date getDate; 
			String day="";
			try { 
				getDate = format.parse(date);
				cal.setTime(getDate); 
				int w = cal.get(Calendar.DAY_OF_WEEK)-1; 
				System.out.println(date + "는 " + week[w] +"요일 입니다");
				day = week[w];
				} 
	//		catch (ParseException e) {
	//			e.printStackTrace(); 
	//		} 
			catch (Exception e) {
				e.printStackTrace(); 
			}
			
		
			info[1] = day;
		
			//년 월 일 2 3 4 7 8 9
			String [] d = date.split("-");
			System.out.println(d[0]);
			System.out.println(d[1]);
			System.out.println(d[2]);
			info[2] = d[0];
			info[3] = d[1];
			info[4] = d[2];
			
			info[7] = d[0];
			info[8] = d[1];
			info[9] = d[2];
			
			//시작 시간
			String screentime = list.get(i).getScreenTime();
			String [] s = screentime.split(":");
			int startH = Integer.parseInt(s[0]); 
			int startM = Integer.parseInt(s[1]);
			info[5] = s[0];
			info[6] = s[1];
			
			System.out.println(s[0]);
			System.out.println(s[1]);
			System.out.println("=================");
			System.out.println(d[0]);
			System.out.println(d[1]);
			System.out.println(d[2]);
			
			
			//runtime으로 끝나는 시간 구하기
			int run = Integer.parseInt(list.get(i).getMovieInfoVOs().getRuntime());
			int h = run/60;
			int m = run%60;
			System.out.println("=============");
			System.out.println("시작 시간 : " + startH);
			System.out.println("시작 분 : " + startM);
			
			System.out.println("=============");
			System.out.println("시간 : " + h);
			System.out.println("분 : " + m);
			
			String endH = String.valueOf(startH + h);
			String endM = String.valueOf(startM + m);
			System.out.println("=============");
			System.out.println("끝나는 시간 : " + endH);
			System.out.println("끝나는 분 : " + endM);
			
			info[10] = endH;
			info[11] = endM;
	
			totalInfo.add(info);
			
		}
		
	
		return totalInfo;
	}
	

	
	

}
