package global.sesoc.project.ti.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.project.ti.VO.Travel_infoVO;
import global.sesoc.project.ti.VO.Trip_likeVO;



@Repository
public class Travel_infoDAO {
	
	@Autowired
	SqlSession sqlSession;

	public void insert(Travel_infoVO vo) {
		Travel_infoMapper mapper = sqlSession.getMapper(Travel_infoMapper.class);
		mapper.insert(vo);
	}
	//좋아요
	public void trip_like(Trip_likeVO vo) {
		Travel_infoMapper mapper = sqlSession.getMapper(Travel_infoMapper.class);
		mapper.trip_like(vo);
		
	}
	//좋아요 중복체크
	public Trip_likeVO trip_like_chek(Trip_likeVO vo) {
		Travel_infoMapper mapper = sqlSession.getMapper(Travel_infoMapper.class);
		Trip_likeVO check = mapper.trip_like_chek(vo);
		
		return check;
	}
	//좋아요 목록
	public ArrayList<Trip_likeVO> getList(String id) {
		Travel_infoMapper mapper = sqlSession.getMapper(Travel_infoMapper.class);
		ArrayList<Trip_likeVO> list = mapper.getList(id);
		
		return list;
	}
	public void likeDel(int likenum) {
		Travel_infoMapper mapper = sqlSession.getMapper(Travel_infoMapper.class);
		mapper.likeDel(likenum);
		
	}

}
