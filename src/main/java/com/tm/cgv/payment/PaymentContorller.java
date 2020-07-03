package com.tm.cgv.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/payment/**")
public class PaymentContorller {

	
	@Autowired
	private PaymentService paymentService;
	
	
	@ResponseBody
	@PostMapping("paymentInsert")
	public int paymentInsert(PaymentVO paymentVO) throws Exception{
		int result = 0;
		
		result = paymentService.paymentInsert(paymentVO);
		result = paymentVO.getNum();
		
		return result;
	}
	
}
