package com.tm.cgv.movieImage;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tm.cgv.util.FileManager;

@Service
public class MovieImageService {
	
	@Autowired
	private MovieImageRepository movieImageRepository;
	@Autowired
	private FileManager fileManager;
	@Autowired
	private ServletContext servletContext;
	
	public List<MovieImageVO> movieImageList(int movieNum)throws Exception{
		return movieImageRepository.movieImageList(movieNum);
	}
	
	//contents에서 사진을 넣었을 때 사용
	/*
	public String movieImageInsert(MultipartFile files) throws Exception{
		//db에는 안들어가고 하드디스크에만 들어가서 불러오는 경로
		String path = servletContext.getRealPath("/resources/movieImage");
		path = fileManager.saveFileCopy(files, path);
		path = servletContext.getContextPath()+"/resources/movieImage/"+path;
		return fileManager.saveTransfer(files, path); 
	}*/
}
