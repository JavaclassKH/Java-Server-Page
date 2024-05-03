package j0430;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
@SuppressWarnings("serial")
@WebServlet("/j0430/T03_init")
public class T03_init extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이 고 슨 T03_init 서브릿 입눼돵~");
		PrintWriter out = response.getWriter();
		out.println("");
		
		String logoName = getServletContext().getInitParameter("logoName"); 
		String homeAddress = getServletContext().getInitParameter("homeAddress"); 
		
		HttpSession session = request.getSession();
		
		session.setAttribute("sLogoName", logoName);
		session.setAttribute("sHomeAddress", homeAddress);		
		
		String viewPage = "/study/0430_web_xml/init/t3_init.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	
	}
	
}
