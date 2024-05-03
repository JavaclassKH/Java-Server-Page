package j0430;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
@SuppressWarnings("serial")
@WebServlet("/j0430/T03_sessionOut")
public class T03_sessionOut extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("logoName");
		session.removeAttribute("sHomeAddress");
		
		response.sendRedirect(request.getContextPath()+"/study/0430_web_xml/init/t3_init.jsp");
	
	}
	
}
