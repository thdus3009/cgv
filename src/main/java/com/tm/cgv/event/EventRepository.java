package com.tm.cgv.event;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tm.cgv.util.Pager_eventList;

@Mapper
public interface EventRepository {
	
	public List<EventVO> adminEventList(Pager_eventList pager) throws Exception;
	
	public List<EventVO> eventList(Pager_eventList pager) throws Exception;
	
	public List<EventVO> endEventList(Pager_eventList pager) throws Exception;
	
	public int eventInsert(EventVO eventVO) throws Exception;
	
	public EventVO eventSelect(int num) throws Exception;
	
	public EventVO eventSelect2(int num) throws Exception;
	
	public int eventUpdate(EventVO eventVO) throws Exception;
	
	public int adminEventCount(Pager_eventList pager) throws Exception;
	
	public int eventCount(Pager_eventList pager) throws Exception;
	
	public int endEventCount(Pager_eventList pager) throws Exception;
	
	public int eventDelete(int num) throws Exception;
}
