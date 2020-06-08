package com.tm.cgv.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import com.tm.cgv.file.FileVO;

@Component
public class FileDown extends AbstractView{

	@Autowired
	private ResourceLoader resourceLoader;
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		//저장경로를 받아와야 함(저장 경로 확인)
		
		System.out.println("renderIN");
		
		String path = "classpath:static/";
		path = path + (String)model.get("path");
		FileVO fileVO = (FileVO)model.get("fileVO");
		
		System.out.println("path1 : "+path);
		
		
		path = path + fileVO.getFileName();
		System.out.println("path2 : "+path);
		File file = resourceLoader.getResource(path).getFile();
		
		
		//한글처리(인코딩 처리)
		response.setCharacterEncoding("UTF-8");
		//헤더에 총 파일의 크기를 제공
		response.setContentLengthLong(file.length());
		//다운로드 시 파일의 이름을 인코딩 처리
		String fileName = URLEncoder.encode(fileVO.getOriName(),"UTF-8");
		//헤더 설정
		response.setHeader("Content-Disposition", "attachment;filename=\""+fileName+"\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		
		//전송
		//1.HDD에서 파일을 일고
		FileInputStream fi = new FileInputStream(file);
		//2.Client에게 내보내야 됨 (전송 준비 , 연결만 한 상태)
		OutputStream os = response.getOutputStream();
		//3.파일을 실제로 전송
		FileCopyUtils.copy(fi, os);
		
		os.close();
		fi.close();
		
	}
}






















