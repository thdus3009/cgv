package com.tm.cgv.pointHistory;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tm.cgv.util.Pager;

@Service
public class PointHistoryService {

	@Autowired
	private PointHistoryRepository pointHistoryRepository;
	
	public int pointHistortInsert(PointHistoryVO pointHistoryVO) throws Exception{
		return pointHistoryRepository.pointHistortInsert(pointHistoryVO);
	}
	
	public List<PointHistoryVO> pointHistoryList(Pager pager) throws Exception{
//		pager.setPerPage(10);
		pager.makeRow();
		long totalCount = pointHistoryRepository.pointHistoryListCount(pager);
		pager.makeBlock(totalCount);
		
		return pointHistoryRepository.pointHistoryList(pager);
	}
	
}
