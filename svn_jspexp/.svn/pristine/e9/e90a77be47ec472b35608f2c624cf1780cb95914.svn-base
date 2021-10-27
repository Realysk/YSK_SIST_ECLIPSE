package jspexp.a02_mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.a02_mvc.a02_service.CommonService;

/**
 * Servlet implementation class A22_MemberCheck
 */
@WebServlet(name = "memIdCheck.do", urlPatterns = { "/memIdCheck.do" })
public class A23_MemberCheck2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CommonService service;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A23_MemberCheck2() {
        super();
        // TODO Auto-generated constructor stub
        service = new CommonService();
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
		/*
		if(id!=null) {
			request.setAttribute("idCheck", service.getMember(id)==null?"등록가능":"등록불가능");
		}*/
		// 3. view
		if(id==null) { // 초기 화면
			String page = "a00_exp\\09\\0901.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else { // ajax로 호출할 때..
			// json데이터가 결과물을 전송하여야 한다.
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print( service.getMember(id)==null?"등록가능":"등록불가능");
		}
		// ex) 
	}

}
