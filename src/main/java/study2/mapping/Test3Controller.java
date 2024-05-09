package study2.mapping;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
@SuppressWarnings("serial")
@WebServlet("*.do3")
public class Test3Controller extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
//		System.out.println("여긴 *.do3 서블릿임");
//		StringBuffer url = request.getRequestURL();
//		System.out.println("url : " + url);
		
		
		String uri = request.getRequestURI();
		
		
		String com = "";
		com = uri.substring(uri.lastIndexOf("/") + 1, uri.lastIndexOf("."));
		System.out.println();
		System.out.println("uri : " + uri);
//		System.out.println("com : " + com);
		System.out.println();
		
		
		int su1 = request.getParameter("su1")==null ? 0 : Integer.parseInt(request.getParameter("su1"));
		int su2 = request.getParameter("su2")==null ? 0 : Integer.parseInt(request.getParameter("su2"));
		

		if(com.equals("list")) {
			System.out.println("Here is List");
		}
		else if(com.equals("input")) {
			System.out.println("Here is input");
		}
		else if(com.equals("update")) {
			System.out.println("Here is update");
		}
		else if(com.equals("delete")) {
			System.out.println("Here is delete");
		}
		else if(com.equals("search")) {
			System.out.println("Here is search");
		}
		else if(com.equals("hap")) {
			System.out.println("Here is hap");
			
			Test1Service service =  new Test1Service();
			int hap = service.hap(su1, su2);
			request.setAttribute("hap", hap);
		}
		else if(com.equals("cha")) {
			Test1Service service =  new Test1Service();
			int cha = service.cha(su1, su2);
			request.setAttribute("cha", cha);
		}
		else if(com.equals("gop")) {
			Test1Service service =  new Test1Service();
			int gop = service.gop(su1, su2);
			request.setAttribute("gop", gop);
		}
		else if(com.equals("mok")) {
			Test1Service service =  new Test1Service();
			String mok = su2 == 0 ? "계산불가" : (su1 / su2) + "";
			request.setAttribute("mok", mok);
		}
		
		request.setAttribute("su1", su1);
		request.setAttribute("su2", su2);
		
		String viewPage = "/WEB-INF/study2/mapping/test3.jsp";		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	
	}
}
