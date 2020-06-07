package com.tm.cgv.board.bbs;

import com.tm.cgv.board.BoardVO;
import com.tm.cgv.board.bbsFile.BbsFileVO;

public class BbsVO extends BoardVO{

	private BbsFileVO bbsFileVO;

	public BbsFileVO getBbsFileVO() {
		return bbsFileVO;
	}

	public void setBbsFileVO(BbsFileVO bbsFileVO) {
		this.bbsFileVO = bbsFileVO;
	}
	
	
}
