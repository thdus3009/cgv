package com.tm.cgv.event;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

class InsertTest {
	
	@Autowired
	private EventRepository eventRepository;

	@Test
	void test() {
		
	}
	
	public void insert() throws Exception {
		for(int i=0; i<5; i++) {
			EventVO eventVO = new EventVO();
			eventVO.setTitle("test"+i);
			//eventVO.setStartDate("2020-07-01");
		}
	}
}
