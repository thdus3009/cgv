package com.tm.cgv.movieImage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/movieImage/**")
public class MovieImageController {
	@Autowired
	private MovieImageService movieImageService;
	
	@PostMapping("movieImageDelete")
	@ResponseBody
	public int movieImageDelete(MovieImageVO movieImageVO)throws Exception{
		System.out.println(movieImageVO.getNum());
		int result = movieImageService.movieImageDelete(movieImageVO);
		System.out.println(result+"result controller");//x
		return result;
	}
	
	
	
}
