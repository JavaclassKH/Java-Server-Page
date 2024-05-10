package member;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.SecurityUtil;

public class MemberPwdChangeCheckCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pwdRe = request.getParameter("pwdCheck") == null ? "" : request.getParameter("pwdCheck");
		
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		
		MemberDAO dao = new MemberDAO();

		String salt = UUID.randomUUID().toString().substring(0,8);
		
		SecurityUtil security = new SecurityUtil();
		pwdRe = security.encryptSHA256(salt + pwdRe);
		
		int res = dao.setMemberPwdChange(mid, (salt + pwdRe));
		
		if(res != 0) {
			request.setAttribute("message", "비밀번호 변경이 완료되었습니다. \\n다시 로그인해주세요");
			request.setAttribute("url", "MemberLogin.mem");
		}
		else {
			request.setAttribute("message", "비밀번호 변경에 실패하였습니다");
			request.setAttribute("url", "MemberPwdCheck.mem");			
		}
	} 
}
