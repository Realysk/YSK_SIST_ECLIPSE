package jspexp.a02_mvc;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A24_AjaxController
 */
@WebServlet(name = "buy02.do", urlPatterns = { "/buy02.do" })
public class A24_AjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 1. 요청값 처리.
		String priceS = request.getParameter("price");
		String cntS = request.getParameter("cnt");
		
		// 3. 초기화면호출
		if(priceS==null) {
			request.getRequestDispatcher("a14_mvc\\a04_mvcAjax.jsp").forward(request, response);
		}else {
			response.setContentType("text/html;charset=utf-8");
			int price = Integer.parseInt(priceS);
			int cnt = Integer.parseInt(cntS);
			response.getWriter().print("총합은 "+(price*cnt));
		}
	}

}
