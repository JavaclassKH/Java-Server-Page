package webMessage;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.complain.BoardComplainInputCommand;
@SuppressWarnings("serial")
@WebServlet("*.wm")
public class WebMessageController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		WebMessageInterface command = null;
		String viewPage = "/WEB-INF/webMessage";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		// 인증처리 메소드
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel") == null ? 444 : (int)session.getAttribute("sLevel"); 
			
		// 컨트롤러 작업지시
		if(level > 4) {
			request.setAttribute("message", "로그인 후 이용 부탁드립니다.");
			request.setAttribute("url", request.getContextPath()+"/MemberLogin.mem");
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/WebMessage")) {
			command = new WebMessageCommand();
			command.execute(request, response);
			viewPage += "/webMessage.jsp";
		}	
		else if(com.equals("/WmInputOk")) {
			command = new WmInputOkCommand();
			command.execute(request, response);
			viewPage = "include/message.jsp";
		}	
		else if(com.equals("/WmDeleteCheck")) {
			command = new WmDeleteCheckCommand();
			command.execute(request, response);
			viewPage = "include/message.jsp";
		}	
		else if(com.equals("/WmDeleteOne")) {
			command = new WmDeleteOneCommand();
			command.execute(request, response);
			return;
		}	
		else if(com.equals("/WmDeleteAll")) {
			command = new WmDeleteAllCommand();
			command.execute(request, response);
			return;
		}	



	
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}