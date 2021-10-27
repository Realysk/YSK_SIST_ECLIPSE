package wannafit.content.partner.trainer;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import wannafit.content.vo.Trainer;

/**
 * Servlet implementation class Trainer_CRUD
 */
@WebServlet(name = "trCRUD.do", urlPatterns = { "/trCRUD.do" })
public class TrainerCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TrainerService service;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrainerCtrl() {
        super();
        service = new TrainerService();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String uploadPath = request.getSession().
				getServletContext().getRealPath("upload");
		int size = 10*1024*1024;

		MultipartRequest multi = new MultipartRequest
				(request, uploadPath, size, "UTF-8", 
						new DefaultFileRenamePolicy());

		String proc = multi.getParameter("proc");
		String id = multi.getParameter("wm_id")==null?"":
					multi.getParameter("wm_id");
		String page = "";
		
		// 로그인한 유저의 세션값
		HttpSession session = request.getSession();
		String usrSession = (String) session.getAttribute("login_User");
		
		if(proc != null) {
			
			// 트레이너 신청
			if(proc.equals("가입완료")) {
				
				System.out.println("가입완료로 들어옴");
				
				String nick = multi.getParameter("wm_nick");
				String pass = multi.getParameter("wm_pass");
				String emailId = multi.getParameter("wm_email_id");	
				String emailAdd = multi.getParameter("wm_email_addr");
				String email = emailId+"@"+emailAdd;
				String tel = multi.getParameter("wm_tel");
				String gender = multi.getParameter("wm_gender");
				String ageS = multi.getParameter("wm_age")==null?"0":multi.getParameter("wm_age");
				String sportsNumS = multi.getParameter("wm_sports")==null?"0":multi.getParameter("wm_sports");
				String info = multi.getParameter("wt_info");
				String imgSrc = multi.getFilesystemName("wm_imgSrc"); // 업로드된 파일이름 (중복시 변경됨)

				int age = Integer.parseInt(ageS);
				int sportsNum = Integer.parseInt(sportsNumS)==0?0:Integer.parseInt(sportsNumS);

				Trainer triner = new Trainer(id, pass, email, nick, tel, imgSrc, gender, age, sportsNum, info);
				String result = service.insertTr(triner);
				
				if(result.equals("등록성공")) {
					response.sendRedirect("content\\mypage\\trainer\\TR002-RegSuc.jsp");
				} else {
					request.setAttribute("resultAlert", "회원가입에 실패했습니다");
					response.sendRedirect("content\\Main.jsp");
				}	
			}
		} 
	}

}
