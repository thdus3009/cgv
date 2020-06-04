package com.tm.cgv.movie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tm.cgv.util.Pager;

@Service
public class MovieService {

	@Autowired
	private MovieRepository movieDAO;
	
	public List<MovieVO> movieListAll(MovieVO movieDTO) throws Exception{
		return movieDAO.movieListAll(movieDTO);
	}
	
	public List<MovieVO> movieListMore(Pager pager) throws Exception{
		long count = movieDAO.movieNumCount();
		pager.setLastRow(count);
		
		return movieDAO.movieList(pager);
	}
	
	public List<MovieVO> movieList(Pager pager) throws Exception{
		
		pager.setPerPage(7);
		pager.makeRow();
		
		return movieDAO.movieList(pager);
	}
	
}
