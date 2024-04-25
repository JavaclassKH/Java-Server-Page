package study.j0424;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/P1info")
public class P1 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		String lastname = request.getParameter("lastName");
		String firstname = request.getParameter("firstname");
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		
		PrintWriter out = response.getWriter();
		out.println("<p><font color='red'><b>이름 : "+lastname+""+firstname+"</b></font></p><br/>");
		out.println("<p><font color='green'><b>나이 : "+age+"</b></font></p><br/>");
		out.println("<p><font color='blue'><b>성별 : "+gender+"</b></font></p><br/><hr/>");
		out.println("<p><input type='button' value='돌아가기' onclick='location.href=\"/javaclass/study/j0424/P1Ok.jsp\"\"' > </p>");
		
	}
	
}
