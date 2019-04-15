package global.sesoc.project.mallDAO;

import java.awt.List;
import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import global.sesoc.project.mallVO.CartVO;
import global.sesoc.project.mallVO.CategoryVO;
import global.sesoc.project.mallVO.GoodsVO;
import global.sesoc.project.mallVO.ReplyVO;

@Repository
public class UsedDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public ArrayList<CategoryVO> category(){
		UsedMapper mapper = sqlSession.getMapper(UsedMapper.class);
		ArrayList<CategoryVO> category = null;
		try{
			category = mapper.category();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return category;
		
	}
	
	public void register(GoodsVO vo){
		UsedMapper mapper = sqlSession.getMapper(UsedMapper.class);
		
		try{
			mapper.register(vo);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public ArrayList<GoodsVO> usedList(){
		UsedMapper mapper = sqlSession.getMapper(UsedMapper.class);
		ArrayList<GoodsVO> vo = null;
		try{
			vo = mapper.usedList();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return vo;
	}
	
	public GoodsVO usedView(int gdsNum){
		UsedMapper mapper = sqlSession.getMapper(UsedMapper.class);
		GoodsVO vo = new GoodsVO();
		try{
			vo=mapper.usedView(gdsNum);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return vo;
	}
	
	public ArrayList<GoodsVO> usedCategory(int cateCode){
		UsedMapper mapper = sqlSession.getMapper(UsedMapper.class);
		ArrayList<GoodsVO> list = null;
		try{
			list = mapper.usedCategory(cateCode);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	public void addCart(CartVO cart){
		UsedMapper mapper = sqlSession.getMapper(UsedMapper.class);
		try{
			mapper.addCart(cart);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public ArrayList<CartVO> cartList(String userId){
		UsedMapper mapper = sqlSession.getMapper(UsedMapper.class);
		ArrayList<CartVO> list = null;
		try{
			list = mapper.cartList(userId);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	public void deleteCart(CartVO cart){

		UsedMapper mapper = sqlSession.getMapper(UsedMapper.class);
		try{
			mapper.deleteCart(cart);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void registerReply(ReplyVO vo){
		
		UsedMapper mapper = sqlSession.getMapper(UsedMapper.class);
		try{
			mapper.registerReply(vo);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public ArrayList<ReplyVO> replyList(int gdsNum){
		UsedMapper mapper = sqlSession.getMapper(UsedMapper.class);
		ArrayList<ReplyVO> ar = null;
		try{
			ar = mapper.replyList(gdsNum);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return ar;
	}
	
	public void replyDelete(int repNum){
		UsedMapper mapper = sqlSession.getMapper(UsedMapper.class);
		try{
			mapper.replyDelete(repNum);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void replyEdit(ReplyVO vo){
		UsedMapper mapper = sqlSession.getMapper(UsedMapper.class);
		
		try{
			mapper.replyEdit(vo);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return;
	}
	
	public void usedDelete(int gdsNum){
		UsedMapper mapper = sqlSession.getMapper(UsedMapper.class);
		try{
			mapper.usedDelete(gdsNum);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public GoodsVO modifyInfo(int gdsNum){
		UsedMapper mapper = sqlSession.getMapper(UsedMapper.class);
		GoodsVO vo = new GoodsVO();
		try{
			vo = mapper.modifyInfo(gdsNum);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return vo;
	}
	
	public void modify(GoodsVO vo){
		UsedMapper mapper = sqlSession.getMapper(UsedMapper.class);
		try{
			mapper.modify(vo);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}
