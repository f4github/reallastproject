package global.sesoc.project.user.DAO;

import global.sesoc.project.user.VO.LoginVO;

public interface LoginMapper {

	public LoginVO login(LoginVO vo);

	public void join(LoginVO vo);
//하나 가져온다
	public LoginVO getOneVO(String id);

}
