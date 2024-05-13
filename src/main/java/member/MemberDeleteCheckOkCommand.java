package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberDeleteCheckOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDAO dao = new MemberDAO();
				
		String mid = (String)request.getAttribute("sMid");
		
		int res = dao.setMemberDeleteUpdate(mid);
		
		if(res != 0) {
			session.invalidate();
			request.setAttribute("message", "회원탈퇴 처리가 완료되었습니다.\\n한달 이내 같은 아이디로 회원가입이 불가능합니다");
			request.setAttribute("url", request.getContextPath()+"/Main");
		}
		else {
			request.setAttribute("message", "회원탈퇴 과정에 문제가 있어 탈퇴에 실패하였습니다. \\n 관리자에게 문의해주세요");
			request.setAttribute("url","MemberMain.mem");
		}
		
	}
}
