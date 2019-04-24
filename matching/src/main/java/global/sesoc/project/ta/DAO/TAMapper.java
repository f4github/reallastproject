package global.sesoc.project.ta.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import global.sesoc.project.ta.VO.TAVO;
import global.sesoc.project.ta.VO.Travel_infoVO;


public interface TAMapper {

	public void vote(HashMap<String, Object> map);

	public ArrayList<TAVO> location(String id);

	public ArrayList<TAVO> location2(String id);
	
	public void TAReset(String id);

	public ArrayList<Travel_infoVO> selectTravel(String travelid);


	
}

