package com.tm.cgv.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tm.cgv.util.Pager;

@Mapper
public interface BoardRepository {
	//selectList
	public List<BoardVO> boardList(Pager pager) throws Exception;
	
	//selectSelect
	public BoardVO boardSelect(BoardVO boardVO) throws Exception;
	
	//insert
	public int boardInsert(BoardVO boardVO) throws Exception;
	
	//update
	public int boardUpdate(BoardVO boardVO) throws Exception;
	
	//delete
	public int boardDelete(BoardVO boardVO) throws Exception;
	
	//totalCount
	public long totalCount(Pager pager) throws Exception;
	
}
