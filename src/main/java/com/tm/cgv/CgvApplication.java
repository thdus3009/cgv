package com.tm.cgv;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
@EnableScheduling
public class CgvApplication {

	public static void main(String[] args) {
		SpringApplication.run(CgvApplication.class, args);
	}

}
