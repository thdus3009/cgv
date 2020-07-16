package com.tm.cgv.movieImage;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MovieImageRepository {
	
	public List<MovieImageVO> movieImageList(int movieNum)throws Exception;
	
	//이미지사진이 여기까지 들어와야함.
	public long  movieImageInsert(MovieImageVO movieImageVO) throws Exception;
	
	public MovieImageVO movieImageSelect(MovieImageVO movieImageVO) throws Exception;
	
	public int movieImageDelete(MovieImageVO movieImageVO) throws Exception;
	
	public List<Integer> movieGet() throws Exception;
	
}
