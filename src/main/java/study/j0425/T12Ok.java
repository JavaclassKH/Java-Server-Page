package study.j0425;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0425/T12Ok")
public class T12Ok extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		int age = (request.getParameter("age") == null || request.getParameter("age") == "" ) ? 0 : Integer.parseInt(request.getParameter("age"));		
		String gender = request.getParameter("gender");
		String[] hobbys = request.getParameterValues("hobby"); 	 
		String job = request.getParameter("job");
		String[] bbangs = request.getParameterValues("bbang"); 	 
		String content = request.getParameter("content") == null ? "" : request.getParameter("content");
		content = content.replace("\n", "<br/>");
		String filename = request.getParameter("fname");
		
		
		String hobby = "";
		if(hobby != null) {
			for(String h : hobbys) {
				hobby += h + " , ";
			}
			hobby = hobby.substring(0, hobby.length() - 2);			
		}
		
		String bbang = "";
		if(bbang != null) {
			for(String b : bbangs) {
				bbang += b + " & ";
			}
			bbang = bbang.substring(0, bbang.length() - 2);			
		}
		
		System.out.println("성명 : " + name);
		System.out.println("나이 : " + age);
		System.out.println("성별 : " + gender);
		System.out.println("취미 : " + hobby);
		System.out.println("직업 : " + job);
		System.out.println("감빵 : " + bbang);
		System.out.println("소개 : " + content);
		System.out.println("파일 : " + filename);
		System.out.println("");
		
		T12VO vo = new T12VO();
		vo.setName(name);
		vo.setAge(age);
		vo.setGender(gender);
		vo.setHobby(hobby);
		vo.setJob(job);
		vo.setBbang(bbang);
		vo.setContent(content);
		vo.setFilename(filename);

		// 직렬화시킴(쭉 이동하는 dispatcher에 vo의 값을 실어서 중간에 만난 main에서 값을 받아가게 함)
		request.setAttribute("vo", vo);
		
		String viewPage = "/study/j0425/t12_main.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}