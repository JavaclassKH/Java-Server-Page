package j0430;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@SuppressWarnings("serial")
@WebServlet("/j0430/LifeCycle2Ok")
public class LifeCycle2Ok extends HttpServlet {
	
	@Override
	public void init() throws ServletException {		
		System.out.println("이곳은 init 메소드입니다");		
	}
	
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 service 메소드입니다");
		doPost(request, response);
	}
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 doGet 메소드입니다");
		response.sendRedirect(request.getContextPath()+"/study/0430_web_xml/lifeCycle/lifeCycle1.jsp");		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 doPost 메소드입니다");
		doGet(request, response);
	}
	
	@Override
	public void destroy() {
		System.out.println("이곳은 destroy 메소드입니다");		
	}
	
	@PostConstruct
	public void initPostConstructor() {
		System.out.println("이고슨 사용자 메소드임돠 : @PostConstruct, 이 어노테이션 사용시 가장 먼저 수행!");
	}
	
	@PreDestroy
	public void PreDestroy() {
		System.out.println("이고슨 사용자 메소드임돠 : @PreDestroy, 이 어노테이션 사용시 가장 마지막에 수행!");
	}
	
}

















