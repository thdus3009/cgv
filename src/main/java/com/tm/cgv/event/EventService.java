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

		if(files.size()==0) {
    		return 0;
    	}
		
		//첫번째 파일 저장
		MultipartFile tmp = files.remove(0);
		eventImageVO.setEventNum(eventVO.getNum());
    	String fileName = fileManager.saveFileCopy(tmp, file);
    	eventImageVO.setType(0);
    	eventImageVO.setFileName(path+fileName);
    	eventImageVO.setOriginName(tmp.getOriginalFilename());
	    eventImageRepository.insertImage(eventImageVO);
	    
	    //두번째 파일 저장
	    fileName = fileManager.saveFileCopy(files.get(0), file);
	    eventImageVO.setType(1);
    	eventImageVO.setFileName(path+fileName);
    	eventImageVO.setOriginName(files.get(0).getOriginalFilename());
	    eventImageRepository.insertImage(eventImageVO);
	    
	    //eventNum 받아오기
	    //type 거르기
		return result;
	}
	
	
	
	public EventVO eventSelect(int num) throws Exception {
		return eventRepository.eventSelect(num);
	}
	
	public int eventUpdate(EventVO eventVO, List<MultipartFile> files, String type) throws Exception {
		
		System.out.println("service");
		System.out.println(eventVO.getTitle());
		System.out.println(eventVO.getNum());
		int result = eventRepository.eventUpdate(eventVO); //event table update
		
		
		FilePathGenerator filePathGenerator = new FilePathGenerator();
		String path = FilePathGenerator.addTimePath("")+"\\";
	    System.out.println(path+"path!!!!");
	    String extendPath = FilePathGenerator.addTimePath(filePath);
	    File file = filePathGenerator.getUseClassPathResource(extendPath);
		FileManager fileManager = new FileManager();
		EventImageVO eventImageVO = new EventImageVO();
		
		
		if(files.size()==2) {
			//두 사진 모두 변경했을 경우
			//첫번째 파일 저장
			System.out.println("파일 2개 변경시");
			MultipartFile tmp = files.remove(0);
			eventImageVO.setEventNum(eventVO.getNum());
	    	String fileName = fileManager.saveFileCopy(tmp, file);
	    	eventImageVO.setType(0);
	    	eventImageVO.setFileName(path+fileName);
	    	eventImageVO.setOriginName(tmp.getOriginalFilename());
		    eventImageRepository.insertImage(eventImageVO);
		    
		    //두번째 파일 저장
		    fileName = fileManager.saveFileCopy(files.get(0), file);
		    eventImageVO.setType(1);
	    	eventImageVO.setFileName(path+fileName);
	    	eventImageVO.setOriginName(files.get(0).getOriginalFilename());
		    eventImageRepository.insertImage(eventImageVO);
		}else if(files.size()==1) {
			//이미지 하나만 바뀐 경우
			System.out.println("파일 1개 변경시");
			String fileName = fileManager.saveFileCopy(files.get(0), file);
			eventImageVO.setEventNum(eventVO.getNum());
		    eventImageVO.setType(Integer.parseInt(type));
	    	eventImageVO.setFileName(path+fileName);
	    	eventImageVO.setOriginName(files.get(0).getOriginalFilename());
		    eventImageRepository.insertImage(eventImageVO);
		}
		
		
		
		
		return result;
	}
}
