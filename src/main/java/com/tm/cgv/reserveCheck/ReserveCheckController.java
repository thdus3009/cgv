package com.tm.cgv.reserveCheck;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/reserveCheck/**")
public class ReserveCheckController {

	@Autowired
	private ReserveCheckService reserveCheckService;
	
	
	@ResponseBody
	@GetMapping("reserve")
	public List<ReserveCheckVO> reservationCheckedSelect(ReserveCheckVO reserveCheckVO) throws Exception{
		
		System.out.println(reserveCheckVO.getTitle()+ "/ "+reserveCheckVO.getTheater()+"/ "+reserveCheckVO.getDate());
		
		List<ReserveCheckVO> reserveList = reserveCheckService.reservationCheckedSelect(reserveCheckVO);
		
		return reserveList;
	}
	
}
