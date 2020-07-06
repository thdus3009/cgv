package com.tm.cgv.movieTime;

import com.tm.cgv.movieInfo.MovieInfoVO;

import lombok.Data;

@Data
public class MovieTimeVO {
	private int num;
	private int movieNum;
	private int theaterNum;
	private String screenDate;
	private String screenTime;
	private int remainSeat;
	private int selectedFilm;
	
	private MovieInfoVO movieInfoVOs; //movieNum의 title, runtime


	

}
