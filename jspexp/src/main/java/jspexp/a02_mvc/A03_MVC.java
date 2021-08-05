package jspexp.a02_mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A03_MVC
 */
@WebServlet(name = "mvc02.do", urlPatterns = { "/mvc02.do" })
public class A03_MVC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A03_MVC() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// # Controller의 주요 기능
		// 1. 요청 값 처리
		String num01S = request.getParameter("num01");
		String num02S = request.getParameter("num01");
		// 2. 모델 데이터 설정 (Controller <==> Service <==> DAO)
		//		View단에 넘겨 줄 핵심 데이터 설정
		int num01 = 0; if(num01S != null) num01 = Integer.parseInt(num01S);
		int num02 = 0; if(num02S != null) num02 = Integer.parseInt(num02S);
		request.setAttribute("num01", num01);
		request.setAttribute("num02", num02);
		request.setAttribute("sum", num01+num02);
		// 3. VIEW 화면 처리
		String page = "a00_exp\\a0805_view.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
 
	}

}
