package com.tm.cgv.movieInfo;

import java.io.File;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tm.cgv.member.MemberVO;
import com.tm.cgv.movieImage.MovieImageRepository;
import com.tm.cgv.movieImage.MovieImageVO;
import com.tm.cgv.movieVideo.MovieVideoRepository;
import com.tm.cgv.movieVideo.MovieVideoVO;
import com.tm.cgv.reservation.ReservationVO;
import com.tm.cgv.util.BitFuction;
import com.tm.cgv.util.BitFuction2;
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
	
	
	
	
	public MovieInfoVO movieSelectOne(int num) throws Exception{
		return movieInfoRepository.movieSelectOne(num);
	}
	
	
	
	
	public List<MovieInfoVO> movieListAll(MovieInfoVO movieVO) throws Exception{
		return movieInfoRepository.movieListAll(movieVO);
	}
	
	public List<MovieInfoVO> movieListMore(Pager pager) throws Exception{
		Integer count = (int)movieInfoRepository.movieNumCount(pager);
		pager.setPerPage(count);
		
		return movieInfoRepository.movieList(pager);
	}
	
	public List<MovieInfoVO> movieList(Pager pager) throws Exception{
			
		pager.makeRow();
		System.out.println(pager.getStartRow()+"StartRow");
		long totalCount = movieInfoRepository.movieNumCount(pager);
		pager.makeBlock(totalCount);
		
		return movieInfoRepository.movieList(pager);
	}
	
	
	public long movieWrite(MovieInfoVO movieInfoVO,MultipartFile files,String videolink) throws Exception{
		
		File file = filePathGenerator.getUseClassPathResource(filePath);//movieList/filmCover 경로
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
	
	public Map<String, Object> movieSelect(MovieInfoVO movieInfoVO,ReservationVO reservationVO) throws Exception{
		
		System.out.println(reservationVO.getMovieNum()+"uuuu");
		
		//vo에  total과 good을 받아줄 변수명이 없으므로 map으로 받아서 가지고 옴
		//eggRate계산
		Map< String , Object> map = movieInfoRepository.errRate2(reservationVO);
		Iterator<String> mm = map.keySet().iterator();
		
		long total = (long)map.get("total");
		long good = (long)map.get("good");
		
		double total2 = Double.valueOf(total);
		double good2 = Double.valueOf(good);
		
		if(total2>0) { //작성된 리뷰가 1개 이상일 경우 계산해서 errRate를 업데이트
			double errRate =(double)(good2/total2)*100;				
			System.out.println(errRate + " : errRate");
			
			movieInfoVO.setErrRate(errRate);
			
			movieInfoRepository.errUpdate(movieInfoVO);
		
		}
		
		//예매율 계산
		Map<String, Object> map2 = movieInfoRepository.rate(reservationVO);
		Iterator<String> mm2 = map2.keySet().iterator();
		
		float totalTicket = ((BigDecimal)map2.get("totalTicket")).floatValue();
		float movieOne = (BigDecimal)map2.get("movieOne")==null?0.0f:((BigDecimal)map2.get("movieOne")).floatValue();

		if(movieOne>0) { //예매된 표가 1개 이상일 때 업데이트
			double rate = (double)(movieOne/totalTicket)*100;
			double rate2 = Double.parseDouble(String.format("%.1f", rate));			
			System.out.println(rate2 + " : rate");
			
			movieInfoVO.setRate(rate2);
			
			movieInfoRepository.rateUpdate(movieInfoVO);
		
		}
		//성별 계산	
		Map<String, Object> map3 = movieInfoRepository.gender2(reservationVO);
		Iterator<String> mm3 = map3.keySet().iterator();
		
		Map<String, Object> map4 =movieInfoRepository.gTotal(reservationVO);
		Iterator<String> mm4 =map4.keySet().iterator();
		/* 확인용
		while(mm3.hasNext()) {
			String key3 = mm3.next();
			System.out.println(key3+"tttttttt");
		}*/
		
		long gender =(long)map3.get("cgender");//gender=4
		System.out.println(gender+"cgender");
		long gTotal =(long)map4.get("gTotal");
		System.out.println(gTotal+"gTotal");
		
		//연령대 계산
		Map<String, Object> mapAge = movieInfoRepository.age(reservationVO);
		Iterator<String> mmAge = mapAge.keySet().iterator();
			
		long ageTotal =(long)mapAge.get("total");
		long age10 =(long)mapAge.get("age10");
		long age20=(long)mapAge.get("age20");
		long age30 =(long)mapAge.get("age30");
		long age40 =(long)mapAge.get("age40");
		long age50=(long)mapAge.get("age50");
		
		double ageTotal2 = Double.valueOf(ageTotal);
		double age10_2 = Double.valueOf(age10);
		double age20_2 = Double.valueOf(age20);
		double age30_2 = Double.valueOf(age30);
		double age40_2 = Double.valueOf(age40);
		double age50_2 = Double.valueOf(age50);
		
		//매력포인트
	
	
		List<Integer> values = movieInfoRepository.charmPoint(reservationVO);
		for(int i=0;i<values.size();i++) {
			System.out.println(values.get(i)+" :  번 charm");
		}
		
		BitFuction bb =new BitFuction();
		List<Integer> charm = bb.getState(values);
		
		System.out.println("----------");
		System.out.println(charm.get(0)+"숫자1");
		System.out.println(charm.get(1)+"숫자2");
		
		
		//감정 포인트
		List<Integer> values2 = movieInfoRepository.emotionPoint(reservationVO);
		for(int i=0;i<values2.size();i++) {
			System.out.println(values2.get(i)+" :  번 emotion");
		}
		
		BitFuction2 bb2 = new BitFuction2();
		List<Integer> emotion = bb2.getState2(values2);
 		
		//
		movieInfoVO = movieInfoRepository.movieSelect(movieInfoVO); 
		Map<String, Object> g = new HashMap<>();
		g.put("gender", gender);
		g.put("gTotal",gTotal);
		g.put("ageTotal", ageTotal2);
		g.put("age10", age10_2);
		g.put("age20", age20_2);
		g.put("age30", age30_2);
		g.put("age40", age40_2);
		g.put("age50", age50_2);
		g.put("vo", movieInfoVO);
		g.put("cost", charm.get(0));
		g.put("cactor", charm.get(1));
		g.put("cvisual", charm.get(2));
		g.put("cstory", charm.get(3));
		g.put("cdirector", charm.get(4));
		g.put("cten", emotion.get(0));//긴장감
		g.put("cfun", emotion.get(1));//즐거움
		g.put("cstr", emotion.get(2));//스트레스
		g.put("cimp", emotion.get(3));//감동
		g.put("cimm", emotion.get(4));//몰입감
		return g ;
		
	}
	
	public long movieUpdate(MovieInfoVO movieInfoVO,MultipartFile files, String videolink)throws Exception{
		File file = filePathGenerator.getUseClassPathResource(filePath);//movieList/filmCover 경로
		
		long result = movieInfoRepository.movieUpdate(movieInfoVO);
		
		System.out.println("qqq?????" + movieInfoVO.getNum());
		
		if(files !=null) {
			System.out.println("updateIn");
			if(files.getSize()>0) {
				String fileName = fileManager.saveTransfer(files, file);//파일, 경로
				MovieImageVO movieImageVO = new MovieImageVO();
				System.out.println(movieInfoVO.getNum()+"?????");
				
				movieImageVO.setMovieNum(movieInfoVO.getNum());
				movieImageVO.setFileName(fileName);
				movieImageVO.setOriginName(files.getOriginalFilename());
				//movieImage테이블에 삽입
				result = movieImageRepository.movieImageInsert(movieImageVO);
			}
		}
		
		System.out.println("링크값 : "+videolink);	
		//같으면 업데이트x
		//다르면 업데이트를 하고
		String same = videolink;
		
		if(videolink!=null ) {
			MovieVideoVO movieVideoVO = new MovieVideoVO();
			
				movieVideoVO.setMovieNum(movieInfoVO.getNum());
				movieVideoVO.setVideolink(videolink);
								
				result = movieVideoRepository.movieVideoUpdate(movieVideoVO);
			
			
		}
		
		return result;
		
	}
	
	public long movieDelete(MovieInfoVO movieInfoVO)throws Exception{
		long result= movieInfoRepository.movieDelete(movieInfoVO);
		return result;
	}
	
}
