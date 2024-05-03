package database;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
@SuppressWarnings("serial")
@WebServlet("/study/database/LoginView")
public class LoginView extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
	
		LoginDAO dao = new LoginDAO();
		
		LoginVO vo = dao.getLoginIdxsearch(idx);
		
		System.out.println("vo : " + vo);
		request.setAttribute("vo", vo);
		
		
		String viewPage = "/study/database/view.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	
	}

}
