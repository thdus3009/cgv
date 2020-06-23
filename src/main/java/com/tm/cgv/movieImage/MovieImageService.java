package com.tm.cgv.movieImage;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tm.cgv.movieInfo.MovieInfoRepository;
import com.tm.cgv.util.FileManager;
import com.tm.cgv.util.FilePathGenerator;

@Service
public class MovieImageService {
	
	@Autowired
	private MovieImageRepository movieImageRepository;
	@Autowired
	private FileManager fileManager;
	@Autowired
	private FilePathGenerator filePathGenerator;
	
	@Value("${board.movieInfo.filePath}")
	private String filePath;

	
	public List<MovieImageVO> movieImageList(int movieNum)throws Exception{
		return movieImageRepository.movieImageList(movieNum);
	}
	
	//업로드된 대표사진 지우기
	public int movieImageDelete(MovieImageVO movieImageVO)throws Exception{
		File dest = filePathGenerator.getUseClassPathResource(filePath);
		
		int result = fileManager.deleteFile(movieImageVO.getFileName(),dest);
		
		if(result>0) {
			result = movieImageRepository.movieImageDelete(movieImageVO);
			
		}
		return result;
	}
	
	//contents에서 사진을 넣었을 때 사용
	/*
	public MovieImageVO movieImageInsert(MultipartFile files,MovieImageVO movieImageVO) throws Exception{
		
		//파일 객체 생성
		File file = pathGenerator.getUseClassPathResource(filePath);
		movieRepository.mov
		
		String fileName = fileManager.saveTransfer(files, file);
		MovieImageVO imageVO = new MovieImageVO();
		imageVO.setFileName(fileName);
		imageVO.setOriginName(files.getOriginalFilename());
		
		imageVO = movieImageRepository.movieImageInsert(imageVO);
		
	}*/
}
