package jspexp.a02_mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A20_MVC_Calcu
 */
@WebServlet(name = "calcu.do", urlPatterns = { "/calcu.do" })
public class A20_MVC_Calcu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A20_MVC_Calcu() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 1. 요청 값
		String num01S = request.getParameter("num01");
		String num02S = request.getParameter("num02");
		String calS = request.getParameter("cal");
		// 2. 모델 데이터
		if(num01S!=null) {
			int num01 = Integer.parseInt(num01S);
			int num02 = Integer.parseInt(num02S);
			int calIdx = Integer.parseInt(calS);
			String cals[]= {" + "," - "," * "," / "};
			int result[]= {num01+num02,num01-num02,num01*num02,num01/num02};
			// 결과 모델데이터 설정.
			request.setAttribute("cal", cals[calIdx]);
			request.setAttribute("sum", result[calIdx]);
		}
		// 3. view단 호출..
		String page = "a14_mvc\\a01_basic.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
		
	}

}
