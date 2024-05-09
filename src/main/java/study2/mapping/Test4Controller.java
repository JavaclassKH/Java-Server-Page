package study2.mapping;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
@SuppressWarnings("serial")
@WebServlet("*.do4")
public class Test4Controller extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Test4Interface command = null;
		
		String viewPage = "/WEB-INF/study2/mapping/";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/") + 1, uri.lastIndexOf("."));
		
		if(com.equals("Test4")) {
			viewPage += "test4.jsp";			
		}
		else if(com.equals("list")) {
			command = new Test4ListCommand();
			command.excute(request, response);
			
//			viewPage = "/WEB-INF/study2/mapping/list.jsp";
			viewPage += "list.jsp";
		}
		else if(com.equals("input")) {
			viewPage += "input.jsp";
		}
		else if(com.equals("inputOk")) {
			command = new Test4InputOkCommand();
			command.excute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("update")) {
			command = new Test4UpdateCommand();
			command.excute(request, response);
			viewPage += "update.jsp";
		}
		else if(com.equals("updateOk")) {
			command = new Test4UpdateOkCommand();
			command.excute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("delete")) {
			command = new Test4DeleteCommand();
			command.excute(request, response);
			viewPage += "delete.jsp";
		}
		else if(com.equals("search")) {
			command = new Test4SearchCommand();
			command.excute(request, response);
			viewPage += "search.jsp";
		}
		else {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('올바른 접근 경로가 아닙니다');");
			out.println("location.href='/mapping/Test4.do4';");
			out.println("</script>");
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
		
	}
	
	
}
