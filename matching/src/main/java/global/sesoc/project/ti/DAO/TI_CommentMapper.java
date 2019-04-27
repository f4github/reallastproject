package global.sesoc.project.ti.DAO;

import java.util.ArrayList;

import global.sesoc.project.ti.VO.TI_CommentVO;



public interface TI_CommentMapper {
	public int insert(TI_CommentVO vo);
	public ArrayList<TI_CommentVO> list(String contentid);
	public void delete(int num);
	public void edit(TI_CommentVO vo);
	public TI_CommentVO getVO(int num);
}
