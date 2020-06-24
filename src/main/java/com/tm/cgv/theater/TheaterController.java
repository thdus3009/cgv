package com.tm.cgv.theater;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tm.cgv.cinema.CinemaVO;

@Controller
@RequestMapping("/theater/**/")
public class TheaterController {
	@Autowired
	private TheaterService theaterService;
	
	@ModelAttribute("board")
	public String getBoard() throws Exception{
		return "theater";
	}
	
	
	//List
	@GetMapping("theaterList")
	public ModelAndView theaterList(ModelAndView mv)throws Exception{
			
			List<TheaterVO> ar = theaterService.theaterList();
			
			mv.addObject("list",ar);
			mv.setViewName("theater/theaterList");
			return mv;
	}
	
	//Insert
	@GetMapping("theaterInsert")
	public ModelAndView theaterInsert(ModelAndView mv, TheaterVO theaterVO) throws Exception{
		List<CinemaVO> ar = theaterService.cinemaList();//시네마 list 가지고 오기
		
		
		mv.addObject("cine", ar);
		mv.addObject("path", "Insert");
		mv.setViewName("theater/theaterWrite");
		
		return mv;
	}
	
	
	//Insert
	@PostMapping("theaterInsert")
	public ModelAndView theaterInsert(TheaterVO theaterVO, String [] row, String [] col, String [] grade, String [] row_space, String [] col_space) throws Exception{	
		ModelAndView mv = new ModelAndView();
		

//		System.out.println(theaterVO.getCinemaNum());
//		System.out.println(theaterVO.getName());
//		System.out.println(theaterVO.getFilmType());
//		System.out.println(theaterVO.getSeatCount());
//		
//		System.out.println(row.length);
//		System.out.println(col.length);
//		System.out.println(grade.length);
//		
//		System.out.println(row[0]);
//		System.out.println(row[1]);
//		System.out.println(row[2]);
//		System.out.println(row[3]);
//		System.out.println(row[4]);
//		
//		for(int i=0; i<row_space.length; i++) {
//			System.out.println("row_space : " + row_space[i]);
//		}
//		
//		for(int j=0; j<col_space.length; j++) {
//			System.out.println("col_space : " + col_space[j]);
//		}
//		
		

		//theaterVO 하나 삽입 후 
		//삽입 성공한 theaterVO의 theaterNum을 가져와서
		
		//theaterNum  col  row  grade  >> 여러개삽입
		
		int result = theaterService.theaterInsert(theaterVO, row, col, grade, row_space, col_space);
		
		if(result>0) {
			mv.setViewName("redirect:./theaterList");
		}else {
			System.out.println("등록 실패");
		}
		
		return mv;
	}
	

	
	
	//Update
	@GetMapping("theaterUpdate")
	public ModelAndView theaterUpdate(TheaterVO theaterVO, ModelAndView mv, int num) throws Exception{
		TheaterVO theaterVO2=theaterService.theaterSelect(num);
		System.out.println(theaterVO2.getNum()+"num 널이니?");
		mv.addObject("vo",theaterVO2);
		mv.addObject("path","Update");
		mv.setViewName("theater/theaterUpdate");
		return mv;
	}
	
	
	//Update
	@PostMapping("theaterUpdate")
	public ModelAndView theaterUpdate2(TheaterVO theaterVO, ModelAndView mv)throws Exception{

		int result = theaterService.theaterUpdate(theaterVO);
			
		if(result>0) {
			mv.setViewName("redirect:./theaterList");
		}else {
			System.out.println("실패");
			//mv.setViewName("redirect:./theaterUpdate?num="+theaterVO.getNum());
		}
		
		
		return mv;
	}
	
	
	
	
	//Delete
	@PostMapping("theaterDelete")
	@ResponseBody
	public int theaterDelete(int num,ModelAndView mv) throws Exception{
		System.out.println("삭제 : " + num);

		int result =theaterService.theaterDelete(num);
	
		//mv.addObject("path","Delete");
		//mv.setViewName("redirect:./theaterList"); //jsp에서 list로 보내주니까 필요가 없다.
		System.out.println(result+"dd");
		return result;
	}
}
