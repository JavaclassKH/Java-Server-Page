package database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
@SuppressWarnings("serial")
@WebServlet("/database/Logout")
public class Logout extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* request.setCharacterEncoding("UTF-8"); */
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		String mid = session.getAttribute("sMid").toString();
		session.invalidate();
		
		PrintWriter out = response.getWriter();
		
		out.print("<script>");
		out.print("alert('["+mid+"(SVIP)]님 로그아웃 되었습니다~');");
		out.print("location.href='"+request.getContextPath()+"/study/database/login.jsp';");
		out.print("</script>");
	}
}
