package study.j0425;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/T03Ok")
public class T03Ok extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// front에서 넘어온 값을 변수에 담아서 처리한다. 실무에서 이렇게 쓰임! 삼항연산자!
		// 중간에 오류가 나도 예외오류가 출력되지 않고 프로그램은 계속 진행되도록 해야 한다
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		int age = (request.getParameter("age") == null || request.getParameter("age") == "" ) ? 0 : Integer.parseInt(request.getParameter("age"));		
		
		System.out.println("성명 : " + name);
		System.out.println("나이 : " + age);
		
		PrintWriter out = response.getWriter();
		
		
	}
	
}




















