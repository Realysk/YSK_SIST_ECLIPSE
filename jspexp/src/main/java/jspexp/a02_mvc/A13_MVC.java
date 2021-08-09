package jspexp.a02_mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class A13_MVC
 */
@WebServlet(name = "gogo.do", urlPatterns = { "/gogo.do" })
public class A13_MVC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A13_MVC() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 1. 요청 값
		String inReplyS = request.getParameter("inReply");
		String gradeS = request.getParameter("grade");
		String cntS = request.getParameter("cnt");
		// 2. 모델 데이터 처리 (구구단 문제 전송)
		boolean isCorr = false;
		// if(inReplyS == null) { // 초기 페이지
			request.setAttribute("grade", (int)(Math.random()*8+2));
			request.setAttribute("cnt", (int)(Math.random()*9+1));			
		if(inReplyS != null) { // 정답을 입력했을 때
			int inReply = Integer.parseInt(inReplyS);
			int grade = Integer.parseInt(gradeS);
			int cnt = Integer.parseInt(cntS);
			if(inReply==(grade*cnt)) {
				request.setAttribute("msg", "정답입니다.");
				isCorr = true;
			} else {
				request.setAttribute("msg", "오답입니다.");
			}
		}

		// 3. 화면 호출
		String page = "\\a00_exp\\A12_0809_gugu.jsp";
		if(isCorr) page="\\a00_exp\\A12_0809_result.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
