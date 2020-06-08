package com.tm.cgv.file;

public interface FileRepository {

	public int fileDelete(FileVO fileVO) throws Exception;
	
	public int fileInsert(FileVO fileVO) throws Exception;
	
	public FileVO fileDown(FileVO fileVO) throws Exception;
}
