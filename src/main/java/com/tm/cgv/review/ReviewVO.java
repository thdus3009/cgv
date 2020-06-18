package com.tm.cgv.review;

import com.tm.cgv.board.BoardVO;

import lombok.Data;

@Data
public class ReviewVO extends BoardVO {
	
	private int like;	//좋아요 수
	private int mNum;	//영화번호

}
