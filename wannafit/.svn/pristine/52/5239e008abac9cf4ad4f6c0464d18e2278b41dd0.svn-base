package wannafit.content.mapfit;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wannafit.content.vo.map_VO;

/**
 * Servlet implementation class mapCtrl
 */
@WebServlet(name = "map.do", urlPatterns = { "/map.do" })
public class mapCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MapService service;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mapCtrl() {
        super();
        service = new MapService();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String page = "content\\mapfit\\wfmap01.jsp";
		ArrayList<map_VO> mlist = new ArrayList<map_VO>();
		mlist = service.getGymList();
		
		request.setAttribute("mlist", mlist);
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

}
