package com.tm.cgv.pointHistory;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tm.cgv.util.Pager;

@Mapper
public interface PointHistoryRepository {

	public int pointHistortInsert(PointHistoryVO pointHistoryVO) throws Exception;
	
	public List<PointHistoryVO> pointHistoryList(Pager pager) throws Exception;
	
	public long pointHistoryListCount(Pager pager) throws Exception;
}
