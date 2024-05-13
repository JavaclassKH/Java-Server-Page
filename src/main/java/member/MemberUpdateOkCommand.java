package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

public class MemberUpdateOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickName = request.getParameter("name") == null ? "" : request.getParameter("name"); 
		String name = request.getParameter("name") == null ? "" : request.getParameter("name"); 
		String gender = request.getParameter("gender") == null ? "" : request.getParameter("gender"); 
		String birthday = request.getParameter("birthday") == null ? "" : request.getParameter("birthday"); 
		String tel = request.getParameter("tel") == null ? "" : request.getParameter("tel"); 
		String address = request.getParameter("address") == null ? "" : request.getParameter("address"); 
		String email = request.getParameter("email") == null ? "" : request.getParameter("email"); 
		String hobby = request.getParameter("hobby") == null ? "" : request.getParameter("hobby"); 
		String homePage = request.getParameter("homePage") == null ? "" : request.getParameter("homePage"); 
		String job = request.getParameter("job") == null ? "" : request.getParameter("job"); 
		String photo = request.getParameter("photo") == null ? "noimage.jpg" : request.getParameter("photo"); 
		String content = request.getParameter("content") == null ? "" : request.getParameter("content"); 
		String userInfor = request.getParameter("userInfor") == null ? "" : request.getParameter("userInfor");
		
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		vo.setNickName(nickName);
		vo.setName(name);
		vo.setGender(gender);
		vo.setBirthday(birthday);
		vo.setTel(tel);
		vo.setAddress(address);
		vo.setEmail(email);
		vo.setHomePage(homePage);
		vo.setJob(job);
		vo.setHobby(hobby);
		vo.setPhoto(photo);
		vo.setContent(content);
		vo.setUserInfor(userInfor);				
		vo.setMid(mid);			
		
		int res = dao.setMemberUpdate(vo);
		
		if(res != 0) {
			session.setAttribute("sNickname", vo.getNickName());
			request.setAttribute("message", "정보수정이 완료되었습니다");
			request.setAttribute("url", "MemberUpdate.mem");
			
		}	
		else {
			request.setAttribute("message", "정보수정에 실패하였습니다");
			request.setAttribute("url", "MemberUpdate.mem");			
		}
		
		
	}
}
