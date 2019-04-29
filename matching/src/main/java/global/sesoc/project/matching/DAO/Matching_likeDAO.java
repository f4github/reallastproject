package global.sesoc.project.matching.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.project.matching.VO.Matching_likeVO;

@Repository
public class Matching_likeDAO {

	@Autowired
	SqlSession sqlSession;
	//체크
	public Matching_likeVO matching_like_check(Matching_likeVO vo) {
		Matching_likeMapper mapper = sqlSession.getMapper(Matching_likeMapper.class);
		Matching_likeVO vo2 = mapper.matching_like_check(vo);
		return vo2;
	}
	//좋아요 저장
	public void matching_like(Matching_likeVO vo) {
		Matching_likeMapper mapper = sqlSession.getMapper(Matching_likeMapper.class);
		mapper.matching_like(vo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
