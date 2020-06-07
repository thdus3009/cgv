package com.tm.cgv.board.bbsFile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/bbsFile/**")
public class BbsFileController {

	@Autowired
	private BbsFileService bbsFileService;
	
	@GetMapping("fileDelete")
	public int fileDelte(BbsFileVO bbsFileVO) throws Exception{
		
		int result = bbsFileService.fileDelete(bbsFileVO);
		return result;
	}
	
	
}
