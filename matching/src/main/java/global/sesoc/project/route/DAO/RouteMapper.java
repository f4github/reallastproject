package global.sesoc.project.route.DAO;

import java.util.ArrayList;

import global.sesoc.project.route.VO.RouteVO;

public interface RouteMapper {
	//경로저장
	public void routeInsert(RouteVO vo);
	//경로호출
	public ArrayList<RouteVO> getRoute_list(String loginId);

}
