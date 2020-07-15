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

		FileManager fileManager = new FileManager();
		filePath = "images/event/eventList/eventImage/";

		
		//HDD삭제
		System.out.println(filePathGenerator);
		System.out.println("........"+filePath);
		
		File dest = filePathGenerator.getUseClassPathResource(filePath);
		System.out.println("dest : " + dest);
		System.out.println(eventImageVO.getFileName());
		int result = fileManager.deleteFile(eventImageVO.getFileName(), dest);
		
		
		return result;
	}
	
	public EventImageVO selectImage(int num) throws Exception {
		System.out.println("num : " + num);
		return eventImageRepository.selectImage(num);
	}
}
