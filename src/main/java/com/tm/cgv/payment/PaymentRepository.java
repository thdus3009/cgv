package com.tm.cgv.payment;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaymentRepository {
	
	public int paymentInsert(PaymentVO paymentVO) throws Exception;
	
	public int paymentDelete(int num) throws Exception;

	public PaymentVO paymentSelectOne(PaymentVO paymentVO) throws Exception;
	
	
}
