package com.tm.cgv.util;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Component;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

@Component
@EnableAsync
public class SmsSender {

	@Value("${twillo.ACCOUNT_SID}")
	private String ACCOUNT_SID;
	
	@Value("${twillo.AUTH_TOKEN}")
	private String AUTH_TOKEN;
	
	@Async
	public void smsSend(String phoneNum, String contents) {
		
		System.out.println(ACCOUNT_SID);
    	System.out.println(AUTH_TOKEN);
    	System.out.println(phoneNum);
    	System.out.println(contents);
    	
    	Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
    	
    	Message message = Message
                .creator(new PhoneNumber("+82"+phoneNum), // to
                        new PhoneNumber("+12056228416"), // from
                        contents)
                .create();
    	
    	//System.out.println(message.getSid());
	}
}
