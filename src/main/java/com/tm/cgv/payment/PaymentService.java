package com.tm.cgv.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentService {
	
	@Autowired
	private PaymentRepository paymentRepository;
	
	public int paymentInsert(PaymentVO paymentVO) throws Exception{
		return paymentRepository.paymentInsert(paymentVO);
	}
	

}