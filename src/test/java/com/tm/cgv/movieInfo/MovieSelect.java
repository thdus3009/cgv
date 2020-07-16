package com.tm.cgv.movieInfo;

import static org.junit.jupiter.api.Assertions.*;

import java.io.File;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.platform.commons.annotation.Testable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.web.multipart.MultipartFile;

import com.tm.cgv.movieImage.MovieImageRepository;
import com.tm.cgv.movieImage.MovieImageVO;
import com.tm.cgv.movieVideo.MovieVideoRepository;
import com.tm.cgv.movieVideo.MovieVideoVO;
import com.tm.cgv.reservation.ReservationVO;
import com.tm.cgv.review.ReviewVO;
import com.tm.cgv.util.FileManager;
import com.tm.cgv.util.FilePathGenerator;

@SpringBootTest
class MovieSelect {
	
	@Autowired
	private MovieInfoRepository movieInfoRepository;
	@Autowired
	private MovieImageRepository  movieImageRepository;
	@Autowired
	private MovieVideoRepository  movieVideoRepository;
	@Autowired
	private FilePathGenerator  filePathGenerator;
	@Autowired
	private MultipartFile[] files;
	@Autowired
	private FileManager fileManager;
	@Autowired
	private String[] videolink;
	
	@Value("${board.movieInfo.filePath}")
	private String filePath;
	
	//@Test
	public void charm() throws Exception{
		ReservationVO reservationVO= new ReservationVO();
		reservationVO.setMovieNum(19);
		List<Integer> m = movieInfoRepository.charmPoint(reservationVO);
		for(int i=0;i<m.size();i++) {
			System.out.println(m.get(i)+"번");
		}
	}
	
	//@Test
	public void video() throws Exception{
		File file = filePathGenerator.getUseClassPathResource(filePath);//movieList/filmCover 경로
		//테이블에 넣어
		MovieInfoVO movieInfoVO= new MovieInfoVO();
		
		long result = movieInfoRepository.movieWrite(movieInfoVO);
		// 포스터 이미지, 트레일러 영상 이미지들
		for(int i=0;i<files.length;i++) {
			if(files.length>0) {
				String fileName = fileManager.saveTransfer(files[i], file);//이미지 파일, 경로
				MovieImageVO movieImageVO = new MovieImageVO();
				movieImageVO.setMovieNum(movieInfoVO.getNum());
				movieImageVO.setFileName(fileName);
				movieImageVO.setOriginName(files[i].getOriginalFilename());						
				
				//movieImage테이블에 삽입
				result = movieImageRepository.movieImageInsert(movieImageVO);
			}
			if (result>0) {
				//int num = movieImageRepository.movieGet();
				
				if(videolink[i]!=null) {
				MovieVideoVO movieVideoVO = new MovieVideoVO();
				//movieVideoVO.setMovieImageNum(num);
				movieVideoVO.setVideolink(videolink[i]);
					
				result = movieVideoRepository.movieVideoInsert(movieVideoVO);
			
				}
			}
	}
	}
}
	


