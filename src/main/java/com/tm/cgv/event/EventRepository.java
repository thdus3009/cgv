package com.tm.cgv.event;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EventRepository {
	public List<EventVO> eventList() throws Exception;
	
	public int eventInsert(EventVO eventVO) throws Exception;
	
	public EventVO eventSelect(int num) throws Exception;
}
