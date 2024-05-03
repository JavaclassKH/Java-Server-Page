package j0430;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.PostConstruct;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@SuppressWarnings("serial")
@WebServlet("/j0430/LifeCycle1Ok")
public class LifeCycle1Ok extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 service 메소드입니다");
		
		response.sendRedirect(request.getContextPath()+"/study/0430_web_xml/lifeCycle/lifeCycle1.jsp");		
	}
	
	
	@PostConstruct()
	
	
	@Override
	public void init() throws ServletException {		
		System.out.println("이곳은 init 메소드입니다");		
	}
	
	
	@Override
	public void destroy() {
		System.out.println("이곳은 destroy 메소드입니다");		
	}
	
	
}

















