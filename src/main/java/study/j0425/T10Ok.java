package study.j0425;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0425/T10Ok")
public class T10Ok extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		
		// DB에서 mid와 같은 자료가 있는지 검색 후 돌아온다. 
		if(!mid.equals("admin") || !pwd.equals("1234")) {
			// JSP에서 다시 로그인하라는 메시지를 띄우도록 한다
			// js의 location.href와 같은 역할을 하는 유사한 명령어이다 
			response.sendRedirect(request.getContextPath() + "/study/j0425/t10_login.jsp?msgFlag=no");  
			return;
		}
		
		// 정상회원들 처리
		System.out.println("로그인 완료");
		response.sendRedirect(request.getContextPath()+"/study/j0425/t10_main.jsp?msgFlag=no&mid="+mid);
		
	}
	
}




























