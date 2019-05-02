package global.sesoc.project.mallDAO;

import java.util.ArrayList;

import global.sesoc.project.mallVO.CartVO;
import global.sesoc.project.mallVO.CategoryVO;
import global.sesoc.project.mallVO.GoodsVO;
import global.sesoc.project.mallVO.ReplyVO;

public interface UsedMapper {

	public ArrayList<CategoryVO> category();

	public void register(GoodsVO vo);

	public ArrayList<GoodsVO> usedList();

	public GoodsVO usedView(int gdsNum);

	public ArrayList<GoodsVO> usedCategory(int cateCode);

	public void addCart(CartVO cart);

	public ArrayList<CartVO> cartList(String userId);

	public void deleteCart(CartVO cart);
	
	public void registerReply(ReplyVO vo);
	
	public ArrayList<ReplyVO> replyList(int gdsNum);

	public void replyEdit(ReplyVO vo);

	public void replyDelete(int repNum);

	public void usedDelete(int gdsNum);

	public GoodsVO modifyInfo(int gdsNum);

	public void modify(GoodsVO vo);

	public ArrayList<GoodsVO> myArticle(String userId);

	public ArrayList<ReplyVO> myArticleReply(String userId);

	public CartVO checkCart(CartVO cart);

}
