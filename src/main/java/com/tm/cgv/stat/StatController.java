package com.tm.cgv.stat;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.tm.cgv.reservation.ReservationService;
import com.tm.cgv.reservation.ReservationVO;

@Controller
public class StatController {
	
	@Autowired
	private ReservationService reservationService;

	//xls를 다운 받고자 하는 경로마다 GetMapping 함수 지정 -> 조회한 값을 model로 각자 맞는 Component에게 전송
	

	
	
    @GetMapping("/reservation.xls")
    public String getExcelByReservation(Model model)throws Exception {
    	List<ReservationVO> rows = new ArrayList<>();
        rows = reservationService.reservationAllList();
        model.addAttribute("rows", rows);
        
        return "reservationListStat";
    }
    
    //form으로 받을 때 주소에.xls를 하지 않아도 이런식으로 받을 수 있음
    @GetMapping(path = "/stat", params = "format=xls")
    public String getExcelByParam(Model model) throws Exception {
        this.getExcelByReservation(model);
        return "statXls";
    }
}
