package global.sesoc.project.sns.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;


import global.sesoc.project.sns.DAO.SNSDAO;
import global.sesoc.project.util.FileService;
import global.sesoc.project.sns.VO.SNSVO;


@Controller
public class SnsController {
	
	@Autowired
	SNSDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(SnsController.class);
	
	final String uploadPath="c:/Users/user/git/reallastproject/matching/src/main/webapp/resources/img";
	
	@RequestMapping(value = "sns", method=RequestMethod.GET)
	public String snsGet() {
		
		return "SnsWrite";
	}
	
	@RequestMapping(value = "snsboard", method=RequestMethod.GET)
	public String snsboardGet(SNSVO vo, Model model,HttpSession session) {
		String id = (String) session.getAttribute("loginId");
		vo.setId(id);
		ArrayList<SNSVO> snsList = dao.snsList();
		model.addAttribute("snsList",snsList);
		//logger.debug("snsList:{}",snsList);
		return "SnsBoard";
	}
	
	@RequestMapping(value = "SnsBoard", method=RequestMethod.POST)
	public String snsPost(SNSVO vo, MultipartFile upload, Model model,HttpSession session) {
		  
		
		String id = (String) session.getAttribute("loginId");
		vo.setId(id);

		//첨부파일이 있는경우 저장된 경로에 저장하고, 원폰 파일명과 저장된 파일명을  SNS객체에 세팅
		  if (upload != null && !upload.isEmpty())
		  {
			  String savedfile = FileService.saveFile(upload, uploadPath);
			  vo.setOriginalFile(upload.getOriginalFilename());
			  vo.setSavedFile(savedfile);
		  }
		logger.debug("넘어와라:{}",vo); 
		dao.insertSNS(vo);
		dao.updateTravel_info(vo);
		ArrayList<SNSVO> snsList = dao.snsList();
		model.addAttribute("snsList",snsList);
		return "SnsBoard";
	}
	
}
