package etc03;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/etc03/pBlogLogin")
public class PBlogLoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		PBlogMgr pMgr = new PBlogMgr();
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String url = "login.jsp";
		if(pMgr.loginPMember(id, pwd)) {
			request.getSession().setAttribute("idKey", id);
			url = "home.jsp";
		}else {
			request.getSession().setAttribute("msg", "���̵�� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		}
		response.sendRedirect(url);
	}
}