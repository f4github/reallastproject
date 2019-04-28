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
import global.sesoc.project.ta.DAO.TADAO;

import global.sesoc.project.ta.VO.TAVO;
import global.sesoc.project.ti.controller.Travel_info;


@Controller
public class TAController {
	
	@Autowired
	TADAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(TAController.class);
	
	/*@RequestMapping(value = "ta", method=RequestMethod.GET)
	public String taGet() {
		
		return "ta/TAStart";
	}*/
	
	@RequestMapping(value = "ta1", method=RequestMethod.GET)
	public String ta1Get() {
		
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
	public String tacomPOST(String answer7, Model model,HttpSession session) {
		
		String id = (String) session.getAttribute("loginId");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("answer", answer7);
		map.put("id", id);
		dao.vote(map);
		ArrayList<TAVO> list = dao.location(id); //큰지역
		model.addAttribute("list", list);
		
		ArrayList<TAVO> list2 = dao.location2(id); //상세지역
		model.addAttribute("list2",list2);
		
		//dao.TAReset(id); 	//TA초기화
		return "TA/TACOM";
	}
	
	@RequestMapping(value = "taselect", method=RequestMethod.POST)
	public String taselectPost(String travelid[], Model model) {
		
		logger.debug("[0]:{}",travelid[0]);
		logger.debug("[1]:{}",travelid[1]);
		logger.debug("[2]:{}",travelid[2]);
		logger.debug("[3]:{}",travelid[3]);
		Travel_info vo = new Travel_info();
		ArrayList<Travel_info> list = new ArrayList<>();
		
		for(int i=0 ; i<travelid.length ; i++){
			vo = dao.selectTravel(travelid[i]);
			list.add(vo);
		}
		
		
				
		return "ta/taselect";
	}
	
/*	
	@RequestMapping(value = "taselect", method=RequestMethod.POST)
	public String taselectPost(String travelid, Model model) {		
		logger.debug("결과:{}",travelid);
		Travel_info vo = new Travel_info();
		ArrayList<Travel_info> list = new ArrayList<>();
		
		vo.
		
		//dao.selectTravel(travelid);
		
		return "ta/taselect";
	}
*/	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
