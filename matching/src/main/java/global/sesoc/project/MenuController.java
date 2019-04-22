package global.sesoc.project;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.project.mallDAO.UsedDAO;
import global.sesoc.project.mallVO.CartVO;
import global.sesoc.project.mallVO.GoodsVO;
import global.sesoc.project.ti.DAO.Travel_infoDAO;
import global.sesoc.project.ti.VO.Trip_likeVO;

@Controller
public class MenuController {

	private final static Logger logger = LoggerFactory.getLogger(MenuController.class);
	
	
		@Autowired
		UsedDAO dao;
		@Autowired
		Travel_infoDAO tidao;

		@RequestMapping(value = "/about-us", method = RequestMethod.GET)
		public String Menu1()
		{
			return "about-us";
		}
		//
		@RequestMapping(value = "/TA_home", method = RequestMethod.GET)
		public String Menu2()
		{
			return "TA/TA_home";
		}
		//TA 질문
		@RequestMapping(value = "/TA1", method = RequestMethod.GET)
		public String TA1()
		{
			return "TA/TA1";
		}
		//TA 여행지 선택
		@RequestMapping(value = "/TA2", method = RequestMethod.GET)
		public String TA2()
		{
			return "TA/TA2";
		}

		@RequestMapping(value = "/services", method = RequestMethod.GET)
		public String Menu4()
		{
			return "services";
		}
		@RequestMapping(value = "/mypage", method = RequestMethod.GET)
		public String Menu5(HttpSession session, Model model)
		{
			String id = (String) session.getAttribute("loginId");
			
			//ti 찜 목록
			ArrayList<Trip_likeVO> list = tidao.getList(id);
			model.addAttribute("tiList", list);
			
			
			 
			 
			 
			 ArrayList<CartVO> cartList = dao.cartList(id);
			 
			 model.addAttribute("cartList", cartList);
			
			
			
			
			return "mypage";
		}
		@RequestMapping(value = "/cusupdate", method = RequestMethod.GET)
		public String Menu6()
		{
			return "cusupdate";
		}
		
		@RequestMapping(value = "/mall", method = RequestMethod.GET)
		public String mall(Model model){
			
			logger.debug("mall");
			
			ArrayList<GoodsVO> vo = null;
			
			vo = dao.usedList();
			
			model.addAttribute("usedList2", vo);
			return "mall";
		}

}
