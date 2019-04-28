package global.sesoc.project.route.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.project.mallcontroller.GoodsController;
import global.sesoc.project.route.DAO.RouteDAO;
import global.sesoc.project.route.VO.RouteVO;

@Controller
public class RouteController {
	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);
	
	@Autowired
	RouteDAO dao;
	
	//경유지 저장
	@RequestMapping(value = "routePrint", method = RequestMethod.GET)
	public String routePrint(String title, Model model, HttpSession session){
		logger.debug("title: {}", title);
		RouteVO vo = (RouteVO)session.getAttribute("routeVO");
		
		vo.setTitle(title);
		logger.debug("routeVO:{}",vo);
		session.setAttribute("routeVO", vo);
		model.addAttribute("vo", vo);
		dao.routeInsert(vo);
		
		return "route/routeView";
	}
	
	
	
}
