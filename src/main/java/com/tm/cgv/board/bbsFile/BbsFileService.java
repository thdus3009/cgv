package com.tm.cgv.board.bbsFile;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tm.cgv.board.BoardVO;
import com.tm.cgv.file.FileService;
import com.tm.cgv.file.FileVO;
import com.tm.cgv.util.FileManager;
import com.tm.cgv.util.FilePathGenerator;

@Service
public class BbsFileService implements FileService{
	
	@Autowired
	private BbsFileRepository bbsFileRepository;
	@Autowired
	private FilePathGenerator filePathGenerator;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int fileDelete(FileVO fileVO) throws Exception {
		File dest = filePathGenerator.getUseClassPathResource("upload/bbs");
		System.out.println(dest.getAbsolutePath());
		
		int result = fileManager.deleteFile(fileVO.getFileName(), dest);
		
		if(result > 0) {
			result = bbsFileRepository.fileDelete(fileVO);
		}
		
		return result;
	}
	
	@Override
	public FileVO fileDown(FileVO fileVO) throws Exception{
		
		
		
		return bbsFileRepository.fileDown(fileVO);
	}
	

}
