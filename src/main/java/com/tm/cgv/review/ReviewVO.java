package com.tm.cgv.review;

import com.tm.cgv.board.BoardVO;

public class ReviewVO extends BoardVO {

	private int like;	//좋아요 수
	private int mNum;	//영화번호

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public int getmNum() {
		return mNum;
	}

	public void setmNum(int mNum) {
		this.mNum = mNum;
	}
	
	
	
}
