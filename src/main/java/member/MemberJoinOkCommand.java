package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberJoinOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid"); 
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd"); 
		String nickName = request.getParameter("name") == null ? "" : request.getParameter("name"); 
		String name = request.getParameter("name") == null ? "" : request.getParameter("name"); 
		String gender = request.getParameter("gender") == null ? "" : request.getParameter("gender"); 
		String birthday = request.getParameter("birthday") == null ? "" : request.getParameter("birthday"); 
		String tel = request.getParameter("tel") == null ? "" : request.getParameter("tel"); 
		String address = request.getParameter("address") == null ? "" : request.getParameter("address"); 
		String email = request.getParameter("email") == null ? "" : request.getParameter("email"); 
		String homePage = request.getParameter("homePage") == null ? "" : request.getParameter("homePage"); 
		String job = request.getParameter("job") == null ? "" : request.getParameter("job"); 
		String hobby = request.getParameter("hobby") == null ? "" : request.getParameter("hobby"); 
		String photo = request.getParameter("photo") == null ? "" : request.getParameter("photo"); 
		String content = request.getParameter("content") == null ? "" : request.getParameter("content"); 
		String userInfor = request.getParameter("userInfor") == null ? "" : request.getParameter("userInfor"); 
		String userDel = request.getParameter("userDel") == null ? "" : request.getParameter("userDel"); 
		int point = request.getParameter("point") == null ? 0 : Integer.parseInt(request.getParameter("point"));
		int level = request.getParameter("level") == null ? 0 : Integer.parseInt(request.getParameter("level"));
		int visitCnt = request.getParameter("visitCnt") == null ? 0 : Integer.parseInt(request.getParameter("visitCnt"));
		String startDate = request.getParameter("startDate") == null ? "" : request.getParameter("startDate"); 
		String lastDate = request.getParameter("lastDate") == null ? "" : request.getParameter("lastDate"); 
		int todayCnt = request.getParameter("todayCnt") == null ? 0 : Integer.parseInt(request.getParameter("todayCnt"));
		
		
		
		
		String address = request.getParameter("address") == null ? "" : request.getParameter("address"); 
		
		
		MemberDAO dao = new MemberDAO();
		
	}

}
