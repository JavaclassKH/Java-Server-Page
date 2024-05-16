package study2.hoewon;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.LoginDAO;
import database.LoginVO;
import study2.StudyInterface;

public class HoewonInputCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int res = 0;
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid"); 
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd"); 
		String name = request.getParameter("name") == null ? "" : request.getParameter("name"); 
		int age = request.getParameter("age") == null ? 0 : Integer.parseInt(request.getParameter("age")); 
		String gender = request.getParameter("gender") == null ? "" : request.getParameter("gender"); 
		String address = request.getParameter("address") == null ? "" : request.getParameter("address"); 
		
		LoginDAO dao = new LoginDAO();		
		LoginVO vo = new LoginVO();
		
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setAge(age);
		vo.setGender(gender);
		vo.setAddress(address);
		

		res = dao.setLoginInput(vo);

		if(res != 1) {
			response.getWriter().write("사용중인 아이디입니다");
		}
		else {
			if(res != 0) response.getWriter().write("1");
			else response.getWriter().write("회원가입에 실패하였습니다");	
		}
		
		
		
		
		
	}

}
