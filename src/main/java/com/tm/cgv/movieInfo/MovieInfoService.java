package com.tm.cgv.movieInfo;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tm.cgv.movieImage.MovieImageRepository;
import com.tm.cgv.movieImage.MovieImageVO;
import com.tm.cgv.movieVideo.MovieVideoRepository;
import com.tm.cgv.movieVideo.MovieVideoVO;
import com.tm.cgv.util.FileManager;
import com.tm.cgv.util.FilePathGenerator;
import com.tm.cgv.util.Pager;

@Service
public class MovieInfoService {

	@Autowired
	private MovieInfoRepository movieInfoRepository;
	
	@Autowired
	private MovieImageRepository  movieImageRepository;
	
	@Autowired 
	private MovieVideoRepository  movieVideoRepository;
	
	@Autowired
	private FilePathGenerator filePathGenerator;
	
	@Autowired
	private FileManager fileManager;
	
	@Value("${board.movieInfo.filePath}")
	private String filePath;
	
	
	public List<MovieInfoVO> movieListAll(MovieInfoVO movieVO) throws Exception{
		return movieInfoRepository.movieListAll(movieVO);
	}
	
	public List<MovieInfoVO> movieListMore(Pager pager) throws Exception{
		Integer count = (int)movieInfoRepository.movieNumCount();
		pager.setPerPage(count);
		
		return movieInfoRepository.movieList(pager);
	}
	
	public List<MovieInfoVO> movieList(Pager pager) throws Exception{
		
		pager.setPerPage(7);
		pager.makeRow();
		
		return movieInfoRepository.movieList(pager);
	}
	
	public long movieWrite(MovieInfoVO movieInfoVO,MultipartFile files,String videolink) throws Exception{
		
		File file = filePathGenerator.getUseClassPathResource(filePath);//upload/movie 경로
		//테이블에 넣어
		
		long result = movieInfoRepository.movieWrite(movieInfoVO);
		
		if(files.getSize()>0) {
			String fileName = fileManager.saveTransfer(files, file);//이미지 파일 저장
			MovieImageVO movieImageVO = new MovieImageVO();
			movieImageVO.setMovieNum(movieInfoVO.getNum());
			movieImageVO.setFileName(fileName);
			movieImageVO.setOriginName(files.getOriginalFilename());						
			
			//movieImage테이블에 삽입
			result = movieImageRepository.movieImageInsert(movieImageVO);
		}
		
		if(videolink!=null) {
			MovieVideoVO movieVideoVO = new MovieVideoVO();
			movieVideoVO.setMovieNum(movieInfoVO.getNum());
			movieVideoVO.setVideolink(videolink);
			
			result = movieVideoRepository.movieVideoInsert(movieVideoVO);
		}
		
		return result;
	}
	
}
