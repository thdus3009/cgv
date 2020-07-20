package com.tm.cgv.banner;


import java.sql.Date;

import lombok.Data;

@Data
public class BannerVO {
	private int num;
	private String title;
	private int type;
	private int index;
	private String link;
	private Date startDate;
	private Date endDate;
	private String fileName;
	private String originName;
	private int randId;
}
