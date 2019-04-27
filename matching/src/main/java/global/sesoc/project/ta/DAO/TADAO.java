package global.sesoc.project.ta.DAO;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import global.sesoc.project.ta.VO.TAVO;
import global.sesoc.project.ta.VO.Travel_infoVO;
import global.sesoc.project.ti.DAO.Travel_infoMapper;
import global.sesoc.project.ti.controller.Travel_info;


@Repository
public class TADAO {

	@Autowired
	SqlSession sqlsession;

	public void vote(HashMap<String, Object> map) {
		
		TAMapper mapper = sqlsession.getMapper(TAMapper.class);
		mapper.vote(map);
	}

	public ArrayList<TAVO> location(String id) {
		
		TAMapper mapper = sqlsession.getMapper(TAMapper.class);
		
		ArrayList<TAVO> list = mapper.location(id);
		
		return list;
	}
	public ArrayList<TAVO> location2(String id) {
		
		TAMapper mapper = sqlsession.getMapper(TAMapper.class);
		
		ArrayList<TAVO> list2 = mapper.location2(id);
		
		return list2;
	}

	public void TAReset(String id) {
		TAMapper mapper = sqlsession.getMapper(TAMapper.class);
		
		mapper.TAReset(id);
	}

	public Travel_info selectTravel(String travelid) {
		Travel_infoMapper mapper = sqlsession.getMapper(Travel_infoMapper.class);
		
		Travel_info vo =  mapper.selectTravel(travelid);
		
		return vo;
	}

}
