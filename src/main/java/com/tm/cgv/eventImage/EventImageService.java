package com.tm.cgv.eventImage;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.tm.cgv.util.FileManager;
import com.tm.cgv.util.FilePathGenerator;

@Service
public class EventImageService {
	
	@Value("${board.event.filePath}")
	private String filePath;
	
	@Autowired
	private EventImageRepository eventImageRepository;
	
	@Autowired
	private FilePathGenerator filePathGenerator;
	
	
	public int fileDelete(EventImageVO eventImageVO) throws Exception {
		//DB가서 정보 지우고 HDD 파일 지우기
		//System.out.println("num : " + num);
		FileManager fileManager = new FileManager();

		System.out.println(eventImageVO.getNum() + "...");
		int result = eventImageRepository.deleteImage(eventImageVO.getNum());
		
		
		if(result>0) {
			//HDD삭제
			System.out.println("........");
			//String extendPath = FilePathGenerator.addTimePath(filePath);
			File dest = filePathGenerator.getUseClassPathResource(filePath);
			System.out.println("dest : " + dest);
			System.out.println(eventImageVO.getFileName());
			result = fileManager.deleteFile(eventImageVO.getFileName(), dest);
			
		}
		
		return result;
	}
}
