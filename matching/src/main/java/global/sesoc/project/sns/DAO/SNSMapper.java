package global.sesoc.project.sns.DAO;

import java.util.ArrayList;

import global.sesoc.project.sns.VO.SNSVO;


public interface SNSMapper {

	public void insertSNS(SNSVO vo);

	public void updateTravel_info(SNSVO vo);

	public ArrayList<SNSVO> snsList();

}
