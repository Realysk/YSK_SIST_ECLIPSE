package jspexp.a02_mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A11_ShoppingMVC
 */
@WebServlet(name = "shop.do", urlPatterns = { "/shop.do" })
public class A12_ShoppingMVC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A12_ShoppingMVC() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		// 1. 요청 값 처리
		String pname = request.getParameter("pname");
		String priceS = request.getParameter("price");
		String cntS = request.getParameter("cnt");
		int price = priceS!=null?Integer.parseInt(priceS):0;
		int cnt = cntS!=null?Integer.parseInt(cntS):0;
		// 2. Model 데이터 처리
		// 구매물품 : @@@ 구매가격 : @@@ 구매수량 : @@@ 15% 할인 금액
		request.setAttribute("pname", pname);
		request.setAttribute("price", price);
		request.setAttribute("cnt", cnt);
		int tot = price*cnt;
		if(tot>=100000) {
			request.setAttribute("disratio", 15); // 15% 할인
			request.setAttribute("tot", (int)(tot*0.85)); // 15% 할인
		} else {
			request.setAttribute("disratio", 3); // 3% 할인
			request.setAttribute("tot", (int)(tot*0.97)); // 3% 할인
		}
		// 3. 화면 호출
		String page = "a04_basic\\a07_buy.jsp";
		if(tot>=100000) {
			page = "a04_basic\\a08_vip.jsp";
		} else if(tot>0) {
			page = "a04_basic\\a09_cus.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}