package com.tm.cgv.movieTime;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MovieTimeRepository {

	public MovieTimeVO movieTimeSelectOne(int num) throws Exception; 
	
	public List<Integer> selectNumByScreenDate(MovieTimeVO movieTimeVO) throws Exception;
	
	public int selectTheaterNumByNum(MovieTimeVO movieTimeVO) throws Exception;
	
	public MovieTimeVO selectOneRecently() throws Exception;
	
	public int updateDeleteAtByScreenDate(MovieTimeVO movieTimeVO) throws Exception;
	
	public int remainSeatUpdate(MovieTimeVO movieTimeVO) throws Exception;

	public int insert(MovieTimeVO movieTimeVO) throws Exception;

	public int remainSeatSum(MovieTimeVO movieTimeVO) throws Exception;
	

}
