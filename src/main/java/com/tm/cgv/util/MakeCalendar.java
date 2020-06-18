package com.tm.cgv.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class MakeCalendar {

	public List<MakeCalendarVO> makeCalendar() {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar nowCal = Calendar.getInstance();
		Calendar endCal = Calendar.getInstance();

		List<MakeCalendarVO> calendarList = new ArrayList<MakeCalendarVO>();

		String nowDay = dateFormat.format(nowCal.getTime());
		endCal.add(Calendar.DATE, 40);
		String endDay = dateFormat.format(endCal.getTime());

		while (!nowDay.equals(endDay)) {
			MakeCalendarVO calendarVO = new MakeCalendarVO();
			int week = nowCal.get(Calendar.DAY_OF_WEEK);
			String weekKor = "";
			switch (week) {
			case 1:
				weekKor = "일";
				break;
			case 2:
				weekKor = "월";
				break;
			case 3:
				weekKor = "화";
				break;
			case 4:
				weekKor = "수";
				break;
			case 5:
				weekKor = "목";
				break;
			case 6:
				weekKor = "금";
				break;
			case 7:
				weekKor = "토";
				break;
			default:
				break;
			}
			int year = nowCal.get(Calendar.YEAR);
			int month = nowCal.get(Calendar.MONTH) + 1;
			int date = nowCal.get(Calendar.DATE);
//			System.out.println(year + " " + month + " " + date);
//			System.out.println("week : " + weekKor);

			calendarVO.setYear(year);
			calendarVO.setMonth(month);
			calendarVO.setDate(date);
			calendarVO.setWeek(weekKor);

			calendarList.add(calendarVO);

			nowCal.add(Calendar.DATE, 1); // 하루하루 더해준다.
			nowDay = dateFormat.format(nowCal.getTime()); // 비교를 위한 값 셋팅

		}

		return calendarList;

	}
}
