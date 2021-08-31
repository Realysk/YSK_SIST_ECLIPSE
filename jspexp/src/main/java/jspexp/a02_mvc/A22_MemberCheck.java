package jspexp.a02_mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.a02_mvc.a02_service.A22_MemberService;

/**
 * Servlet implementation class A22_MemberCheck
 */
@WebServlet(name = "memCheck.do", urlPatterns = { "/memCheck.do" })
public class A22_MemberCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private A22_MemberService service;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A22_MemberCheck() {
        super();
        // TODO Auto-generated constructor stub
        service = new A22_MemberService();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 1. 요청
		String id = request.getParameter("id");
		// 2. 모델
		//     service --> dao
		if(id!=null) {
			request.setAttribute("member", service.getMember(id));
		}
		// 3. view
		String page = "a14_mvc\\a03_memberCheck.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
		// ex) 
	}

}
