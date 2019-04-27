package global.sesoc.project.user.controller;

import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.project.user.DAO.LoginDAO;
import global.sesoc.project.user.VO.LoginVO;

@Controller
public class LoginController {
	@Autowired
	LoginDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping (value="login", method=RequestMethod.GET)
	public String loginForm() {
		
		return "loginform";
	}
	
	/*@RequestMapping (value="login", method=RequestMethod.POST)
	public String login(String id, String password, Model model, HttpSession session, LoginVO vo) {
		
		logger.debug("vo : {}", vo);
		vo = dao.getMember(id);
		
		if ( vo != null && password.equals(vo.getUserPass()))
		{
			session.setAttribute("loginId", vo.getUserId());
			return "redirect:/";
		}
		return "redirect:/login";
	}*/
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(LoginVO vo, HttpSession session){
		logger.debug("login vo : {}", vo);
		
		LoginVO a = null;
		a = dao.login(vo);
		if(a!=null){
			session.setAttribute("loginInfo", vo);
			session.setAttribute("loginId", vo.getUserId());
			return"home";
		}
		else{
			return"loginform";
		}
		
	}
	
	@RequestMapping (value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session){
		session.invalidate();
		
		return "redirect:/";
	}
	
	/*@RequestMapping (value = "logout", method = RequestMethod.GET)
	public String logout()*/
	
	@RequestMapping(value = "joinForm", method = RequestMethod.GET)
	public String joinForm(){
		
		return"joinForm";
	}
	
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(LoginVO vo){
		logger.debug("LoginVO : {}",vo);
		dao.join(vo);
		
		return"redirect:/login";
	}
/*	//아이디 중복 체크
	@RequestMapping(value = "/checkSignup", method = RequestMethod.POST)
		public @ResponseBody String AjaxView(  
			        @RequestParam("id") String id){
			String str = "";
			int idcheck = dao.idCheck(id);
			if(idcheck==1){ //이미 존재하는 계정
				str = "NO";	
			}else{	//사용 가능한 계정
				str = "YES";	
			}
			return str;
		}*/
}


