package study.j0425;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/T01Ok")
public class T01Ok extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		// front에서 넘어온 값을 변수에 담아서 처리한다(필수)
		String name = request.getParameter("name");
//		int age =  Integer.parseInt(request.getParameter("age"));
		String age_ = request.getParameter("age"); // 변수_ 는 임시변수로 사용된다
		int age = 0;
		
		if(name.trim().equals("") || name == null) {
			System.out.println("이름을 반드시 작성해주세요. ");  
		}
		else if(age_.equals("") || age_ == null) {			
			System.out.println("나이를 반드시 작성해주세요. ");  
		}
		else {
			age = Integer.parseInt(age_);
		}
		
		System.out.println("성명 : " + name);
		System.out.println("나이 : " + age);
		
		
	}
	
}




















