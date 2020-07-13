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
	
	private void populateModel(Model model) throws Exception {
        List<ReservationVO> rows = new ArrayList<>();
        rows = reservationService.reservationAllList();
        model.addAttribute("rows", rows);
    }


    @GetMapping("/stat")
    public String get(Model model) throws Exception{
        populateModel(model);
        return "stat";
    }



    @GetMapping("/stat.xls")
    public String getExcelByExt(Model model)throws Exception {
        populateModel(model);
        return "statXls";
    }


    @GetMapping(path = "/stat", params = "format=xls")
    public String getExcelByParam(Model model) throws Exception {
        populateModel(model);
        return "statXls";
    }
}
