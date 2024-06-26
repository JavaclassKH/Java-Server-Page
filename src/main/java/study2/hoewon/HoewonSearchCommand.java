package study2.hoewon;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.LoginDAO;
import database.LoginVO;
import study2.StudyInterface;

public class HoewonSearchCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx")); 
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid"); 
		
		
		LoginDAO dao = new LoginDAO();
		LoginVO vo = dao.getLoginIdxsearch(idx);
		
		String str = idx + "/" + vo.getMid() + "/" + vo.getPwd()+ "/" + vo.getName()+ "/" + vo.getAge()+ "/" + vo.getGender() + "/" + vo.getAddress();                             
		
		response.getWriter().write(str);
		
	
	
	
	}

}
