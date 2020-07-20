package com.tm.cgv.cinema;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class CinemaRepositoryTest {

	@Autowired
	private CinemaRepository cinemaRepository;
	
	//@Test
	void test() throws Exception{
		int result = cinemaRepository.cinemaWrite();
		assertEquals(1, result);
	}

}
