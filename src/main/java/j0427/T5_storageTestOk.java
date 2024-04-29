package j0427;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
@SuppressWarnings("serial")
@WebServlet("/j0427/T5_storageTestOk")
public class T5_storageTestOk extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String mid = request.getParameter("mid");
		System.out.println("T5_storageTestOk's mid => " + mid);
		
		// 세션 객체 생성
		HttpSession session = request.getSession();
		session.setAttribute("sMid", mid);
		
		// 어플리케이션 객체 생성
		ServletContext application = session.getServletContext();
		application.setAttribute("aMid", mid);
		
		response.sendRedirect(request.getContextPath()+"/study/0427_storage/t5_StorageTest.jsp");
		
		
		
	}
	
	
}
