package study.j0425;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
@SuppressWarnings("serial")
@WebServlet("/j0425/T13Ok")
public class T13Ok extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		String loginFlag = request.getParameter("loginFlag") == null ? "" : request.getParameter("loginFlag");
		
		PrintWriter out = response.getWriter();
		
		if(loginFlag.equals("javascript")) {
		out.println("<script>");	
		out.println("location.href='"+request.getContextPath()+"/study/j0425/t13res.jsp?mid="+mid+"&pwd="+pwd+"&loginFlag="+loginFlag+"';");	
		out.println("</script>");	
		}
		else if(loginFlag.equals("response")) {
			response.sendRedirect(request.getContextPath()+"/study/j0425/t13res.jsp?mid="+mid+"&pwd="+pwd+"&loginFlag="+loginFlag);
		}
		else {
//			String viewPage = "/study/j0425/t13res.jsp?mid="+mid+"&pwd="+pwd+"&loginFlag="+loginFlag;
			request.setAttribute("mid", mid);
			request.setAttribute("pwd", pwd);
			request.setAttribute("loginFlag", loginFlag);
			String viewPage = "/study/j0425/t13res.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		}
		
		
			
			
			
			
	}
	
}
