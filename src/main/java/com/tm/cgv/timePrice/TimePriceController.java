package com.tm.cgv.timePrice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/timePrice/**")
public class TimePriceController {

	@Autowired
	private TimePriceService timePriceService;
	

	@ResponseBody
	@GetMapping("searchLimit")
	public List<TimePriceVO> searchLimit(TimePriceVO timePriceVO) throws Exception{
		List<TimePriceVO> timePriceList = timePriceService.searchLimit(timePriceVO);
		
		return timePriceList;
	}
	
	
	}
