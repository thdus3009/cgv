package com.tm.cgv.reserveCheck;

import java.util.List;

import com.tm.cgv.cinema.CinemaVO;
import com.tm.cgv.movieInfo.MovieInfoVO;
import com.tm.cgv.movieTime.MovieTimeVO;
import com.tm.cgv.theater.TheaterVO;

import lombok.Data;

@Data
public class ReserveCheckVO {

	private String title;
	private String theater;
	private String date;
	
	private List<MovieInfoVO> movieInfoVOs;
	private List<CinemaVO> cinemaVOs;
	private List<TheaterVO> theaterVOs;
	private List<MovieTimeVO> movieTimeVOs;
	
	public String getTitle() {
		if(this.title == null) {
			this.title = "";
		}
		return title;
	}
	public String getTheater() {
		if(this.theater == null) {
			this.theater = "";
		}
		return theater;
	}
	public String getDate() {
		if(this.date == null) {
			this.date = "";
		}
		return date;
	}
	
}
