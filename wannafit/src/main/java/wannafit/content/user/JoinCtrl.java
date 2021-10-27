package wannafit.content.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import wannafit.content.vo.User;

/**
 * Servlet implementation class JoinCtrl
 */
@WebServlet(name = "join.do", urlPatterns = { "/join.do" })
public class JoinCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private JoinService service;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinCtrl() {
        super();
        service = new JoinService();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String proc = (request.getParameter("proc")==null)?"":request.getParameter("proc");
		HttpSession session = request.getSession();
		
		System.out.println("[controller] proc " + proc);

		String page = "content\\user\\UT002-Sti.jsp";
		
			
		if(proc.equals("인증완료")) {
			page = "content\\user\\UT004-Reg.jsp";
			System.out.println("휴대폰 인증 완료");
		}
				
		if(proc.equals("가입완료")) {
					
			String id = request.getParameter("wm_id");
			String nick = request.getParameter("wm_nick");
			String pass = request.getParameter("wm_pass");
			String emailId = request.getParameter("wm_email_id");	
			String emailAdd = request.getParameter("wm_email_addr");
			String email = emailId+"@"+emailAdd;
			String tel = request.getParameter("wm_tel");
			String imgSrc = request.getParameter("wm_imgSrc")==null?"":request.getParameter("wm_imgSrc");
			String gender = request.getParameter("wm_gender");
			String ageS = request.getParameter("wm_age")==null?"0":request.getParameter("wm_age");
			String sportsNumS = request.getParameter("wm_sports")==null?"0":request.getParameter("wm_sports");
			String result = request.getParameter("wm_result");

			int age = Integer.parseInt(ageS);
			int sportsNum = Integer.parseInt(sportsNumS)==0?0:Integer.parseInt(sportsNumS);
					
					
			User user = new User(id, pass, email, nick, tel, 
					imgSrc, gender, age, sportsNum, result);
					
					
			String joinResult = service.join(user);
			if(joinResult.equals("등록성공")) {
				page = "content\\user\\UT005-RegSuc.jsp";
			} else {
				request.setAttribute("resultAlert", "회원가입에 실패했습니다");
				page = "content\\Main.jsp";
			}
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}
}


