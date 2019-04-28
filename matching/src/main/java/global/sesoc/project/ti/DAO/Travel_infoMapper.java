package global.sesoc.project.ti.DAO;

import java.util.ArrayList;

import global.sesoc.project.ta.VO.Travel_infoVO;
import global.sesoc.project.ti.VO.Trip_likeVO;

public interface Travel_infoMapper {
	//저장
//	public void insert(Travel_infoVO vo);
	//좋아요
	public void trip_like(Trip_likeVO vo);
	//좋아요 중복체크
	public Trip_likeVO trip_like_chek(Trip_likeVO vo);
	//좋아요 리스트
	public ArrayList<Trip_likeVO> getList(String id);
	//좋아요 취소
	public void likeDel(int likenum);
	


}
