package com.tm.cgv.point;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/point/**")
public class PointController {

	@Autowired
	private PointService pointService;
	
	@GetMapping("pointSelectList")
	
}
