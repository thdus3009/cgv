package com.tm.cgv.file;

import com.tm.cgv.board.bbsFile.BbsFileVO;

public interface FileService {

	public int fileDelete(FileVO fileVO) throws Exception;
	
	public FileVO fileDown(FileVO fileVO) throws Exception;
}
