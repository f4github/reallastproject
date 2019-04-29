package global.sesoc.project.ta.Controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.project.route.DAO.RouteDAO;
import global.sesoc.project.route.VO.RouteVO;
import global.sesoc.project.ta.DAO.TADAO;

import global.sesoc.project.ta.VO.TAVO;
import global.sesoc.project.ta.VO.Travel_infoVO;
import global.sesoc.project.user.DAO.LoginDAO;
import global.sesoc.project.user.VO.LoginVO;


@Controller
public class TAController {
	
	@Autowired
	TADAO dao;
	
	@Autowired
	RouteDAO dao2;
	
	@Autowired
	LoginDAO dao3;
	
	private static final Logger logger = LoggerFactory.getLogger(TAController.class);
	
	/*@RequestMapping(value = "ta", method=RequestMethod.GET)
	public String taGet() {
		
		return "ta/TAStart";
	}*/
	
	@RequestMapping(value = "ta1", method=RequestMethod.GET)
	public String ta1Get(RouteVO vo, HttpSession session) {
		
		String loginId = (String) session.getAttribute("loginId");
		vo.setId(loginId);
		logger.debug("vo: {}", vo);
//		dao2.routeInsert(vo);
		//경로 고유번호 갖고 와서 세션에 담을지 고민중
		session.setAttribute("routeVO", vo);
		//출발지(주소) 여기서 넣고 가는게 좋음
		
		return "TA/TA1";
	}
	
	@RequestMapping(value = "ta2", method=RequestMethod.POST)
	public String ta2Post(String answer1,HttpSession session) {
		
		String id = (String) session.getAttribute("loginId");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("answer", answer1);
		map.put("id", id);
		dao.vote(map);
		return "TA/TA2";
	}
	
	@RequestMapping(value = "ta3", method=RequestMethod.POST)
	public String ta3Post(String answer2,HttpSession session) {
		
		String id = (String) session.getAttribute("loginId");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("answer", answer2);
		map.put("id", id);
		dao.vote(map);
		return "TA/TA3";
	}
	
	@RequestMapping(value = "ta4", method=RequestMethod.POST)
	public String ta4Post(String answer3,HttpSession session) {
		
		String id = (String) session.getAttribute("loginId");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("answer", answer3);
		map.put("id", id);
		dao.vote(map);
		return "TA/TA4";
	}
	
	@RequestMapping(value = "ta5", method=RequestMethod.POST)
	public String ta5Post(String answer4,HttpSession session) {
		
		String id = (String) session.getAttribute("loginId");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("answer", answer4);
		map.put("id", id);
		dao.vote(map);
		return "TA/TA5";
	}
	
	@RequestMapping(value = "ta6", method=RequestMethod.POST)
	public String ta6Post(String answer5,HttpSession session) {
		
		String id = (String) session.getAttribute("loginId");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("answer", answer5);
		map.put("id", id);
		dao.vote(map);
		return "TA/TA6";
	}
	
	@RequestMapping(value = "ta7", method=RequestMethod.POST)
	public String ta7Post(String answer6,HttpSession session) {
		
		String id = (String) session.getAttribute("loginId");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("answer", answer6);
		map.put("id", id);
		dao.vote(map);
		return "TA/TA7";
	}
	

	@RequestMapping(value = "tacomplite", method=RequestMethod.POST)
	public String tacomPOST(String answer7, Model model, HttpSession session) {
		
		String id = (String) session.getAttribute("loginId");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("answer", answer7);
		map.put("id", id);
		dao.vote(map);
		ArrayList<TAVO> list = dao.location(id); //큰지역
		logger.debug("큰지역:{}", list);
		//여기서 경로 큰지역 넣어도 됨
		RouteVO vo = (RouteVO)session.getAttribute("routeVO");
		
		vo.setTripArea(list.get(0).getTravelplace());
		logger.debug("routeVO:{}",vo);
		session.setAttribute("routeVO", vo);
		//
		
		model.addAttribute("list", list);
		
		ArrayList<TAVO> list2 = dao.location2(id); //상세지역
		model.addAttribute("list2",list2);
		
		//dao.TAReset(id); 	//TA초기화
		return "TA/TACOM";
	}
	
	@RequestMapping(value = "taselect", method=RequestMethod.POST)
	public String taselectPost(String travelid[], Model model, HttpSession session) {
		
		logger.debug("[0]:{}",travelid[0]);
//		logger.debug("[1]:{}",travelid[1]);
//		logger.debug("[2]:{}",travelid[2]);
//		logger.debug("[3]:{}",travelid[3]);
		Travel_infoVO vo = new Travel_infoVO();
		ArrayList<Travel_infoVO> list = new ArrayList<>();
		
		for(int i=0 ; i<travelid.length ; i++){
			vo = dao.selectTravel(travelid[i]);
			list.add(vo);
		}
		logger.debug("리스트:{}", list);
		model.addAttribute("list", list);
		
		for(int i=0 ; i<list.size() ; i++){
			model.addAttribute("list_x" + i, list.get(i).getMapx());
			model.addAttribute("list_y" + i, list.get(i).getMapy());
			
		}
		
		int end_x = list.size() -1;
		int end_y = list.size() -1;
		logger.debug("end_x:{}", end_x);
		
		model.addAttribute("list_end_x", list.get(end_x).getMapx());
		model.addAttribute("list_end_y", list.get(end_y).getMapy());
		
		String id = (String) session.getAttribute("loginId");
		LoginVO vo3 = dao3.getOneVO(id);
		logger.debug("vo3:{}", vo3);
		String add = vo3.getUserAddr2();
		logger.debug("add:{}", add);
		model.addAttribute("add", add);
		
//		return "ttt";
		return "TA/taselect";
	}
	
	@RequestMapping(value = "/ttt2", method = RequestMethod.GET)
	public String ttt2()
	{
		return "ttt2";
	}
	  //
	   @ResponseBody
	   @RequestMapping(value="split", method=RequestMethod.POST)
	   public  HashMap<String, Object> split(String loc, HttpSession session){
		   
		   	logger.debug("loc:{}", loc);
			String ar[] = loc.split("\n");
			String lng = ar[1].substring(4);
			String lat = ar[2].substring(4);
			  
			HashMap<String,Object> map = new HashMap<>();
			map.put("lat", lat);
			map.put("lng", lng);
  
			return map;
	   }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
