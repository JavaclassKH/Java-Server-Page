package study.j0425;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0425/T06Ok")
public class T06Ok extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// front에서 넘어온 값을 변수에 담아서 처리한다. 실무에서 이렇게 쓰임! 삼항연산자!
		// 중간에 오류가 나도 예외오류가 출력되지 않고 프로그램은 계속 진행되도록 해야 한다
	  // !! 여러개의 값을 받을때 배열로 넘어오므로 배열로 받을 준비가 필요함 !! 
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		int age = (request.getParameter("age") == null || request.getParameter("age") == "" ) ? 0 : Integer.parseInt(request.getParameter("age"));		
		String gender = request.getParameter("gender");
		String[] hobbys = request.getParameterValues("hobby"); 	 
		String job = request.getParameter("job");
		String[] bbangs = request.getParameterValues("bbang"); 	 
		String content = request.getParameter("content") == null ? "" : request.getParameter("content");
		content = content.replace("\n", "<br/>");
		String filename = request.getParameter("fname");
		
		System.out.println("성명 : " + name);
		System.out.println("나이 : " + age);
		System.out.println("성별 : " + gender);
		
		String hobby = "";
		if(hobby != null) {
			for(String h : hobbys) {
				hobby += h + " , ";
			}
			hobby = hobby.substring(0, hobby.length() - 2);			
		}
		
		String bbang = "";
		if(bbang != null) {
			for(String b : bbangs) {
				bbang += b + " & ";
			}
			bbang = bbang.substring(0, bbang.length() - 2);			
		}
		
		
		System.out.println("취미 : " + hobby);
		System.out.println("직업 : " + job);
		System.out.println("가본 빵 : " + bbang);
		System.out.println("자기소개 : " + content);
		System.out.println("파일명 : " + filename);
		System.out.println("");
		
		PrintWriter out = response.getWriter();
		
		out.println("<p><b>성명 : <font color='red'>"+name+"</font></b></p>");
		out.println("<p><b>나이 : <font color='orange'>"+age+"</font></b></p>");
		out.println("<p>성별 : <font color='yellow'><b>"+gender+"</b></font></p>");
		out.println("<p>취미 : <font color='green'><i>"+hobby+"</i></font></p>");
		out.println("<p>직업 : <font color='blue'><i>"+job+"</i></font></p>");
		out.println("<p>가본 빵 : <font color='navy'>"+bbang+"</font></p>");
		out.println("<p>자기소개 : <font color='purple'>"+content+"</font></p>");
		out.println("<p>파일명 : <font color='pink'>"+filename+"</font></p>");
		out.println("<p><br/><p>");
		out.println("<p><a href='"+request.getContextPath()+"/study/j0425/t06_form.jsp'>return to base</a></p>");
		
	}
	
}




















