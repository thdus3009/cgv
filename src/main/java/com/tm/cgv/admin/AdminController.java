package com.tm.cgv.admin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tm.cgv.cinema.CinemaService;
import com.tm.cgv.cinema.CinemaVO;
import com.tm.cgv.member.MemberBasicVO;
import com.tm.cgv.member.MemberService;
import com.tm.cgv.movieInfo.MovieInfoService;
import com.tm.cgv.movieInfo.MovieInfoVO;
import com.tm.cgv.movieTime.MovieTimeService;
import com.tm.cgv.movieTime.MovieTimeVO;
import com.tm.cgv.payment.PaymentService;
import com.tm.cgv.payment.PaymentVO;
import com.tm.cgv.reservation.ReservationVO;
import com.tm.cgv.seat.SeatService;
import com.tm.cgv.seat.SeatVO;
import com.tm.cgv.seatSpace.SeatSpaceService;
import com.tm.cgv.seatSpace.SeatSpaceVO;
import com.tm.cgv.theater.TheaterService;
import com.tm.cgv.theater.TheaterVO;
import com.tm.cgv.util.BitFilmType;
import com.tm.cgv.util.Pager;
import com.tm.cgv.reservation.ReservationService;


@Controller
@RequestMapping("/admin/**")
public class AdminController {

	@Autowired
	private CinemaService cinemaService;
	
	@Autowired
	private TheaterService theaterService;
	
	@Autowired
	private SeatService seatService;
	
	@Autowired
	private SeatSpaceService seatSpaceService;

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MovieInfoService movieInfoService;
	
	@Autowired
	private MovieTimeService movieTimeService;
	@Autowired
	private ReservationService reservationService;
	@Autowired
	private PaymentService paymentService;
	
	
	
	@GetMapping("/")
	public String admin() throws Exception {
		return "admin/adminIndex";
	}
	//==============================
	// movieInfo
	//==============================
	@GetMapping("movie/movieList")
	public ModelAndView movieList(ModelAndView mv,Pager pager) throws Exception{
		List<MovieInfoVO> list = movieInfoService.movieList(pager);
		
		if(list !=null) {
			mv.addObject("list",list);
			mv.setViewName("admin/movie/movieList");
		}
		return mv;
	}
	
	@GetMapping("movie/movieListSort")
	public ModelAndView movieListSort(ModelAndView mv,MovieInfoVO movieInfoVO) throws Exception{
		List<MovieInfoVO> list = movieInfoService.movieListAll(movieInfoVO);
		
		System.out.println(list.get(1).getTitle()+"정렬 0번 타이틀");
		
		mv.addObject("list",list);
		mv.setViewName("admin/movie/ajax/movieListSort");
		return mv;
	}
	
	
	@GetMapping("movie/movieSearchA")
	public ModelAndView movieSearchA(ModelAndView mv,Pager pager) throws Exception{
		
		List<MovieInfoVO> searchA = movieInfoService.movieList(pager);
		if(searchA !=null) {
			mv.addObject("searchA",searchA);
			mv.setViewName("admin/movie/movieSearchA");
		}
		return mv;
	}
	
	@GetMapping("movie/movieWrite")
	public ModelAndView movieWrite(ModelAndView mv)throws Exception{
		mv.addObject("vo",new MovieInfoVO());
		mv.addObject("path","Write");
		mv.setViewName("admin/movie/movieWrite");
		return mv;
	}
	
	@PostMapping("movie/movieWrite")
	public ModelAndView movieWrite(ModelAndView mv,MovieInfoVO movieInfoVO,MultipartFile files,String videolink) throws Exception{
		int num = movieInfoVO.getNum();
		System.out.println("num : " + num);
		
		
		long result = movieInfoService.movieWrite(movieInfoVO, files,videolink);
		if(result>0) {
			mv.setViewName("redirect:./movieList?kind=date");
		}else {
			System.out.println("등록 실패");
		}
		
		return mv;
	}
	
