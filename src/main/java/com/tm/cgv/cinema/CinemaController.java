package com.tm.cgv.cinema;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("cinema")
public class CinemaController {

	@Autowired
	private CinemaService cinemaService;
	
	//지역별 극장 조회
	
	
}
