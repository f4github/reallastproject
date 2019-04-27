package global.sesoc.project.ti.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.project.ti.DAO.TI_CommentDAO;
import global.sesoc.project.ti.VO.TI_CommentVO;



@Controller
public class TI_CommentController {
	public static final Logger logger = LoggerFactory.getLogger(TI_CommentController.class);
	
	@Autowired
	TI_CommentDAO dao;
	

	
	@ResponseBody
	@RequestMapping(value="ti_comment_write", method=RequestMethod.POST,
			produces="application/json;charset=UTF-8")
	public void write(String text, String contentid, HttpSession session){
		TI_CommentVO vo = new TI_CommentVO();
		String id = (String) session.getAttribute("loginId");		
		vo.setId(id);
		vo.setText(text);
		vo.setContentid(contentid);
		
		logger.debug("vo : {}", vo);
		dao.write(vo);
		return;
	}
	
	@ResponseBody
	@RequestMapping(value="ti_comment_list", method=RequestMethod.GET,
			produces="application/json;charset=UTF-8")
	public ArrayList<TI_CommentVO> list(String contentid){
		ArrayList<TI_CommentVO> ar;
		ar = dao.list(contentid);
		return ar;
	}
	
	@ResponseBody
	@RequestMapping(value="ti_comment_delete", method=RequestMethod.POST)
	public String delete(int num, HttpSession session){
		String id = (String)session.getAttribute("loginId");		
		logger.debug("id : {}", id);
		
		TI_CommentVO check = new TI_CommentVO();
		String result = "t";
		
		check = dao.getVO(num);
		logger.debug("check : {}", check);
		
		if(check.getId().contains(id)){
			dao.delete(num);			
		}
		else{
			result = "f";	
		}				
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="ti_comment_edit", method=RequestMethod.POST)
	public void edit(int num, String text, HttpSession session){
		TI_CommentVO vo = new TI_CommentVO();
		String id1 = (String) session.getAttribute("loginId");		
		vo.setNum(num);
		vo.setId(id1);
		vo.setText(text);
		dao.edit(vo);
		return;
	}
}
