package jspexp.a02_mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A10_MVCController
 */
public class A10_MVCController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A10_MVCController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 로그인 MVC 처리..
		// 1. 요청값 처리 : id, pass
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		// 2. model 데이터 처리..
		//    로그인 성공/로그인 실패 설정..
		boolean isSuccess =false;
		if(id!=null && id.equals("himan")) {
			if(pass!=null&&pass.equals("7777")) {
				isSuccess =true;
			}
		}
		if(isSuccess) {
			request.setAttribute("result", "로그인 성공");
		}else {
			request.setAttribute("result", "로그인 실패");
		}
		// 3. jsp(view단 호출)
		String page="a04_basic\\a03_mvc.jsp";// 이동할 jsp 화면 호출..
		if(id==null) { // 요청값이 없을 때, 페이지..
			page="a04_basic\\a03_login.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
		
	}

}
