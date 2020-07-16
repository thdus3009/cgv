package com.tm.cgv.rememberMe;

import java.sql.Date;

import lombok.Data;

@Data
public class RememberMeVO {

	private String series;
	private String username;
	private String token;
	private Date last_used;
}
