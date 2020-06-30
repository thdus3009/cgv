package com.tm.cgv.reservation;

import com.tm.cgv.movieInfo.MovieInfoVO;
import com.tm.cgv.movieTime.MovieTimeVO;
import com.tm.cgv.payment.PaymentVO;

import lombok.Data;

@Data
public class ReservationVO {

	private int num;
	private int movieNum;
	private int paymentNum;
	private int movieTimeNum;
	
	private String uid; //유저 ID
	private int filmType; //2D/3D
	private String cinemaName; //극장명
	private String theaterName; //상영관명
	private String seats; //좌석명들 (A1/A2/A3 ..나열)
	private int totalPrice; //총가격
	private int common; //일반
	private int teenager; //청소년
	private int preference; //우대
	
	private String createAt;
	private String deleteAt;
	
	
	private MovieInfoVO movieInfoVO;
	private MovieTimeVO movieTimeVO;
	private PaymentVO paymentVO;
	
	
	
//	movieInfo join해서 불러올값
//	private String title;
//	private String ageLimit;
//	private String runTime;
	
//	movieTime join해서 불러올 값
//	private String screenDate;
//	private String screenTime;
	
	
	
	
}
