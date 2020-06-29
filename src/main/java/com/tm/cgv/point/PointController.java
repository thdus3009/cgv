package com.tm.cgv.point;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/point/**")
public class PointController {

	@Autowired
	private PointService pointService;
	
	@ResponseBody
	@GetMapping("pointSelectList")
	public List<PointVO> pointSelectList(String memberNum) throws Exception{
		
		List<PointVO> pointList = pointService.pointSelectList(memberNum);
		
		return pointList;
	}
	
}
