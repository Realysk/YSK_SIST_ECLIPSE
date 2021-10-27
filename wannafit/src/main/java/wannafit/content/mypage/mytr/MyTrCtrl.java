package wannafit.content.mypage.mytr;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import wannafit.content.vo.Reserve_Schedule;

/**
 * Servlet implementation class MyTrCtrl
 */
@WebServlet(name = "mytr.do", urlPatterns = { "/mytr.do" })
public class MyTrCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MyTrService service;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyTrCtrl() {
        super();
        service = new MyTrService();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String proc = request.getParameter("proc")==null?"":request.getParameter("proc");
		String id = request.getParameter("wm_id")==null?"":request.getParameter("wm_id");
		String page = "";
		
		// 로그인한 유저의 세션값
		HttpSession session = request.getSession();
		String usrSession = (String) session.getAttribute("login_User");
		String usrGroup = (String) session.getAttribute("login_UsrGroup");
		
		System.out.println("[Trainer컨트롤러] proc : " + proc);
		System.out.println("[Trainer컨트롤러] 유저세션 : " + usrSession);
		
		if(proc != "") {

			if(proc.equals("예약내역")) {
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().print(service.getReserveList(id));
			}
			
			if(proc.equals("예약일정")) {
				response.setContentType("text/html;charset=utf-8");
				response.sendRedirect("content\\mypage\\trainer\\MP003-revAdd.jsp");
			}
			
			if(proc.equals("sch")) {
				System.out.println("예약일정 조회");
				//response.getWriter().print(service.getMemberJson(wm_id));
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().print(service.getScheduleList(id));
			}
			if(proc.equals("ins")){
				System.out.println("예약일정 등록");
				String wrs_title = request.getParameter("wrs_title");
				String wrs_day = request.getParameter("wrs_day");
				String wrs_time = request.getParameter("wrs_time");
				
				String wrs_dateS = wrs_day + " " + wrs_time;
				System.out.println(wrs_dateS);
				String wrs_priceS = request.getParameter("wrs_price");
				int wrs_price = Integer.parseInt(wrs_priceS);

				Reserve_Schedule ins = new Reserve_Schedule(wrs_title, wrs_dateS, wrs_price, id);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().print(service.insSchedule(ins));

			}
			if(proc.equals("upt")){
				String wrs_title = request.getParameter("wrs_title");
				String wrs_day = request.getParameter("wrs_day");
				String wrs_time = request.getParameter("wrs_time");
				
				String wrs_dateS = wrs_day + " " + wrs_time;
				String wrs_priceS = request.getParameter("wrs_price");
				int wrs_price = Integer.parseInt(wrs_priceS);
				
				String wrs_step = request.getParameter("wrs_step");
				String wrs_num = request.getParameter("wrs_num");

				Reserve_Schedule upt = new Reserve_Schedule(wrs_num, wrs_title, 
						wrs_dateS, wrs_price, wrs_step, id);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().print(service.uptSchedule(upt));
			}
			if(proc.equals("del")){	
				String wrs_num = request.getParameter("wrs_num");
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().print(service.delSchedule(wrs_num, id));
			}	
		
		} else {
			
			if(usrGroup.equals("트레이너")) {
				page = "content\\mypage\\trainer\\MP001-reserveList.jsp";
				System.out.println("실행");
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
			}
		}
	}
}
