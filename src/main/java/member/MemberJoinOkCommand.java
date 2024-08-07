package member;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.SecurityUtil;

public class MemberJoinOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/member");
		int maxSize = 1024 * 1024 * 10;
		String encording = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize ,encording, new DefaultFileRenamePolicy());
		
		String mid = multipartRequest.getParameter("mid") == null ? "" : multipartRequest.getParameter("mid"); 
		String pwd = multipartRequest.getParameter("pwd") == null ? "" : multipartRequest.getParameter("pwd"); 
		String nickName = multipartRequest.getParameter("name") == null ? "" : multipartRequest.getParameter("name"); 
		String name = multipartRequest.getParameter("name") == null ? "" : multipartRequest.getParameter("name"); 
		String gender = multipartRequest.getParameter("gender") == null ? "" : multipartRequest.getParameter("gender"); 
		String birthday = multipartRequest.getParameter("birthday") == null ? "" : multipartRequest.getParameter("birthday"); 
		String contact = multipartRequest.getParameter("contact") == null ? "" : multipartRequest.getParameter("contact"); 
		String email = multipartRequest.getParameter("email") == null ? "" : multipartRequest.getParameter("email"); 

		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = null;
		
		// DB에 저장하기 전 not null 데이터는 BackEnd에서 체크한다
		
		
		// 아이디, 닉네임 중복 체크 한번 더 하기(보안)
		
		
		// 비밀번호 암호화(SHA-256 / 8-4-4-4-12) + salt key(UUID코드중 앞 자리 8자리와 같이)를 만들어 암호화 처리
		SecurityUtil security = new SecurityUtil();
		String saltkey = UUID.randomUUID().toString().substring(0, 8);
		pwd = security.encryptSHA256(saltkey + pwd);
		pwd = saltkey + pwd;
		
		vo = dao.getMemberIdCheck(mid);
		if(vo.getMid() != null) {
			request.setAttribute("message", "사용중인 아이디입니다");
			request.setAttribute("url", "MemberJoin.mem");
			return;
		}
		
		

		// saltkey 사용시엔 'saltkey+pwd' 하여 저장시켜준다
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setNickName(nickName);
		vo.setName(name);
		vo.setGender(gender);
		vo.setBirthday(birthday);
		vo.setEmail(email);
		
		int res = dao.setMemberJoinOk(vo);
		
		if(res != 0) {
			request.setAttribute("message", "회원가입이 완료되었습니다! 환영합니다! \\n 다시 로그인해주세요.");
			request.setAttribute("url", "MemberLogin.mem");
		}
		else {
			request.setAttribute("message", "회원가입에 실패하였습니다.");
			request.setAttribute("url", "MemberJoin.mem");
		}
			
		
	}

}


/*
 * int point = request.getParameter("point") == null ? 0 :
 * Integer.parseInt(request.getParameter("point")); int level =
 * request.getParameter("level") == null ? 0 :
 * Integer.parseInt(request.getParameter("level")); int visitCnt =
 * request.getParameter("visitCnt") == null ? 0 :
 * Integer.parseInt(request.getParameter("visitCnt")); String startDate =
 * request.getParameter("startDate") == null ? "" :
 * request.getParameter("startDate"); String lastDate =
 * request.getParameter("lastDate") == null ? "" :
 * request.getParameter("lastDate"); int todayCnt =
 * request.getParameter("todayCnt") == null ? 0 :
 * Integer.parseInt(request.getParameter("todayCnt"));
 */