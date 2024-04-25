package study.j0425;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0425/T11Ok")
public class T11Ok extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		
		if(!mid.equals("admin") || !pwd.equals("1234")) {
			response.sendRedirect(request.getContextPath() + "/study/j0425/t11_login.jsp?msgFlag=no");  
			return;
		}
		
		System.out.println("로그인 완료");
	  // response.sendRedirect(request.getContextPath()+"/study/j0425/t11_main.jsp?msgFlag=no&mid="+mid);
		/* 직렬화 처리! */
		
		String viewPage = "/study/j0425/t11_main.jsp?msgFlag=no&mid="+mid;
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
	
}




























