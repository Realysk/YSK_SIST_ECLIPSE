package jspexp.a02_mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.a02_mvc.a02_service.CommonService;
import jspexp.z02_vo.Member;

/**
 * Servlet implementation class A25_AjaxController
 */
@WebServlet(name = "schMember.do", urlPatterns = { "/schMember.do" })
public class A27_AjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CommonService service;
	public A27_AjaxController() {
		super();
		service = new CommonService();
	}
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("utf-8");
		String proc = request.getParameter("proc");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String auth = request.getParameter("auth");
		String point = request.getParameter("point");
		System.out.println("프로세스:"+proc);
		System.out.println("id:"+id);

		if (proc == null) {
			// ajax에서는 초기화면에 요청값을 전달할 필요가 없어서 response.sendRedirect로 처리
			response.sendRedirect("a14_mvc\\a07_mvc_DB3.jsp");
			//request.getRequestDispatcher("a14_mvc\\a07_mvc_DB3.jsp").forward(request, response);
		} else {
			/*
			# 초기 화면 로딩..
			proc가 null 값일 때..
			# id값으로 검색..
			proc를 sch로
			# 등록시
			proc를 ins
			# 수정
			proc를 upt
			# 삭제
			proc를 del
			 */
			response.setContentType("text/html;charset=utf-8");
			
			if(proc!=null) {
				if(proc.equals("ins")) {
					Member ins = new Member(id,pass,name, auth, Integer.parseInt(point));
					System.out.println("등록처리:"+ins.getName());
					response.getWriter().print(service.insMemberJson(ins));
				}
				if(proc.equals("sch")) {
					response.getWriter().print(service.getJsonMember(id));
				}
				if(proc.equals("upt")){
					Member upt = new Member(id,pass,name, auth, Integer.parseInt(point));
					response.getWriter().print(service.uptMemberJson(upt));
				}
				if(proc.equals("del")){
					Member del = new Member(id,pass,name, auth, Integer.parseInt(point));
					response.getWriter().print(service.delMemberJson(del));
				}				
			}
			
			// ==> xhr.responseText로 출력을 할 수 있다..
		
		}	   
		
	}

}
