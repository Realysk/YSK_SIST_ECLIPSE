package jspexp.a02_mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jspexp.z02_vo.Member;

/**
 * Servlet implementation class A11_LoginMVC
 */
@WebServlet(name = "login.do", urlPatterns = { "/login.do" })
public class A11_LoginMVC extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private A13_LoginService service;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A11_LoginMVC() {
        super();
        service = new A13_LoginService();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 1. 요청값 처리.
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");	
		String proc = request.getParameter("proc");
		HttpSession session = request.getSession();
		// 2. 모델 처리.
		boolean isValid = false;
		if(id!=null&&pass!=null) {
			Member m = service.login2(id, pass);
			// 요청값을 분기에 따른 처리..
			if(m!=null) {
				isValid = true;
				request.setAttribute("msg","로그인 성공");
				// session 값처리..
				session.setAttribute("mem",m);
			}else {
				request.setAttribute("msg","로그인 실패");
			}
		}
		if(proc!=null&&proc.equals("logout")) {
			session.invalidate(); //세션값을 삭제 처리한다.
		}
		
		// 3. 화면 호출.
		String page = "a04_basic\\a05_login.jsp";
		// 로그인 성공했을 때, 페이지 지정.
		if(isValid) {
			page = "a04_basic\\a06_main.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
		
		
		
	}

}
