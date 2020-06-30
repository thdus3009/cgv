package com.tm.cgv.movieInfo;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.tm.cgv.reservation.ReservationVO;
import com.tm.cgv.util.Pager;

@Mapper
public interface MovieInfoRepository {
	
	
	public long movieNumCount(Pager pager) throws Exception;
	
	public List<MovieInfoVO> movieList(Pager pager) throws Exception;
	
	public List<MovieInfoVO> movieListAll(MovieInfoVO movieVO) throws Exception;
	
	public long movieWrite(MovieInfoVO movieInfoVO) throws Exception;
	
	public MovieInfoVO movieSelect (MovieInfoVO movieInfoVO) throws Exception;
	
	public long movieUpdate(MovieInfoVO movieInfoVO) throws Exception;
	
	public long movieDelete(MovieInfoVO movieInfoVO) throws Exception;
	
	
	public MovieInfoVO movieSelectOne(int num) throws Exception;
	
	public Map<String, Object> errRate2(ReservationVO reservationVO) throws Exception;

	public long errUpdate(MovieInfoVO movieInfoVO) throws Exception;
	//insert, update , delete는 리턴타입이 무조건 넘버타입이어야함. int, long 등등
	//그래서 xml 파일에 따로 리턴 타입을 적어주지 않는 것
	
	public Map<String, Object> rate(ReservationVO reservationVO) throws Exception;
	
	public long rateUpdate(MovieInfoVO movieInfoVO) throws Exception;
}
