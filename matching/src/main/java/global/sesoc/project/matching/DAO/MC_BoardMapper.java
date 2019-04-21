package global.sesoc.project.matching.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.project.matching.VO.MC_BoardVO;
import global.sesoc.project.matching.VO.MC_ReplyVO;




public interface MC_BoardMapper {
	public ArrayList<MC_BoardVO> list(RowBounds rb, String text);
	public int getTotal(String text);
	public MC_BoardVO read(int boardnum);
	//게시글 저장
	public int write(MC_BoardVO vo);
	public void hits(int boardnum);
	//글번호로 해당 게시글 검색
	public MC_BoardVO getBoard(int boardnum);
	public int edit(MC_BoardVO vo);
	public int del(HashMap<String, Object> map);
	public MC_BoardVO search(String searchText);
	public int replyWrite(MC_ReplyVO reply);
	public ArrayList<MC_ReplyVO> replyRead(int boardnum);
/*	public void replyEdit(HashMap<String, Object> map);*/
	public void replyDelete(HashMap<String, Object> map);
}