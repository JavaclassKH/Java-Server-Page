package j0430;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
@SuppressWarnings("serial")
@WebServlet("/j0430/T01Ok1")
public class T01Ok1 extends HttpServlet {
	
		@Override
		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
				
			String content = request.getParameter("content") == null ? "" : request.getParameter("content");
			String introduce = request.getParameter("introduce") == null ? "" : request.getParameter("introduce");
			
			System.out.println("이곳은 /j0430/T01Ok1 입니다");
			System.out.println("content : " + content);
			System.out.println("introduce : " + introduce);
			
			PrintWriter out = response.getWriter();
			out.println("이곳은 /j0430/T01Ok1 컨트롤러 입니다");
			request.setAttribute("msg", "T01Ok1에서 보냅니다");		
			
			String viewPage = "/study/0430_web_xml/filter/t1_filterRes.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		
		
		}
}
