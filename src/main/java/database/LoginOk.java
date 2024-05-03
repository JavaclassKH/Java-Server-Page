package database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
@SuppressWarnings("serial")
@WebServlet("/database/LoginOk")
public class LoginOk extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid"); 
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd"); 
		String name = request.getParameter("name") == null ? "" : request.getParameter("name"); 
		
		LoginDAO dao = new LoginDAO();
		System.out.println("DAO다녀왔습니다!");
		LoginVO vo = dao.getLoginIdCheck(mid , pwd);
		
		PrintWriter out = response.getWriter();
		
		// 회원인증! - vo.Mid값이 null이 아님
		if(vo.getMid() != null) {
			// 회원일 때 처리할 부분
			String idSave = request.getParameter("idSave")==null ? "off" : "on";
			Cookie cookieMid = new Cookie("cMid", mid);
			Cookie cookieName = new Cookie("cName", name);
			cookieMid.setPath("/");
			if(idSave.equals("on")) {
				cookieMid.setMaxAge(60*60*24*7);	// 쿠키의 만료시간은 1주일로 한다.
				cookieName.setMaxAge(60*60*24*7);	// 쿠키의 만료시간은 1주일로 한다.
			}
			else {
				cookieMid.setMaxAge(0);
				cookieName.setMaxAge(0);
			}
			response.addCookie(cookieMid);
			response.addCookie(cookieName);
			
			// 필요한 정보를 세션에 저장한다.
			HttpSession session = request.getSession();
			session.setAttribute("sMid", mid);
			session.setAttribute("sName", vo.getName());

			// 관리자의 아이디가 'sona123'이라고 가정하고 관리자인 경우는 세션이(sAdmin이 됨)
			if(mid.equals("sona123")) session.setAttribute("sAdmin", "OK");
			
			
			
			
			
			
			out.println("<script>");
			out.println("alert('"+mid+"님, 로그인 완료되었습니다. 즐거운 시간 되세요!')");
			out.println("location.href='"+request.getContextPath()+"/study/database/LoginList'");
			out.println("location.href='"+request.getContextPath()+"/study/database/LoginLastFiveGuysList'");
			out.println("</script>");		
			}
			else {
				out.println("<script>");
				out.println("alert('로그인 실패, 아이디와 비밀번호를 확인해주세요')");
				out.println("location.href='"+request.getContextPath()+"/study/database/login.jsp'");
				out.println("</script>");					
		}	
	}
}