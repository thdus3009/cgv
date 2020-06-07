package com.tm.cgv.board;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tm.cgv.util.Pager;

@Service
public interface BoardService {
	//selectList
	public List<BoardVO> boardList(Pager pager) throws Exception;
		
	//selectSelect
	public BoardVO boardSelect(BoardVO boardVO) throws Exception;
		
	//insert
	public int boardInsert(BoardVO boardVO, MultipartFile[] files) throws Exception;
		
	//update
	public int boardUpdate(BoardVO boardVO, MultipartFile[] files) throws Exception;
		
	//delete
	public int boardDelete(BoardVO boardVO) throws Exception;	
}
