package global.sesoc.project.ti.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.project.ti.VO.TI_CommentVO;



@Repository
public class TI_CommentDAO {

	@Autowired
	SqlSession sqlSession;
	
	public int write(TI_CommentVO vo){
		TI_CommentMapper mapper = sqlSession.getMapper(TI_CommentMapper.class);
		int cnt = 0;
		cnt = mapper.insert(vo);
		return cnt;
	}
	
	public ArrayList<TI_CommentVO> list(String contentid){
		TI_CommentMapper mapper = sqlSession.getMapper(TI_CommentMapper.class);
		ArrayList<TI_CommentVO> ar;
		ar = mapper.list(contentid);
		return ar;
	}
	
	public void delete(int num){
		TI_CommentMapper mapper = sqlSession.getMapper(TI_CommentMapper.class);
		mapper.delete(num);		
		return;
	}
	
	public void edit(TI_CommentVO vo){
		TI_CommentMapper mapper = sqlSession.getMapper(TI_CommentMapper.class);
		mapper.edit(vo);
		return;
	}

	public TI_CommentVO getVO(int num) {
		TI_CommentMapper mapper = sqlSession.getMapper(TI_CommentMapper.class);
		TI_CommentVO vo2 = mapper.getVO(num);
		return vo2;
	}
}
