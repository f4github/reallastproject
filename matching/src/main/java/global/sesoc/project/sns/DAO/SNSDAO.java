package global.sesoc.project.sns.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.project.sns.VO.SNSVO;


@Repository
public class SNSDAO {

	@Autowired
	SqlSession sqlsession;
	
	public void insertSNS(SNSVO vo){
	
		SNSMapper mapper = sqlsession.getMapper(SNSMapper.class);
		
		mapper.insertSNS(vo);
	}

	public void updateTravel_info(SNSVO vo) {
		SNSMapper mapper = sqlsession.getMapper(SNSMapper.class);
		
		mapper.updateTravel_info(vo);
		
	}

	public ArrayList<SNSVO> snsList() {
		SNSMapper mapper = sqlsession.getMapper(SNSMapper.class);
		
		ArrayList<SNSVO> snsList = mapper.snsList();
		return snsList;
	}



}
