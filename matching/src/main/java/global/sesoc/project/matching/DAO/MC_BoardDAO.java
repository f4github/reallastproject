package global.sesoc.project.matching.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import global.sesoc.project.matching.VO.MC_BoardVO;
import global.sesoc.project.matching.VO.MC_ReplyVO;




@Repository
public class MC_BoardDAO {

	@Autowired
	SqlSession sqlSession;
	
	public ArrayList<MC_BoardVO> list(int start, int count, String text){
		MC_BoardMapper mapper = sqlSession.getMapper(MC_BoardMapper.class);
		
		//RowBounds = start부터 count 갯수만큼 가져오는 함수.
		RowBounds rb = new RowBounds(start, count);
		
		ArrayList<MC_BoardVO> boardlist = mapper.list(rb, text);
		return boardlist;
	}
	
	public int getTotal(String text){
		MC_BoardMapper mapper = sqlSession.getMapper(MC_BoardMapper.class);
		int cnt = 0;
		cnt = mapper.getTotal(text);
		return cnt;
	}
	
	public MC_BoardVO read(int boardnum){
		MC_BoardMapper mapper = sqlSession.getMapper(MC_BoardMapper.class);
		MC_BoardVO vo = null;
		vo = mapper.read(boardnum);
		return vo;
	}
	
	public MC_BoardVO search(String searchText){
		MC_BoardMapper mapper = sqlSession.getMapper(MC_BoardMapper.class);
		MC_BoardVO vo = mapper.search(searchText);
		return vo;
	}
	
	public int write(MC_BoardVO vo){
		MC_BoardMapper mapper = sqlSession.getMapper(MC_BoardMapper.class);
		int cnt = 0;
		cnt = mapper.write(vo);
		return cnt;
	}
	
	public void hits(int boardnum){
		MC_BoardMapper mapper = sqlSession.getMapper(MC_BoardMapper.class);
		mapper.hits(boardnum);
	}
	
	public MC_BoardVO get(int boardnum) {
		MC_BoardMapper mapper = sqlSession.getMapper(MC_BoardMapper.class);
		//해당 번호의 글정보 읽기
		MC_BoardVO board = mapper.getBoard(boardnum);
		return board;
	}
	
	public int edit(MC_BoardVO vo){
		MC_BoardMapper mapper = sqlSession.getMapper(MC_BoardMapper.class);
		int cnt = 0;
		cnt = mapper.edit(vo);
		return cnt;
	}
	
	public int delete(String id, int boardnum){
		MC_BoardMapper mapper = sqlSession.getMapper(MC_BoardMapper.class);
		int cnt = 0;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("boardnum", boardnum);
		
		cnt = mapper.del(map);
		
		return cnt;
	}
	
	public int replyWrite(MC_ReplyVO reply){
		MC_BoardMapper mapper = sqlSession.getMapper(MC_BoardMapper.class);
		int cnt = mapper.replyWrite(reply);
		return cnt;
	}
	
	public ArrayList<MC_ReplyVO> replyRead(int boardnum){
		MC_BoardMapper mapper = sqlSession.getMapper(MC_BoardMapper.class);
		ArrayList<MC_ReplyVO> reply = null;
		reply = mapper.replyRead(boardnum);
		return reply;
	}
/*	
	public void replyEdit(int replynum, String id){
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("replynum", replynum);
		map.put("id", id);
		mapper.replyEdit(map);
	}
*/	
	public void replyDelete(int replynum, String id){
		MC_BoardMapper mapper = sqlSession.getMapper(MC_BoardMapper.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("replynum", replynum);
		map.put("id", id);
		mapper.replyDelete(map);
	}

	//마이페이지에 뿌려줄 리스트
	public ArrayList<MC_BoardVO> getlist(String id) {
		MC_BoardMapper mapper = sqlSession.getMapper(MC_BoardMapper.class);
		ArrayList<MC_BoardVO> list = mapper.getlist(id);
		return list;
	}
	

	
	
	
}
