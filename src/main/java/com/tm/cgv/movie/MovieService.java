package com.tm.cgv.movie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tm.cgv.util.Pager;

@Service
public class MovieService {

	@Autowired
	private MovieRepository movieRepository;
	
	public List<MovieVO> movieListAll(MovieVO movieVO) throws Exception{
		return movieRepository.movieListAll(movieVO);
	}
	
	public List<MovieVO> movieListMore(Pager pager) throws Exception{
		Integer count = (int)movieRepository.movieNumCount();
		pager.setPerPage(count);
		
		return movieRepository.movieList(pager);
	}
	
	public List<MovieVO> movieList(Pager pager) throws Exception{
		
		pager.setPerPage(7);
		pager.makeRow();
		
		return movieRepository.movieList(pager);
	}
	
}
