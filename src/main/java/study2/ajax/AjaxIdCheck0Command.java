package study2.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyDAO;
import study2.StudyInterface;

public class AjaxIdCheck0Command implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		
		StudyDAO dao = new StudyDAO();
		
		String name = dao.getIdSearch(mid);
		System.out.println("name : " + name);
		
		System.out.println("AjaxIdCheck1Command 다녀감!");
		if(name.equals("")) {
			request.setAttribute("message", "검색된 ID가 없습니다");
			request.setAttribute("url", "ajaxTest1.st");			
		}
		else {
			request.setAttribute("name", name);
			request.setAttribute("message", "전송된 ID : "+mid+" / 성명 : "+ name);
			request.setAttribute("url", "ajaxTest1.st?name="+name+"&mid="+mid);
		}
		
		
	}

}
