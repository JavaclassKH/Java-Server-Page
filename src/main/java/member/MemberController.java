package member;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
@SuppressWarnings("serial")
@WebServlet("*.mem")
public class MemberController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInterface command = null;
		String viewPage = "/WEB-INF/member";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		// 인증처리 메소드
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel") == null ? 444 : (int)session.getAttribute("sLevel"); 
			
		// 컨트롤러 작업지시
		if(com.equals("/MemberLogin")) {
			viewPage += "/memberLogin.jsp";
		}
		else if(com.equals("/MemberLoginOk")) {
			command = new MemberLoginOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberLogout")) {
			command = new MemberLogoutCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberJoin")) {
			viewPage += "/memberJoin.jsp";
		}
		else if(com.equals("/MemberJoinOk")) {
			command = new MemberJoinOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberIdCheck")) {
			command = new MemberIdCheckCommand();
			command.execute(request, response);
			return;
		}
		
		else if(level > 4) {
			request.setAttribute("message", "로그인 후 이용해주세요");
			request.setAttribute("url", request.getContextPath()+"/MemberLogin.mem");
			viewPage = "/include/message.jsp";
		}
		
		else if(com.equals("/MemberMain")) {
			command = new MemberMainCommand();
			command.execute(request, response);
			viewPage += "/memberMain.jsp";
		}
		else if(com.equals("/MemberList")) {
			command = new MemberListCommand();
			command.execute(request, response);
			viewPage += "/memberList.jsp";
		}
		else if(com.equals("/MemberSearch")) {
			command = new MemberSearchCommand();
			command.execute(request, response);
			viewPage += "/memberSearch.jsp";
		}
		else if(com.equals("/MemberPwdCheck")) {
			viewPage += "/memberPwdCheck.jsp";
		}
		else if(com.equals("/MemberPwdCheckAjax")) {
			command = new MemberPwdCheckAjaxCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/MemberPwdChangeCheck")) {
			command = new MemberPwdChangeCheckCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberPwdCheckOk")) {
			command = new MemberPwdCheckOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberUpdate")) {
			command = new MemberUpdateCommand();
			command.execute(request, response);
			viewPage += "/memberUpdate.jsp";
		}
		else if(com.equals("/MemberUpdateOk")) {
			command = new MemberUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberDeleteCheck")) {
			viewPage += "/memberDeleteCheck.jsp";
		}
		else if(com.equals("/MemberDeleteCheckOk")) {
			command = new MemberDeleteCheckOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberChatInput")) {
			command = new MemberChatInputCommand();
			command.execute(request, response);
			return;
		}
	
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}