package global.sesoc.project.user.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.project.user.VO.LoginVO;


@Repository
public class LoginDAO {

	@Autowired
	SqlSession sqlSession;
	
	/*public LoginVO getMember(String userId) {
		
		LoginMapper mapper = sqlSession.getMapper(LoginMapper.class);
		LoginVO member = null;
		
		member = mapper.login(userId);
		return member;
	}*/
	
	public void join(LoginVO vo){
		LoginMapper mapper = sqlSession.getMapper(LoginMapper.class);
		try{
			mapper.join(vo);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public LoginVO login(LoginVO vo){
		LoginMapper mapper = sqlSession.getMapper(LoginMapper.class);
		LoginVO a = null; 
		try{
			a = mapper.login(vo);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return a;
	}
}
