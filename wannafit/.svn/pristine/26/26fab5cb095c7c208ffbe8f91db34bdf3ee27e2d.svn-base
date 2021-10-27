package wannafit.content.groupfit;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import wannafit.content.vo.Groupfit;
import wannafit.content.vo.User;

/**
 * Servlet implementation class grpSch_Ctrl
 */
@WebServlet(name = "schgrp.do", urlPatterns = { "/schgrp.do" })
public class grpSch_Ctrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private grpServ service;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public grpSch_Ctrl() {
        super();
        // TODO Auto-generated constructor stub
        service = new grpServ();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		
		// 1. 요청값 처리
		
		// 로그인한 유저의 세션값
		HttpSession session = request.getSession();
		String group = (String) session.getAttribute("login_UsrGroup");		
		String usrSession = (String) session.getAttribute("login_User");
		boolean usrCk = usrSession==null?false:true;
		boolean isLogin = usrSession=="" || usrSession==null?false:true;
		
		String proc = (request.getParameter("proc")==null)?"":request.getParameter("proc");
		String proc2 = request.getParameter("proc2");
		String gf_name = request.getParameter("gf_name");
		String wm_id = request.getParameter("wm_id");
		
		User user = null;
		String page = "";

		System.out.println("-----------");
		System.out.println("[로그인] 회원세션 : " + usrSession);
		System.out.println("[로그인] 회원그룹세션 : " + group);
		System.out.println("[로그인] 로그인여부 : " + isLogin);
		
		if(usrSession != null) {
			System.out.println("회원확인!" +usrSession );
			isLogin = true;
		}		
				
		// 2. Service
		
		// 3. 초기화면 호출
		
		// 초기화면
		if(isLogin) {
			page = "content\\Main-logout.jsp";
		} else {
			page = "content\\Main.jsp";
		}	
		
		if(proc2!=null) {
			System.out.println("gf_name : " + gf_name);
			System.out.println("wm_id : " + wm_id);
			
			if(proc2.equals("search")) {
				String gf_category = request.getParameter("gf_category");
				String gf_dateS = request.getParameter("gf_dateS");
				Groupfit sch = new Groupfit(gf_name, gf_category, wm_id, gf_dateS);
				
				// 검색 후 전체 조회 처리
				gf_name = ""; wm_id = "";
			}
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(service.JsonarrygrpList(new Groupfit(gf_name, wm_id)));
		} else {
			response.sendRedirect("content\\groupfit\\GF009-join.jsp");
		}
		
	}

}
