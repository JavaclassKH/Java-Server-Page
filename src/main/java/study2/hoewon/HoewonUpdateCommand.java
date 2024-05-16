package study2.hoewon;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.LoginDAO;
import database.LoginVO;
import study2.StudyInterface;

public class HoewonUpdateCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx")); 
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid"); 
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd"); 
		String name = request.getParameter("name") == null ? "" : request.getParameter("name"); 
		int age = request.getParameter("age") == null ? 0 : Integer.parseInt(request.getParameter("age")); 
		String gender = request.getParameter("gender") == null ? "" : request.getParameter("gender"); 
		String address = request.getParameter("address") == null ? "" : request.getParameter("address"); 
		
		LoginDAO dao = new LoginDAO();		
		LoginVO vo = new LoginVO();
		
		vo.setIdx(idx);
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setAge(age);
		vo.setGender(gender);
		vo.setAddress(address);
		
		int res = dao.setLoginUpdate(vo);
		System.out.println("res : " + res);
		
		response.getWriter().write(res + "");	
		
		
		

	}

}
