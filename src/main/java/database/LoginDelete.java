package database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
@SuppressWarnings("serial")
@WebServlet("/database/LoginDelete")
public class LoginDelete extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid"); 
		
		// 현재 로그인 한 정보와 삭제하려는 mid가 같은지 비교해서 같으면 자신의 계정을 탈퇴처리 후 로그아웃 처리, 다르면 다시 회원리스트창으로 보낸다
		HttpSession session = request.getSession();
		String sMid = (String)session.getAttribute("sMid");
		
		LoginDAO dao = new LoginDAO();
		dao.setLoginDelete(mid);

		PrintWriter out = response.getWriter();
		if(!mid.equals(sMid)) {
			out.print("<script>");
			out.print("alert('회원정보 삭제가 완료되었습니다');");
			out.print("location.href='"+request.getContextPath()+"/study/database/LoginList';");
			out.print("</script>");			
		}
		else {
			out.print("<script>");
			out.print("alert('회원탈퇴가 완료되었습니다');");
			out.print("location.href='"+request.getContextPath()+"/database/Logout';");
			out.print("</script>");			
			
		}
		
	
	
	}
}
