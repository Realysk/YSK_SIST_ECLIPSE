package javaexp.com.Service;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.FileDAO;
import com.Model.FileVO;

@WebServlet("/SelectOne")
public class SelectOne extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int num = Integer.parseInt(request.getParameter("num"));

		FileDAO dao = FileDAO.getInstance();

		try {
			FileVO vo = dao.SelectOne(num);

			if (vo != null) {
				request.setAttribute("vo", vo);
			} else {
				System.out.println("조회실패..");
			}
			RequestDispatcher dis = request.getRequestDispatcher("View.jsp");
			dis.forward(request, response);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
