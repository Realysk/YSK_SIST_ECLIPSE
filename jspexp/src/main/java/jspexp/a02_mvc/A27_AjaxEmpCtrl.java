package jspexp.a02_mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jspexp.a02_mvc.a02_service.CommonService;
import jspexp.z02_vo.Emp;

/**
 * Servlet implementation class A27_AjaxEmpCtrl
 */
@WebServlet(name = "ajaxEmp.do", urlPatterns = { "/ajaxEmp.do" })
public class A27_AjaxEmpCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CommonService service;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A27_AjaxEmpCtrl() {
        super();
        // TODO Auto-generated constructor stub
        service = new CommonService();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 1. 요청값 처리.
		request.setCharacterEncoding("utf-8");
		String proc = request.getParameter("proc");
		String ename = request.getParameter("ename");
		String job = request.getParameter("job");
		
		// 2. service
		
		// 3. 초기화면 호출
		if(proc!=null) {
			System.out.println("ename:"+ename);
			System.out.println("job:"+job);
			if(proc.equals("insert")) {
				String mgrS = request.getParameter("mgr");
				String hiredateS = request.getParameter("hiredateS");
				String salS = request.getParameter("sal");
				String commS = request.getParameter("comm");
				String deptnoS = request.getParameter("deptno");
				Emp ins = new Emp(0, ename, job, Integer.parseInt(mgrS), hiredateS, Double.parseDouble(salS), Double.parseDouble(commS), Integer.parseInt(deptnoS));
				service.insert(ins);
				
				// 등록 후, 전체 조회 처리
				ename=""; job="";
			}
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().print(service.getEmpList(new Emp(ename,job)));
		}else {
			response.sendRedirect("a14_mvc\\a08_mvc_empAjax.jsp");
		}
	}
	

}
