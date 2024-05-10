package member;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.SecurityUtil;

public class MemberLoginOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid"); 
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd"); 
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberIdCheck(mid);
		
		// 로그인 실패 [탈퇴한 회원도 로그인이 되지 않게 해야 함]
		if(vo.getPwd() == null || vo.getUserDel().equals("OK")) {
			request.setAttribute("message", "해당 아이디로 가입된 회원정보가 없습니다");
			request.setAttribute("url", request.getContextPath()+"/MemberLogin.mem");
			return;
		}		

		// 저장된 비밀번호에서 saltkey를 분리시켜서 다시 암호화 한 비밀번호와 맞는지 확인한다
		String salt = vo.getPwd().substring(0,8);
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(salt + pwd);
		
		if(!vo.getPwd().substring(8).equals(pwd)) {
			request.setAttribute("message", "해당 아이디로 가입된 회원정보가 없습니다");
			request.setAttribute("url", request.getContextPath()+"/MemberLogin.mem");						
		}
		
		// 회원인증처리
		if(vo.getMid() != null) {			
			// 3. 등급레벨별 등급 명칭을 저장한다
			String strLevel ="";
			if(vo.getLevel() == 0) strLevel = "관리자";
			else if(vo.getLevel() == 1) strLevel = "준회원";
			else if(vo.getLevel() == 2) strLevel = "정회원";
			else if(vo.getLevel() == 3) strLevel = "우수회원";
			
			// 로그인 정보를 통해 회원등급을 부여한다
			String idSave = request.getParameter("idSave")==null ? "off" : "on";
			Cookie cookieMid = new Cookie("cMid", mid);
			cookieMid.setPath("/");
			if(idSave.equals("on")) {
				cookieMid.setMaxAge(60*60*24*7);	// 쿠키의 만료시간은 1주일로 한다.
			}
			else {
				cookieMid.setMaxAge(0);
			}
			response.addCookie(cookieMid);
			
			// 필요한 정보를 세션에 저장한다.
			session = request.getSession();
			session.setAttribute("sMid", mid);
			session.setAttribute("sNickName", vo.getNickName());
			session.setAttribute("sLevel", vo.getLevel());
			session.setAttribute("strLevel", strLevel);
			
			request.setAttribute("message",  mid+" 님 로그인 완료되었습니다");
			request.setAttribute("url", request.getContextPath()+"/MemberMain.mem");
			
   		// 1.방문포인트 : 매번 10포인트 지급. 단, 하루 최대 5회(50포인트)까지만 가능		
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String strToday = sdf.format(today);

			if(!strToday.equals(vo.getLastDate().substring(0, 10))) {
				// 오늘 처음 방문한 경우[오늘 방문카운트를 1로 세팅, 기존 포인트에 +10]
				vo.setTodayCnt(1);
				vo.setPoint(vo.getPoint() + 10);
			}
			else {
				// 오늘의 첫 방문이 아니라 다시 방문한 것(오늘 방문카운트를에 +1)
				// 오늘 방문 횟수가 5회 전이라면 기존 포인트에 +10, 5회 초과면 처리 X
				vo.setTodayCnt(vo.getTodayCnt() + 1);
				if(vo.getTodayCnt() <= 5) vo.setPoint(vo.getPoint() + 10);
			}
			
			// ★ 자동 정회원 등업시키기 ★
			// 조건 : 방명록에 5회 이상 글을 올렸을 때 '정회원'으로 자동 등업된다.
			
			
			// ★ 처리 완료된 자료(vo)를 DB에 업데이트한다 ★
			dao.setLoginUpdate(vo);
			
	
			
			
			
			
			
			
		}
		
		
		
	}
}
