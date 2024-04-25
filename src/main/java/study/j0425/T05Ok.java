package study.j0425;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0425/T05Ok")
public class T05Ok extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		
		String loginOk = "";
		if(mid.equals("admin") && pwd.equals("1234")) loginOk = "OK";
		else loginOk = "NOPE";
		
		PrintWriter out = response.getWriter();
		
		if(loginOk.equals("OK")) {
			out.println("<script>");
			out.println("'use strict';");
			out.println("alert('Mr."+mid+"! Welcome to login')");
			out.println("location.href='"+request.getContextPath()+"/study/j0425/t05Main.jsp?mid="+mid+"';");
			out.println("</script>");		
		}
		else if(loginOk.equals("NOPE")) {
			out.println("<script>");
			out.println("'use strict';");
			out.println("alert('Mr."+mid+"! Fail to login')");
			out.println("location.href='"+request.getContextPath()+"/study/j0425/t05.jsp'");
			out.println("</script>");		
		}
	}
}




















