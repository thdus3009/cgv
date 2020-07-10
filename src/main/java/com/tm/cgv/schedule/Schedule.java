package com.tm.cgv.schedule;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.tm.cgv.point.PointService;
import com.tm.cgv.point.PointVO;
import com.tm.cgv.reservation.ReservationService;
import com.tm.cgv.reservation.ReservationVO;

@Component
public class Schedule {

	@Autowired
	private ReservationService reservationService;
	@Autowired
	private PointService pointService;
	@Autowired
    RedisTemplate<String, Object> redisTemplate;
	
//	@Scheduled(cron ="50 * * * * *")
	public void cronSchedule() throws Exception{
		System.out.println(Thread.currentThread().getName());
		Calendar cal = Calendar.getInstance();
		System.out.println(cal.getTimeInMillis());
	}
	
	
	//자정에 결제금액에 해당하는 일정 포인트 지급 - (resevationTable이용)
	@Scheduled(cron ="0 0 0 * * *")
	//@Scheduled(cron ="* * * * * *")
	public void pointSchedule() throws Exception{
		Calendar cal = Calendar.getInstance();
		String year = cal.get(Calendar.YEAR)+"";
		String month = (cal.get(Calendar.MONTH)+1)+"";
		String date = cal.get(Calendar.DATE)+"";
		
		if(month.length() < 2) {
			month = "0"+month;
		}
		if(date.length() < 2) {
			date = "0"+date;
		}
		String nowDate = year+"-"+month+"-"+date;
		
		//지금 날짜와 DB의 날짜와 비교해서 오늘 결제 된 사람들의 ID를 얻어옴
		ReservationVO reservationVO = new ReservationVO();
		reservationVO.setCreateAt(nowDate);
		List<ReservationVO> reservationList = reservationService.pointAccumlate(reservationVO);
		
		//할인율 읽어와야됨 - redies
		Integer rate = (Integer)redisTemplate.opsForValue().get("cjDiscountRate");
		double changeRate = rate*0.01;
		
		int result = 0;
		for (ReservationVO vo : reservationList) {
			String uid = vo.getUid();
			int totalPrice = vo.getTotalPrice();
			int accumulatePoint = (int)(totalPrice * changeRate);
			
			PointVO pointVO = new PointVO();
			pointVO.setKind("sum");
			pointVO.setUsername(uid);
			pointVO.setType("cjOnePointipt");
			pointVO.setPrice(accumulatePoint);
			
			result = pointService.pointDiscountUpdate(pointVO);
			
			if(result == 0) {
				result = pointService.pointInsert(pointVO);
			}
		}
		
	}
	
	
	
}
