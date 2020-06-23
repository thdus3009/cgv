package com.tm.cgv.board.bbs;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tm.cgv.board.BoardVO;
import com.tm.cgv.board.bbsFile.BbsFileService;
import com.tm.cgv.board.bbsFile.BbsFileVO;
import com.tm.cgv.file.FileVO;
import com.tm.cgv.member.MemberVO;
import com.tm.cgv.util.Pager;

@Controller
@RequestMapping("/bbs/**")
public class BbsController {

	@Autowired
	private BbsService bbsService;
	@Autowired
	private BbsFileService bbsFileService;
	
	@ModelAttribute("board")
	public String getBoard() throws Exception{
		return "bbs";
	}
	
	//List
	@GetMapping("bbsList")
	public ModelAndView bbsList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<BoardVO> bbsList = bbsService.boardList(pager);
		if(bbsList != null) {
			mv.addObject("bbsList", bbsList);
			mv.addObject("pager", pager);
			
			mv.setViewName("board/boardList");
		}
		return mv;
	}
	
	//select
	@GetMapping("bbsSelect")
	public ModelAndView bbsSelect(BbsVO bbsVO,HttpServletRequest request,HttpServletResponse response) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		MemberVO memberVO = (MemberVO)request.getSession().getAttribute("memberVO");
		String id = "";
		if(memberVO != null) {
			id = memberVO.getUid(); 
		}
		
		String key = "bbs_"+bbsVO.getNum()+id;
		String val = "val_"+bbsVO.getNum();
		
		Cookie[] cookies = request.getCookies();
		Cookie checkCookie = null;
		
		if(cookies != null && cookies.length > 0) {
			for (Cookie cookie : cookies) {
				if(cookie.getName().equals(key)) {
					checkCookie = cookie;
				}
			}
		}
		
		if(checkCookie == null) {
			Cookie cookie = new Cookie(key, val);
			response.addCookie(cookie);
			
			int result = bbsService.hitUpdate(bbsVO);
		}else {
			System.out.println("cookie이미 존재 조회수 증가 x");
		}
		
		
		bbsVO = (BbsVO)bbsService.boardSelect(bbsVO);
		if(bbsVO != null) {
			mv.addObject("bbsVO", bbsVO);
			mv.setViewName("board/boardSelect");
		}else {
			mv.addObject("msg", "오류!!");
			mv.addObject("path", "./bbsList");
			mv.setViewName("common/result");
		}
		
		return mv;
	}
	
	//insert
	@GetMapping("bbsWrite")
	public ModelAndView bbsWrite() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("board/boardWrite");
		return mv;
	}
	@PostMapping("bbsWrite")
	public ModelAndView bbsWrite(BbsVO bbsVO,MultipartFile[] files) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = bbsService.boardInsert(bbsVO,files);
		
		String msg = "등록에 실패했습니다.";
		if(result > 0) {
			msg = "등록되었습니다.";
		}
		mv.addObject("msg",msg);
		mv.addObject("path", "./bbsList");
		mv.setViewName("common/result");
	
		return mv;
	}
	
	//update
	@GetMapping("bbsUpdate")
	public ModelAndView bbsUpdate(BbsVO bbsVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		bbsVO =  (BbsVO)bbsService.boardSelect(bbsVO);
		mv.addObject("bbsVO", bbsVO);
		mv.addObject("path", "Update");
		mv.setViewName("board/boardUpdate");
		return mv;
	}
	
	@PostMapping("bbsUpdate")
	public ModelAndView bbsUpdate(BbsVO bbsVO, MultipartFile[] files) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = bbsService.boardUpdate(bbsVO, files);
		
		String msg = "수정 실패";
		if(result > 0) {
			msg = "수정 되었습니다.";
		}
		mv.addObject("msg", msg);
		mv.addObject("path","./bbsSelect?num="+bbsVO.getNum());
		mv.setViewName("common/result");
		
		return mv;
	}
	
	//delete
	@GetMapping("bbsDelete")
	public ModelAndView bbsDelete(BbsVO bbsVO,String fileName) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = bbsService.boardDelete(bbsVO,fileName);
		if(result > 0) {
			mv.addObject("msg", "등록된 글을 삭제했습니다.");
			mv.addObject("path", "./bbsList");
		}
		
		mv.setViewName("common/result");
		
		return mv;
	}
	
	
	
	//fileDown
	@GetMapping("fileDown")
	public ModelAndView fileDown(BbsFileVO bbsFileVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		FileVO fileVO = bbsFileService.fileDown(bbsFileVO);
		mv.addObject("fileVO", fileVO);
		mv.addObject("path", "upload/bbs/");
		
		mv.setViewName("fileDown");
		
		return mv;
	}
}















