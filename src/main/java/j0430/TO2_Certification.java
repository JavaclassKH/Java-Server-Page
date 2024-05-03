package j0430;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
@SuppressWarnings("serial")
@WebServlet("/j0430/TO2_Certification")
public class TO2_Certification extends HttpServlet {

	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String aCertification = request.getParameter("u") == null ? "" : request.getParameter("u");
		ServletContext application = request.getServletContext();
		
		// 기존의 저장된 certification 값을 출력해본다
		System.out.println("기존 aCertification : " + application.getAttribute("aCertification"));
		
		// 새로 발급된 인증번호를 aCertification에 저장
		application.setAttribute("aCertification" , aCertification);
		
		
		// 새로 발급된 인증번호를 출력해본다 
		System.out.println("새로운 aCertification : " + application.getAttribute("aCertification"));

		request.setAttribute("message", "인증코드가 발급되었습니다");
		
		String viewPage = "study/0430_web_xml/filter/t2_certification.jsp";
		RequestDispatcher dispatcher =  request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
		
	}
	
}