	@GetMapping("movie/movieSelect")
	public ModelAndView movieSelect(ModelAndView mv,ReservationVO reservationVO,MovieInfoVO movieInfoVO) throws Exception{
		System.out.println(movieInfoVO.getNum()+"con 무비넘");
		reservationVO.setMovieNum(movieInfoVO.getNum());// 파라미터가 num인데 reservation에는 movieNum이 영화번호이니까
														// 영화번호에 num을 넣어줘야지 제대로 돌아감
		
		Map<String, Object> map = movieInfoService.movieSelect(movieInfoVO, reservationVO);
		if(map.get("vo")==null) {
			mv.setViewName("redirect:../error/404");
		}
		
		//select 에서 예매율, 리뷰 없어도...
		
		
		
		mv.addObject("vo",map.get("vo"));
		mv.addObject("gender",map.get("gender"));
		mv.addObject("gTotal",map.get("gTotal"));
		mv.addObject("ageTotal",map.get("ageTotal"));
		mv.addObject("age10",map.get("age10"));
		mv.addObject("age20",map.get("age20"));
		mv.addObject("age30",map.get("age30"));
		mv.addObject("age40",map.get("age40"));
		mv.addObject("age50",map.get("age50"));
		mv.addObject("path","Select");
		mv.addObject("cost",map.get("cost"));
		mv.addObject("cactor",map.get("cactor"));
		mv.addObject("cvisual",map.get("cvisual"));
		mv.addObject("cstory",map.get("cstory"));
		mv.addObject("cdirector",map.get("cdirector"));
		mv.addObject("cten",map.get("cten"));
		mv.addObject("cfun",map.get("cfun"));
		mv.addObject("cstr",map.get("cstr"));
		mv.addObject("cimp",map.get("cimp"));
		mv.addObject("cimm",map.get("cimm"));
		mv.setViewName("admin/movie/movieSelect");
		return mv;
	}
	
	@GetMapping("movie/movieUpdate")
	public ModelAndView movieUpdate(ModelAndView mv,MovieInfoVO movieInfoVO,ReservationVO reservationVO) throws Exception{
		Map<String, Object> map = movieInfoService.movieSelect(movieInfoVO, reservationVO);
		if(map.get("vo")==null) {
			mv.setViewName("redirect:./error/404");
		}
		mv.addObject("vo",map.get("vo"));
		mv.addObject("path","Update");
		mv.setViewName("admin/movie/movieUpdate");
		
		return mv;
	}
	
	@PostMapping("movie/movieUpdate")
	public ModelAndView movieUpdate(ModelAndView mv,MovieInfoVO movieInfoVO,MultipartFile files,String videolink) throws Exception{
		long result = movieInfoService.movieUpdate(movieInfoVO, files, videolink);
		
		mv.setViewName("redirect:admin/movie/movieSelect?num="+movieInfoVO.getNum());
		return mv;
	}
	
	@GetMapping("movie/movieDelete")
	public ModelAndView movieDelete(ModelAndView mv, MovieInfoVO movieInfoVO) throws Exception{
		long result = movieInfoService.movieDelete(movieInfoVO);
		mv.setViewName("redirect:./movieList?kind=date");
		return mv;
	}
	
	//==============================
	// cinemaPart
	//==============================
	@GetMapping("cinema/cinemaList")
	public ModelAndView adminCinemaList(ModelAndView mv) throws Exception {
		List<CinemaVO> list = cinemaService.cinemaList();
		mv.addObject("list", list);
		mv.setViewName("admin/cinema/cinemaList");
		return mv;
	}
	
	@PostMapping("cinema/cinemaList")
	@ResponseBody
	public ModelAndView adminCinemaList(ModelAndView mv, String local) throws Exception {
		System.out.println(local);
		List<CinemaVO> list = cinemaService.cineList(local);
		System.out.println(list.size());
		mv.addObject("list", list);
		mv.setViewName("admin/cinema/ajax/cineList");
		return mv;
		
	}
	
