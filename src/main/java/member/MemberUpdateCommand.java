package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberUpdateCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		
		MemberVO vo = dao.getMemberIdCheck(mid);
		
		// 전화번호 분리하기 (-)
		String[] tels = vo.getTel().split("-");
		
		if(tels[1].equals("  ")) tels[1] = "";
		if(tels[2].equals("  ")) tels[2] = "";
		
		request.setAttribute("tel1",tels[0]);
		request.setAttribute("tel2",tels[1]);
		request.setAttribute("tel3",tels[2]);
		
		// 주소 분리하기
		String[] address = vo.getAddress().split("/");
		request.setAttribute("postcode",address[0]);
		request.setAttribute("roadAddress",address[1]);
		request.setAttribute("detailAddress",address[2]);
		request.setAttribute("extraAddress",address[3]);
		
		// 취미는 통째로 넘겨서 포함여부만 확인한다 
		request.setAttribute("hobby",vo.getHobby());
		
		
		
		
		request.setAttribute("vo", vo);
	}

}
