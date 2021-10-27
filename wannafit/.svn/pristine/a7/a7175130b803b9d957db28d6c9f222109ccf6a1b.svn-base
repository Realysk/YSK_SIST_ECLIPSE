package wannafit.content.reserve;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import wannafit.content.vo.Reserve;
import wannafit.content.vo.Trainer;

/**
 * Servlet implementation class ReserveCtrl
 */
@WebServlet(name = "reserve.do", urlPatterns = { "/reserve.do" })
public class ReserveCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReserveService service;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserveCtrl() {
        super();
        service = new ReserveService();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 로그인한 유저의 세션값
		HttpSession session = request.getSession();
		String usrSession = (String) session.getAttribute("login_User");
		boolean usrCk = usrSession==null?false:true;

		String proc = request.getParameter("proc");
		String id = request.getParameter("wm_id")==null?"":request.getParameter("wm_id");
		
		System.out.println("[컨트롤러시작] proc:"+proc);
		System.out.println("[컨트롤러] usrSession:"+usrSession);
		
		String page = "";

		if(proc != null) {
			
			if(proc.equals("트레이너리스트")) {
				String nick = request.getParameter("wm_nick")==null?"":request.getParameter("wm_nick");
				String sportName = request.getParameter("wsk_num")==null?"":request.getParameter("wsk_num");
				
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().print(service.getTrainerList(new Trainer(nick, sportName)));
			}
			
			
			if(proc.equals("예약일정")) {	
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().print(service.getSchedule(id));	
			}
				
			if(proc.equals("예약완료")) {
				String wr_num = request.getParameter("wr_num");
				String wr_content = request.getParameter("wr_content");
				String wr_kind = request.getParameter("wr_kind");
				String wr_priceS = request.getParameter("wr_price")==null?"0":request.getParameter("wr_price");
				String wr_bank = request.getParameter("wr_bank");
				String wr_code = request.getParameter("wr_code");
				String wr_expDate = request.getParameter("wr_expDate");
				String wr_birth = request.getParameter("wr_birth");
				String wr_monthS = request.getParameter("wr_month")==null?"0":request.getParameter("wr_month");
				String wrs_num = request.getParameter("wrs_num");

				int wr_price = Integer.parseInt(wr_priceS);
				int wr_month = Integer.parseInt(wr_monthS);
				
				Reserve inReserve = new Reserve(wr_num, wr_content, wr_kind, wr_price, wr_bank, 
						wr_code, wr_expDate, wr_birth, wr_month, wrs_num, usrSession);
				
				boolean isRevResult = service.insertReserve(inReserve);
				request.setAttribute("isRevResult", isRevResult);
				
				System.out.println("[컨트롤러] 예약완료");
				
				page = "content\\reserve\\RV003-Success.jsp";
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
			}

		} else {
			
			if(usrCk) { // 회원
				page = "content\\reserve\\RV001-List.jsp";
			} else {	// 비회원
				page = "content\\reserve\\RV0010-List.jsp";
			}
					
			if(id != "") {
				page = "content\\reserve\\RV002-Detail.jsp";
				request.setAttribute("trainer", service.getTrainerInfo(id));		
			}
					
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}

}
