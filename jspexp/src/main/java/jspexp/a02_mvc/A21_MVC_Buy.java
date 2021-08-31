package jspexp.a02_mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A21_MVC_Buy
 */
@WebServlet(name = "buy.do", urlPatterns = { "/buy.do" })
public class A21_MVC_Buy extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 1. 요청 값
		String priceS = request.getParameter("price");
		String cntS = request.getParameter("cnt");
		// 2. 모델 데이터
		if(priceS!=null) {
			int price = Integer.parseInt(priceS);
			int cnt = Integer.parseInt(cntS);
			// 결과 모델데이터 설정.
			request.setAttribute("sum", price*cnt);
		}
		// 3. view단 호출..
		String page = "a14_mvc\\a02_buyProduct.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);		
	}

}
