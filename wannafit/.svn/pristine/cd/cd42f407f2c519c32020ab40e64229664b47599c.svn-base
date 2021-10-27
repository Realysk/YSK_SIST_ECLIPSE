package wannafit.content.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import wannafit.content.user.UserService;
import wannafit.content.vo.User;

/**
 * Servlet implementation class memCRUDCtrl
 */
@WebServlet(name = "mamcrud.do", urlPatterns = { "/mamcrud.do" })
public class memCRUDCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private memCRUDServ service;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memCRUDCtrl() {
        super();
        // TODO Auto-generated constructor stub
        service = new memCRUDServ();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		
		String proc2 = request.getParameter("proc2");
		String wm_id = request.getParameter("wm_id");
		String wm_pass = request.getParameter("wm_pass");
		String wm_email = request.getParameter("wm_email");
		String wm_nick = request.getParameter("wm_nick");
		String wm_tel = request.getParameter("wm_tel");
		
		
		System.out.println("프로세스 : " + proc2);
		System.out.println("회원 정보 - ID : " + wm_id + ", PASS : " + wm_pass + ", EMAIL : " + wm_email + 
							", NICKNAME : " + wm_nick + ", TEL : " + wm_tel);
		
		
		HttpSession session = request.getSession(true);
		String group = (String) session.getAttribute("login_UsrGroup");
		String usrSession = (String) session.getAttribute("login_User");
		System.out.println("-----------");
		System.out.println("[마이페이지] 회원세션 : " + usrSession);
		System.out.println("[마이페이지] 회원그룹세션 : " + group);
		
		if(proc2 == null) {
			if(group.equals("일반회원")) {
				response.sendRedirect("content\\mypage\\mypage_memCRUD2.jsp");
			} else if(group.equals("트레이너")) {
				response.sendRedirect("content\\mypage\\trainer\\MP002-Trcrud.jsp");
			} else if(group.equals("헬스장")) {
				;
			} else if(group.equals("기업")) {
				;
			} else {
				;
			}
			
		} else {
			response.setContentType("text/html;charset=utf-8");
			
			if(proc2 != null) {
				if(proc2.equals("sch")) {
					response.getWriter().print(service.getMemberJson(wm_id));
				}
				if(proc2.equals("upt")){
					User upt = new User(wm_id, wm_pass, wm_email, wm_nick, wm_tel);
					response.getWriter().print(service.uptmemJson(upt));
				}
				if(proc2.equals("del")){
					User del = new User(wm_id, wm_pass, wm_email, wm_nick, wm_tel);
					response.getWriter().print(service.delmemJson(del));
				}				
			}
		}
		
	}
}
