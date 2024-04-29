package j0427;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
@SuppressWarnings("serial")
@WebServlet("/j0427/T5_storageTestClear")
public class T5_storageTestClear extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String mid = request.getParameter("mid");
		System.out.println("T5_storageTestClear's mid => " + mid);
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		ServletContext application = session.getServletContext();
		application.removeAttribute("aMid");
		
		
		response.sendRedirect(request.getContextPath()+"/study/0427_storage/t5_StorageTest.jsp");
		
	}
	
	
}
