package com.tm.cgv.util;

import java.io.File;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManager {
	//filsaver
	public String saveTransfer(MultipartFile file,File dest) throws Exception{
		String fileName ="";

		fileName = UUID.randomUUID().toString();
		fileName = fileName +"_"+file.getOriginalFilename();
		
		dest = new File(dest,fileName);
		file.transferTo(dest);
		
		return fileName;
	}
	
	public String saveFileCopy(MultipartFile file,File dest) throws Exception{
		String fileName ="";

		fileName = UUID.randomUUID().toString();
		fileName = fileName +"_"+file.getOriginalFilename();
		
		dest = new File(dest,fileName);
		FileCopyUtils.copy(file.getBytes(), dest);
		
		return fileName;
	}
	
	
	// fileDelete
	public int deleteFile(String fileName, File dest)throws Exception{
		
		
		File file = new File(dest, fileName);
		
		boolean check=false;
		int result=0;
		if(file.exists()) {
			check = file.delete();
		}
		if(check) {
			result=1;
		}
		
		return result;
	}
}
