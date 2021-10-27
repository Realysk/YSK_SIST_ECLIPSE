package wannafit.content.user;

import wannafit.content.vo.User;

public class JoinService {
	private JoinDAO dao;
	
	public JoinService() {
		super();
		dao = new JoinDAO();
	}

	public boolean isIdCk(String id) {
		System.out.println("아이디 중복확인");
		return dao.isIdCk(id);
	}
	
	public boolean isNickCk(String nick) {
		System.out.println("닉네임 중복확인");
		return dao.isNickCk(nick);
	}
	
	public String join(User user) {
		System.out.println("회원가입");
		return dao.join(user);
	};
}
