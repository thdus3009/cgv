package com.tm.cgv.board.bbs;

import org.apache.ibatis.annotations.Mapper;

import com.tm.cgv.board.BoardRepository;
import com.tm.cgv.board.BoardVO;

@Mapper
public interface BbsRepository extends BoardRepository {

	public int hitUpdate(BoardVO boardVO) throws Exception;
	
}
