package study.j0424;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/T11")
public class Test11 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		int su1 =  Integer.parseInt(request.getParameter("su1"));
		int su2 =  Integer.parseInt(request.getParameter("su2"));
		
		int tot = 0 , temp = 0;
		if(su1 > su2) {
			temp = su1;
			su1 = su2;
			su2 = temp;
		}
		
		for(int i=su1; i<=su2; i++) {
			tot += i;
		}
		
		System.out.println("tot : " + tot);
		
		PrintWriter out = response.getWriter();
		out.println("Here is Send form Servlet");
		out.println("<p><input type='button' value='돌아가기' onclick='location.href=\"/javaclass/study/j0424/test11Ok.jsp?su1="+su1+"&su2="+su2+"&tot="+tot+"\"' > </p>");
	}
	
}























