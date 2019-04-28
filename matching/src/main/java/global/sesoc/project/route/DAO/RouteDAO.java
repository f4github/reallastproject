package global.sesoc.project.route.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.project.route.VO.RouteVO;

@Repository
public class RouteDAO {

	@Autowired
	SqlSession sqlSession;
	//경로 저장
	public void routeInsert(RouteVO vo) {
		RouteMapper mapper = sqlSession.getMapper(RouteMapper.class);
		try{
			mapper.routeInsert(vo);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	//경로 호출
	public ArrayList<RouteVO> getRoute_list(String loginId) {
		RouteMapper mapper = sqlSession.getMapper(RouteMapper.class);
		ArrayList<RouteVO> list = mapper.getRoute_list(loginId);
		
		return list;
	}
	
	
	
	
	
	
	
	
}
