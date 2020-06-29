package com.tm.cgv.payment;

import lombok.Data;

@Data
public class PaymentVO {
	
	private int num;
	private String imp_uid;
	private String merchant_uid;
	private String pg;
	private String pay_method;
	private String apply_num;
	
}
