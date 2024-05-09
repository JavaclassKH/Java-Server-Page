package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@SuppressWarnings("serial")
@WebServlet("/mapping/Test1Res1")
public class Test1Res1Controller extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("이곳은 서블릿의 /mapping/test1Res 입니다");
	
		int su1 = request.getParameter("su1") == null ? 0 : Integer.parseInt(request.getParameter("su1")); 
		int su2 = request.getParameter("su2") == null ? 0 : Integer.parseInt(request.getParameter("su2")); 
		
		request.setAttribute("su1", su1);
		request.setAttribute("su2", su2);
		request.setAttribute("hap", (su1 + su2));
		request.setAttribute("cha", (su1 - su2));
		
		String viewPage = "/WEB-INF/study2/mapping/test1.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
	
}