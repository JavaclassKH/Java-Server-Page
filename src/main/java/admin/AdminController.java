package admin;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.board.BoardContentCommand;
import admin.board.BoardListCommand;
import admin.complain.BoardComplainInputCommand;
import admin.complain.ComplainCheckCommand;
import admin.complain.ComplainListCommand;
import admin.member.MemberLevelChangeCommand;
import admin.member.MemberListCommand;
import admin.review.ReviewDeleteCommand;
import admin.review.ReviewInputOkCommand;
import admin.review.ReviewReplyInputOkCommand;
@SuppressWarnings("serial")
@WebServlet("*.ad")
public class AdminController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminInterface command = null;
		String viewPage = "/WEB-INF/admin";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		// 인증처리 메소드
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel") == null ? 444 : (int)session.getAttribute("sLevel"); 
			
		// 컨트롤러 작업지시
		if(com.equals("/BoardComplainInput")) {
			command = new BoardComplainInputCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/ReviewInputOk")) {
			command = new ReviewInputOkCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/ReviewDelete")) {
			command = new ReviewDeleteCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/ReviewReplyInputOk")) {
			command = new ReviewReplyInputOkCommand();
			command.execute(request, response);
			return;
		}
		else if(level != 0) {
			request.setAttribute("message", "관리자 전용 페이지입니다.");
			request.setAttribute("url", request.getContextPath()+"/MemberLogin.mem");
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/AdminMain")) {
			viewPage += "/adminMain.jsp";
		}
		else if(com.equals("/AdminLeft")) {
			viewPage += "/adminLeft.jsp";
		}
		else if(com.equals("/AdminContent")) {
			command = new AdminContentCommand();
			command.execute(request, response);
			viewPage += "/adminContent.jsp";
		}
		else if(com.equals("/MemberList")) {
			command = new MemberListCommand();
			command.execute(request, response);
			viewPage += "/member/memberList.jsp";
		}
		else if(com.equals("/MemberLevelChange")) {
			command = new MemberLevelChangeCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/BoardList")) {
			command = new BoardListCommand();
			command.execute(request, response);
			viewPage += "/board/boardList.jsp";
		}
		else if(com.equals("/BoardContent")) {
			command = new BoardContentCommand();
			command.execute(request, response);
			viewPage += "/board/boardContent.jsp";
		}
		else if(com.equals("/ComplainList")) {
			command = new ComplainListCommand();
			command.execute(request, response);
			viewPage += "/complain/complainList.jsp";
		}
		else if(com.equals("/ComplainCheck")) {
			command = new ComplainCheckCommand();
			command.execute(request, response);
			return;
		}





	
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}