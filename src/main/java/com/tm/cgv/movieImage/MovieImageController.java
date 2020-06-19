package com.tm.cgv.movieImage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/movieImage/**")
public class MovieImageController {
	@Autowired
	private MovieImageService movieImageService;
	
	
	
}
