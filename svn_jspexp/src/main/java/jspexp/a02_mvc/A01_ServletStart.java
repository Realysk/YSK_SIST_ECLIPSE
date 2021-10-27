package jspexp.a02_mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jakarta.servlet.annotation.WebServlet;

/**
 * Servlet implementation class A01_ServletStart
 */
@WebServlet(name = "start.do", urlPatterns = { "/start.do" })
public class A01_ServletStart extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A01_ServletStart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 화면 출력 처리.
		// jsp 호출 처리 내용..
		/*
		// 1. MVC
		// 1) 요청값에 대한 처리.
		//    HttpServletRequest request에 의해서 요청값을 처리할 수 있다.
		//    request.getParameter("요청값key");
		   2) model에 대한 처리..
		   	  request.setAttribute("모델명",모델값);
		   3) View단에 대한 호출 
		   	  RequestDispatcher rd = request.getRequestDispatcher("호출 jsp 선언");
		   	  rd.forward();
		*/
		
		// servlet은 jsp의 근간이 된다.
		// jsp ==> servlet.java ==> 컴파일 ==> java와 혼합된 html 코드를 만들어 ==> client에 전달.
		// contentType="text/html; charset=UTF-8" 화면 출력 방식 설정 즉, html 코드를 랜더링 처리..
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<h2 align='center'>Hello servlet</h2>");
		out.print("<h2 align='center'>안녕하세요(한글 처리)</h2>");
		String name="홍길동";
		int num01 = 25;
		int num02 = 25;
		out.print("<h2 align='center'>"+name+":"+(num01+num02)+"</h2>");
		// ex) servlet   A02_Servelt2.java  serv02.do로 만들어..
		//               물건명, 가격, 갯수는 자바 변수로   h3로 출력하세요  4조
	}

}
