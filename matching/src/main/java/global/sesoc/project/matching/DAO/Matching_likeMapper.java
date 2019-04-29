package global.sesoc.project.matching.DAO;

import global.sesoc.project.matching.VO.Matching_likeVO;

public interface Matching_likeMapper {
	//체크
	public Matching_likeVO matching_like_check(Matching_likeVO vo);
	//좋아요 저장
	public void matching_like(Matching_likeVO vo);
}
