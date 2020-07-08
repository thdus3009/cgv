package com.tm.cgv.event;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.tm.cgv.eventImage.EventImageRepository;
import com.tm.cgv.eventImage.EventImageVO;
import com.tm.cgv.util.FileManager;
import com.tm.cgv.util.FilePathGenerator;

@Service
public class EventService {
	
	@Autowired
	private EventRepository eventRepository;
	
	@Autowired
	private EventImageRepository eventImageRepository;
	
	@Value("${board.event.filePath}")
	private String filePath;
	
	
	public List<EventVO> eventList() throws Exception {
		return eventRepository.eventList();
	}

	@Transactional
	public int eventInsert(EventVO eventVO, List<MultipartFile> files) throws Exception {
		//받아온 EventVO Event table에 삽입
		int result = eventRepository.eventInsert(eventVO);
		//System.out.println(result);
		
		//EventImage에 들어갈 정보 만들기
		FilePathGenerator filePathGenerator = new FilePathGenerator();
		String path = FilePathGenerator.addTimePath("")+"\\";
	    System.out.println(path+"path!!!!");
	    String extendPath = FilePathGenerator.addTimePath(filePath);
	    File file = filePathGenerator.getUseClassPathResource(extendPath);
		FileManager fileManager = new FileManager();
		EventImageVO eventImageVO = new EventImageVO();
		List<EventImageVO> ar = new ArrayList<EventImageVO>();
	    
	    for(MultipartFile multipartFile:files) {
	    	if(multipartFile.getSize()<=0) {
	    		continue;
	    	}
	    	String fileName = fileManager.saveFileCopy(multipartFile, file);
	    	eventImageVO.setFileName(path+fileName);
	    	eventImageVO.setOriginName(multipartFile.getOriginalFilename());
	    	
	    	ar.add(eventImageVO);
	    	eventImageRepository.insertImage(eventImageVO);
	    	
	    }
		
	    //eventNum 받아오기
	    //type 거르기
		return result;
	}
	
	
	
	public EventVO eventSelect(int num) throws Exception {
		return eventRepository.eventSelect(num);
	}
}
