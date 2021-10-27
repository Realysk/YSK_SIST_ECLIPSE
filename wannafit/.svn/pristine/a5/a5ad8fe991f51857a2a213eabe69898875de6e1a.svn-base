package wannafit.content.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class infoCtrl
 */
@WebServlet(name = "infoCk.do", urlPatterns = { "/infoCk.do" })
public class infoCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private JoinService service;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public infoCtrl() {
        super();
        service = new JoinService();
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String proc = (request.getParameter("proc")==null)?"":request.getParameter("proc");
		String id = request.getParameter("wm_id");
		String nick = request.getParameter("wm_nick");
		
		if(proc.equals("아이디중복확인")) {
			response.getWriter().print(service.isIdCk(id));
		}
		
		if(proc.equals("닉네임중복확인")) {
			response.getWriter().print(service.isNickCk(nick));
		}
	}

}
