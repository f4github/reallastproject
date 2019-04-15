package global.sesoc.project.dao;

import global.sesoc.project.vo.LoginVO;

public interface LoginMapper {

	public LoginVO login(LoginVO vo);

	public void join(LoginVO vo);


}
