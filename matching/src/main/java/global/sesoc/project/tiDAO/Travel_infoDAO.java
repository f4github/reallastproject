package global.sesoc.project.tiDAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.project.tiVO.Travel_infoVO;



@Repository
public class Travel_infoDAO {
	
	@Autowired
	SqlSession sqlSession;

	public void insert(Travel_infoVO vo) {
		Travel_infoMapper mapper = sqlSession.getMapper(Travel_infoMapper.class);
		mapper.insert(vo);
	}

}