	@GetMapping("cinema/cinemaSelect")
	public ModelAndView adminCinemaSelect(ModelAndView mv, int num) throws Exception {
		CinemaVO cinemaVO = cinemaService.cinemaSelect(num);
		List<TheaterVO> list = cinemaService.selectTheaterList(num);
		
		//List<MovieTimeVO> m = theaterService.theaterMovieTime(list.get(0).getNum()); /*나중에는 list로 뽑아와야됨!*/
	
	
		//가져온 theater list에 들어있는 filmType을 가져와서 리스트 생성
		List<Integer> values = new ArrayList<Integer>();
		for(TheaterVO i:list) {
			values.add(i.getFilmType());
		}
		
		//비트 플래그 이용하여 한자리수인 filmType을 쪼개어 list나 배열 형태로 가져와 jsp로 보내주기
		BitFilmType bitFilmType = new BitFilmType();
		List<List<Byte>> filmType = bitFilmType.getState(values);
		
		
		mv.addObject("filmType", filmType);
		mv.addObject("cine", cinemaVO);
		mv.addObject("theaterList", list);
		mv.setViewName("admin/cinema/cinemaSelect");
		
		
		return mv;
	}
	
	@GetMapping("cinema/theaterTime")
	@ResponseBody
	public List<String[]>  theaterTime(int theaterNum) throws Exception {
		System.out.println("들어왓나?");
		ModelAndView mv = new ModelAndView();
		List<MovieTimeVO> m = theaterService.theaterMovieTime(theaterNum); /*나중에는 list로 뽑아와야됨!*/
		
		//쪼개는 서비스 만들기..theaterService에
		List<String[]> totalInfo = theaterService.movieTime(m);

		
		//정보를 list로 만들어서 잘 가져왔고..............
		//
		mv.addObject("totalInfo", totalInfo);
		mv.setViewName("admin/cinema/ajax/theaterTime");
		
		//return mv;
		return totalInfo;
	}
	
	
	@GetMapping("cinema/cinemaInsert")
	public ModelAndView admincinemaInsert() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("path", "Insert");
		mv.setViewName("admin/cinema/cinemaInsert");
		return mv;
	}
	
	@PostMapping("cinema/cinemaInsert")
	public ModelAndView cinemaInsert(ModelAndView mv, CinemaVO cinemaVO) throws Exception{
		System.out.println("ㅠ.ㅠ");
		int result = cinemaService.cinemaInsert(cinemaVO);
		
		if(result > 0) {
			mv.setViewName("redirect:./cinemaList");
		}else {
			System.out.println("삽입 실패");
		}
		
		return mv;
	}
	
	
	@GetMapping("cinema/cinemaUpdate")
	public ModelAndView adminCinemaUpdate(int num) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		CinemaVO cinemaVO = cinemaService.cinemaSelect(num);
		mv.addObject("path", "Update");
		mv.addObject("vo", cinemaVO);
		mv.setViewName("admin/cinema/cinemaInsert");

		return mv;
	}
	
	
	@PostMapping("cinema/cinemaUpdate")
	public ModelAndView cinemaUpdate(ModelAndView mv, CinemaVO cinemaVO) throws Exception{
		System.out.println("ㅠ.ㅠ");
		int result = cinemaService.cinemaUpdate(cinemaVO);
		
		if(result > 0) {
			mv.setViewName("redirect:./cinemaList");
		}else {
			System.out.println("삽입 실패");
		}
		
		return mv;
	}
	
	
	
	@GetMapping("cinema/cinemaDelete")
	public ModelAndView adminCinemaDelete(int num) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println("num : " + num);
		System.out.println("-------------------");
		int result = cinemaService.cinemaDelete(num);
		
		mv.setViewName("redirect:./cinemaList");

		return mv;
	}
	
	
	
	
	//극장별 관람가격 (조회/수정/삭제 /삽입)
	
	
	
	
	
	
	
	//==============================
	// theater
	//==============================
	@GetMapping("cinema/theaterInsert")
	public ModelAndView adminTheaterInsert() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<CinemaVO> cinemaVO = theaterService.cinemaList();
		mv.addObject("cine", cinemaVO);
		mv.addObject("board", "theater");
		mv.addObject("path", "Insert");
		mv.setViewName("admin/cinema/theaterInsert");
		return mv;
	}
	
	@PostMapping("cinema/theaterInsert")
	public ModelAndView theaterInsert(TheaterVO theaterVO, int [] filmType, String [] row, String [] col, String [] grade, String [] row_space, String [] col_space) throws Exception{	
		ModelAndView mv = new ModelAndView();
		
		System.out.println("length : " + filmType.length);
		System.out.println(theaterVO.getFilmType());//첫번째 거만 옴
		
		
		
		int result = theaterService.theaterInsert(theaterVO, filmType, row, col, grade, row_space, col_space);
		
		if(result>0) {
			mv.setViewName("redirect:../admin/cinema/cinemaList");
		}else {
			System.out.println("등록 실패");
		}
		
		return mv;
	}
	
	@GetMapping("cinema/theaterSelect")
	public ModelAndView adminTheaterSelect(int num) throws Exception {
		System.out.println("num : " +num);
		ModelAndView mv = new ModelAndView();
		TheaterVO theaterVO = theaterService.theaterSelect(num);
		//theaterSelect
		//상영관 정보
		//좌석배치도
		
		SeatVO seatVO = new SeatVO();
		seatVO.setTheaterNum(num);
		SeatSpaceVO seatSpaceVO = new SeatSpaceVO();
		seatSpaceVO.setTheaterNum(num);
		System.out.println("tn : " + seatVO.getTheaterNum());
		
		List<SeatVO> rowList = seatService.rowCount(seatVO);
		int maxCol = seatService.colCount(seatVO);
		
		List<SeatSpaceVO> seatSpaceList = seatSpaceService.seatSpaceSelect(seatSpaceVO);
		
		List<SeatVO> seatList = seatService.seatSelect(seatVO);
		
		
		mv.addObject("rowList", rowList);
		mv.addObject("maxCol", maxCol);
		mv.addObject("seatSpaceList", seatSpaceList);
		mv.addObject("seatList", seatList);

		
		mv.addObject("theater", theaterVO); //상영과정보
		mv.setViewName("admin/cinema/theaterSelect");
		return mv;
	}
	
	@GetMapping("cinema/theaterUpdate")
	public ModelAndView adminTheaterUpdate(int num) throws Exception {
		ModelAndView mv = new ModelAndView();
		TheaterVO theaterVO = theaterService.theaterSelect(num);
		SeatVO seatVO = new SeatVO();
		seatVO.setTheaterNum(num);
		SeatSpaceVO seatSpaceVO = new SeatSpaceVO();
		seatSpaceVO.setTheaterNum(num);

		List<SeatVO> rowList = seatService.rowCount(seatVO);
		int maxCol = seatService.colCount(seatVO);
		List<SeatSpaceVO> seatSpaceList = seatSpaceService.seatSpaceSelect(seatSpaceVO);
		List<SeatVO> seatList = seatService.seatSelect(seatVO);
		int seatListSize = seatList.size();
		String row = theaterService.selectRow(num); //int값으로
		char c = row.charAt(0);
		int k = c-64;
		int col = theaterService.selectCol(num);
		
		mv.addObject("rowList", rowList);
		mv.addObject("maxCol", maxCol);
		mv.addObject("seatSpaceList", seatSpaceList);
		mv.addObject("seatList", seatList);
		mv.addObject("theater", theaterVO); //상영과정보
		mv.addObject("rowIdx", k);
		mv.addObject("colIdx",col);
		mv.addObject("seatListSize", seatListSize);
		mv.addObject("board", "theater");
		mv.addObject("path", "Insert");
		mv.setViewName("admin/cinema/theaterUpdate");
		return mv;
	}
	
	@PostMapping("cinema/theaterUpdate")
	public ModelAndView adminTheaterUpdate(TheaterVO theaterVO, String [] row, String [] col, String [] grade, String [] row_space, String [] col_space) throws Exception {
		ModelAndView mv = new ModelAndView();
		theaterService.theaterUpdate(theaterVO, row, col, grade, row_space, col_space);
		
		
		return mv;
	}
	

	@GetMapping("cinema/theaterDelete")
	public ModelAndView adminTheaterDelete(int num, int cinemaNum) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println("num : " + num);
		System.out.println("-------------------");
		int result = theaterService.theaterDelete(num);
		
		mv.setViewName("redirect:./cinemaSelect?num="+cinemaNum);

		return mv;
	}
	
	//==============================
	// memberPart
	//==============================

	@GetMapping("member/memberList")
	public ModelAndView memberList(Pager pager) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		System.out.println("memberList");
		System.out.println(pager.getCurPage());
		System.out.println(pager.getKind());
		System.out.println(pager.getSearch());
		
		List<MemberBasicVO> list = memberService.memberList(pager);
		mv.addObject("list", list);
		mv.addObject("pager", pager);
		mv.setViewName("admin/member/memberList");
		return mv;
	}
	
	//==============================
	// movieTime
	//==============================
	
	@GetMapping("movieTime/insert")
	public ModelAndView movieTimeInsert(Pager pager, TheaterVO theaterVO) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		pager.setPerPage(12);		// 12개씩 영화 보여주기 위함
		mv.addObject("perRow", 6);	// 6개마다 줄바꿈을 위함

		// for test
		if(theaterVO.getNum() == 0)
			theaterVO.setNum(1);
		
		List<MovieInfoVO> movieInfoList = movieInfoService.movieList(pager);
		theaterVO = theaterService.theaterSelect(theaterVO.getNum());
				
		mv.addObject("movieInfoList", movieInfoList);
		mv.addObject("theaterVO", theaterVO);
		mv.setViewName("admin/movieTime/movieTimeInsert");
		return mv;
	}
	
	// ajax로 받는걸로 바꿔보자
	@PostMapping("movieTime/insert")
	@ResponseBody
	public int movieTimeInsert(MovieTimeVO movieTimeVO) throws Exception {
		
		System.out.println(movieTimeVO.getMovieNum());
		System.out.println(movieTimeVO.getTheaterNum());
		System.out.println(movieTimeVO.getScreenDate());
		System.out.println(movieTimeVO.getScreenTime());
		System.out.println(movieTimeVO.getRemainSeat());
		
		int result = movieTimeService.insert(movieTimeVO);
		return result;
	}
	
	
	//==============================
	// reservation 
	//==============================
	//예매내역 (조회/삭제)
	@GetMapping("reservation/selectList")
	public ModelAndView reservationSelectList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<ReservationVO> reservationList = reservationService.reservationSelectList(pager);
		
		mv.addObject("reservationList", reservationList);
		mv.setViewName("admin/reservation/reservationList");
		
		return mv;
	}
	
	@ResponseBody
	@GetMapping("reservation/delete")
	public int reservationDelete(ReservationVO reservationVO) throws Exception{
		int result = 0;
		result = reservationService.reservationDelete(reservationVO);
		
		return result;
	}
	
	
	
	//==============================
	// payment  
	//==============================
	//결제내역 (조회)
	@ResponseBody
	@GetMapping("payment/SelectOne")
	public PaymentVO paymentSelectOne(PaymentVO paymentVO) throws Exception{
		
		paymentVO = paymentService.paymentSelectOne(paymentVO);

		return paymentVO; 
	}
	
	
	
	
	
	//==============================
	// coupon
	//==============================
	
	//쿠폰 정보 (조회/삭제/수정/삽입)
	
	
	
	
	

}
