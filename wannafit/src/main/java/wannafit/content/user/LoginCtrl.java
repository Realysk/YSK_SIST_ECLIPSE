package wannafit.content.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import wannafit.content.vo.User;

/**
 * Servlet implementation class LoginCtrl
 */
@WebServlet(name = "login.do", urlPatterns = { "/login.do" })
public class LoginCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService service;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCtrl() {
        super();
        service = new UserService();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String proc = (request.getParameter("proc")==null)?"":request.getParameter("proc");
		String UsrGroup = (request.getParameter("UsrGroup")==null)?"":request.getParameter("UsrGroup");
		String id = request.getParameter("wm_id");
		String nick = request.getParameter("wm_nick");


		
		// 세션 호출 
		HttpSession session = request.getSession(true);
		String group = (String) session.getAttribute("login_UsrGroup");
		String usrSession = (String) session.getAttribute("login_User");
		boolean isLogin = false;

		User user = null;
		String page = "";

		System.out.println("-----------");
		System.out.println("[로그인] 회원세션 : " + usrSession);
		System.out.println("[로그인] 회원그룹세션 : " + group);
		System.out.println("[로그인] 로그인여부 : " + isLogin);
		
		if(usrSession != null) {
			System.out.println("회원확인!" +usrSession );
			isLogin = true;
		}
		
		// 로그인 판별
			if(proc.equals("로그인시도")) {
					
				String pass = request.getParameter("wm_pass");

				user = service.login(id, pass);
				System.out.println("user객체" + user);
			
				if(UsrGroup.equals("회원") && user != null) {
					isLogin = true;
					// 회원 구분 후 세션 설정
					session.setAttribute("login_User", user.getWm_id());
					session.setAttribute("login_UsrGroup", user.getWm_usrGroup_Title()); 
				} else {
					request.setAttribute("resultAlert", "로그인에 실패했습니다");
				}	
					
				System.out.println("isLogin값 " + isLogin);
			}
		
		// 초기화면
		if(isLogin) {
			page = "content\\Main-logout.jsp";
		} else {
			page = "content\\Main.jsp";
		}	
		
		// 로그인을 눌렀을 때
		if(proc.equals("로그인")) {
			page = "content\\user\\UT001-Login.jsp";
			
		}
		
		// 로그아웃 눌렀을 때 세션삭제
		if(proc.equals("로그아웃")) {
			session.removeAttribute("login_User");
			session.removeAttribute("login_UsrGroup");
			
			page = "content\\Main.jsp";
		}
		
		
		
		
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}
}
