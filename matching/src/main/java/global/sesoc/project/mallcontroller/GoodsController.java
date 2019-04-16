package global.sesoc.project.mallcontroller;


import java.io.File;
import java.io.IOException;
import java.sql.Array;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import global.sesoc.project.mallDAO.UsedDAO;
import global.sesoc.project.mallVO.CartVO;
import global.sesoc.project.mallVO.CategoryVO;
import global.sesoc.project.mallVO.GoodsVO;
import global.sesoc.project.mallVO.ReplyVO;
import global.sesoc.project.util.FileService;
import global.sesoc.project.util.UploadFileUtils;
import net.sf.json.JSONArray;

@Controller
public class GoodsController {

	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);
	
	//업로드할 파일 경로
		final String uploadPath = "d:/boardfile";
	
	/*@Resource(name="uploadPath")
	private String uploadPath;*/
	
	@Autowired
	UsedDAO dao;
	
	//상품등록
	@RequestMapping(value = "usedregister", method = RequestMethod.GET)
	public String usedregister(Model model){
		logger.debug("used Register Form");
		
		ArrayList<CategoryVO> category = null;
		category = dao.category();
		model.addAttribute("category", JSONArray.fromObject(category));
		return"jaehyeon/goods/register3";
	}
	
	@RequestMapping(value = "usedregister", method = RequestMethod.POST)
	public String usedregisterPost(GoodsVO vo,
									MultipartFile upload,
									HttpSession session) throws Exception{
		logger.debug("used register post");
		
		logger.debug("vo:{}",vo);
		String userId = (String) session.getAttribute("loginId");
		logger.debug("아이디 : {}",userId);
		vo.setUserId(userId);
		
		
	if (upload != null && !upload.isEmpty()) {
			String savedfile = FileService.saveFile(upload, uploadPath);
			vo.setGdsOriginalfile(upload.getOriginalFilename());
			vo.setGdsSavedfile(savedfile);
		}
		
		/*String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		vo.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		*/
		
		dao.register(vo);
		
		return"redirect:usedList";
	}
	
	@RequestMapping(value = "usedList", method = RequestMethod.GET)
	public String usedList(Model model){
		logger.debug("usedListForm");
		
		ArrayList<GoodsVO> vo = null;
		
		vo = dao.usedList();
		
		model.addAttribute("usedList", vo);
		
		return "jaehyeon/goods/usedList2";
	}
	
	@RequestMapping(value = "usedView", method = RequestMethod.GET)
	public String usedView(int gdsNum, Model model ){
		logger.debug("usedView");
		
		GoodsVO vo = dao.usedView(gdsNum);
		
		
		model.addAttribute("usedView", vo);
		return "jaehyeon/goods/usedView2";
	}
	
	@RequestMapping(value = "usedCategory", method = RequestMethod.GET)
	public String usedCategory(@RequestParam(value = "c", defaultValue= "0") int cateCode,
								@RequestParam(value = "l", defaultValue= "0") int level,
								Model model)throws Exception{
		logger.debug("category");
		logger.debug("cateCode:{}",cateCode);
		ArrayList<GoodsVO> list = null;
		list = dao.usedCategory(cateCode);
		
		model.addAttribute("usedCategory", list);
		return "jaehyeon/goods/cateList2";
	}
	
	
	// 카트 담기
	@ResponseBody
	@RequestMapping(value = "addCart", method = RequestMethod.POST)
	public int addCart(CartVO cart, HttpSession session){
	 
	 logger.debug("cart : {}",cart);
	 String userId = (String)session.getAttribute("loginId");
	 logger.debug(userId);
	 
	 int result = 0;
	 
		 if(userId != null) {
		  cart.setUserId(userId);
		  dao.addCart(cart);
		  result = 1;
		 }
	 
	 return result;
	}
	
	
	
	// 카트 목록
	@RequestMapping(value = "cartList", method = RequestMethod.GET)
	public String getCartList(HttpSession session, Model model){
	 logger.info("get cart list");
	 
	 
	 
	 String userId = (String)session.getAttribute("loginId");
	 logger.debug("userId:{}",userId);
	 
	 
	 ArrayList<CartVO> cartList = dao.cartList(userId);
	 
	 model.addAttribute("cartList", cartList);
	 
	 return"jaehyeon/goods/cartList2";
	 
	}
	
	// 카트 삭제
	/*@ResponseBody
	@RequestMapping(value = "deleteCart", method = RequestMethod.POST)
	public int deleteCart(HttpSession session,
	     @RequestParam(value = "chbox[]") ArrayList chArr, CartVO cart){
	 logger.info("delete cart");
	 
	 MemberVO member = (MemberVO)session.getAttribute("member");
	 String userId = member.getUserId();
	 
	 String userId = (String)session.getAttribute("loginId");
	 logger.debug(userId);
	 
	 int result = 0;
	 int cartNum = 0;
	 
	 
	 if(userId != null) {
	  cart.setUserId(userId);
	  
	  for(String i : chArr) {   
	   cartNum = Integer.parseInt(i);
	   cart.setCartNum(cartNum);
	   dao.deleteCart(cart);
	  }  
	  return result;
	 }
	
	}*/

	//카트삭제
	@ResponseBody
	@RequestMapping(value = "deleteCart", method = RequestMethod.POST)
	public void deleteCart(int cartNum, HttpSession session, CartVO cart){
		logger.debug("deleteCart Form");
		logger.debug("cartNum : {}", cartNum);
		logger.debug("CartVO :{}", cart);
		String userId = (String)session.getAttribute("loginId");
		cart.setUserId(userId);
		
		dao.deleteCart(cart);
	}
	
	@ResponseBody
	@RequestMapping(value = "replyForm", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	public void replyForm(ReplyVO vo, HttpSession session
			){
		logger.debug("reply form");
		
		String userId = (String)session.getAttribute("loginId");
		vo.setUserId(userId);
		
		dao.registerReply(vo);
		logger.debug("reply form : {}",vo);
		
	}
	
	@ResponseBody
	@RequestMapping(value = "replyList", method = RequestMethod.GET, produces="application/json;charset=UTF-8")
	public ArrayList<ReplyVO> replyList(int gdsNum){
		logger.debug("replyList");
		
		logger.debug("gdsNum:{}",gdsNum);
		ArrayList<ReplyVO> ar;
		ar = dao.replyList(gdsNum);
		return ar;
	}
	
	@ResponseBody
	@RequestMapping(value="deleteReply", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	public int delete(int repNum, HttpSession session, String userId, ReplyVO vo){
		
		logger.debug("delete : {}",repNum);
		logger.debug("delete vo : {}", vo);
		logger.debug("delete UserId : {}",userId);
		
		int result = 0;
		
		String id = (String)session.getAttribute("loginId");
		logger.debug("login Id : {}",id);
		if(userId.equals(id)){
			logger.debug("거쳐감");
			result = 1;
			dao.replyDelete(repNum);
		}
		
		return result;
		
	}
	
	@ResponseBody
	@RequestMapping(value="edit", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	public void edit(int repNum, String repCon, Model model){
		ReplyVO vo = new ReplyVO();
		
		vo.setRepNum(repNum);
		vo.setRepCon(repCon);
		
		logger.debug("edit : {}:",vo);
		
		ArrayList<CategoryVO> category = null;
		category = dao.category();
		model.addAttribute("category", JSONArray.fromObject(category));
		
		
		
		dao.replyEdit(vo);
		
	}
	
	@RequestMapping(value = "usedModifyForm", method = RequestMethod.POST)
	public String usedModifyForm(int gdsNum, Model model){
		logger.debug("usedModifyForm num : {}", gdsNum);
		
		GoodsVO vo = new GoodsVO();
		
		vo = dao.modifyInfo(gdsNum);
		
		ArrayList<CategoryVO> category = null;
		category = dao.category();
		model.addAttribute("category", JSONArray.fromObject(category));
		
		model.addAttribute("modifyInfo", vo);
		return "jaehyeon/goods/usedModify";
	}
	
	@RequestMapping(value = "usedModify", method = RequestMethod.POST)
	public String usedModify(GoodsVO vo, MultipartFile upload, HttpServletRequest req, Model model){
		logger.debug("usedModify : {}",vo);
		logger.debug("modify upload : {}",upload);
		
		if (upload != null && !upload.isEmpty()) {
			String savedfile = FileService.saveFile(upload, uploadPath);
			vo.setGdsOriginalfile(upload.getOriginalFilename());
			vo.setGdsSavedfile(savedfile);
		}
		
		int n = vo.getGdsNum();
		
		dao.modify(vo);
		return"redirect:usedView?gdsNum="+n; 
	}
	
	@RequestMapping(value = "usedDelete", method = RequestMethod.POST)
	public String usedDelete(int gdsNum){
		logger.debug("delete num :{}", gdsNum);
		dao.usedDelete(gdsNum);
		return"redirect:/usedList";
	}
		
}
