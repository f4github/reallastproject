package global.sesoc.project.user.DAO;

import global.sesoc.project.user.VO.LoginVO;

public interface LoginMapper {

	public LoginVO login(LoginVO vo);

	public void join(LoginVO vo);

}
