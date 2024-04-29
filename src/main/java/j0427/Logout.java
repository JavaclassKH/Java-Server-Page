package j0427;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
@SuppressWarnings("serial")
@WebServlet("/j0427/Logout")
public class Logout extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		String mid = session.getAttribute("sMid").toString();
		session.invalidate();
		
		PrintWriter out = response.getWriter();
		out.println();
		// 회원 인증 실패시 처리... 다시 로그인창으로 보내준다.
		out.print("<script>");
		out.print("alert('["+mid+"(VIP)]님 로그아웃 되었습니다~');");
		out.print("location.href='"+request.getContextPath()+"/study/0428_Login/login.jsp';");
		out.print("</script>");
	
	}
}
