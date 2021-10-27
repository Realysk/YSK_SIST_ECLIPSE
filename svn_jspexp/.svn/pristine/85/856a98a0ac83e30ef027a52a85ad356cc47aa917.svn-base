package jspexp.a02_mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A12_ShppingMVC
 */
@WebServlet(name = "shopping.do", urlPatterns = { "/shopping.do" })
public class A12_ShppingMVC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A12_ShppingMVC() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 1. 요청값 처리
		request.setCharacterEncoding("utf-8");
		String pname = request.getParameter("pname");
		String priceS = request.getParameter("price");
		String cntS = request.getParameter("cnt");
		int price = priceS!=null?Integer.parseInt(priceS):0;
		int cnt = cntS!=null?Integer.parseInt(cntS):0;
		// 2. 모델 데이터 처리
		// 구매 물품 @@, 구매가격 @@@, 구매 갯수 @@ 15%할인 금액
		request.setAttribute("pname", pname);
		request.setAttribute("price", price);
		request.setAttribute("cnt", cnt);
		int tot = price*cnt;
		if(tot>=100000) {
			// 15%할인
			request.setAttribute("disratio", 15);
			request.setAttribute("tot", (int)(tot*0.85));
		}else {
			// 3%할인..
			request.setAttribute("disratio", 3);
			request.setAttribute("tot", (int)(tot*0.97));
		}
		// 3. 화면 호출..
		String page = "a04_basic\\a07_buy.jsp";
		if(tot>=100000) {
			page = "a04_basic\\a08_vip.jsp";
			
		}else if(tot>0) {
			page = "a04_basic\\a09_cus.jsp";
		}
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
		
	}

}
