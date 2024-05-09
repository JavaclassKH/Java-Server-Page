package study.password;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
@SuppressWarnings("serial")
@WebServlet("/study/password/PassCheck")
public class PassCheck extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		System.out.println("======= 원본자료 =======");
		System.out.println("원본idx : " + idx);
		System.out.println("원본mid : " + mid);
		System.out.println("원본pwd : " + pwd);
		System.out.println("======= 원본자료 =======");
		System.out.println();
		
		if(idx == 1) {
			// 숫자만을 암호화하는 경우! 암호키(0x1234ABCD) 
			int key = 0x1234ABCD;
			int encPwd, decPwd;
			encPwd = Integer.parseInt(pwd) ^ key;
			System.out.println("인코딩된 pwd : " + encPwd);
			request.setAttribute("encordingPwd1", encPwd);
			System.out.println("앞에서 인코딩(암호화)된 pwd를 DB에 저장");
			System.out.println("----------------------------------------------");
			System.out.println("DB에 저장된 pwd를 다시 불러와서 디코딩(복호화)한다");
			
			
			decPwd = encPwd ^ key;
			System.out.println("디코딩된 pwd : " + decPwd);
			System.out.println("로그인 인증처리 한다");
			System.out.println("-------------------------  The End  -------------------------");
			System.out.println();			
			System.out.println();			
		}
		
		else if(idx == 2) {
			// 문자, 숫자, 문자숫자조합을 암호화하는 방법! 
			// 예) 문자A로 전송되면 A의 아스키코드인 65를 암호화하여 처리한다
			long intPwd;
			String strPwd = "";
			
			// 입력받은 암호를 한 문자씩 꺼내어서 아스키코드로 변환한 뒤, 문자로 누적처리
			for(int i=0; i<=pwd.length(); i++) {
				intPwd = (long)pwd.charAt(i);
				strPwd += intPwd;
			}
			System.out.println("strPwd(아스키코드로 변환된 비밀번호) : " + strPwd);
			
			intPwd = Long.parseLong(strPwd); 
			

			// 암호화시킬 salt키를 선정..!
			long key = 0x1234ABCD;
			long encPwd;
			
			encPwd = intPwd ^ key;
			//	strPwd = key + encPwd + "";
			//	strPwd = key + String.valueOf(encPwd);
			// 암호화된 코드와 sort키를 합쳐서 DB에 저장처리한다
			System.out.println("인코딩(암호화)된 비밀번호를 (DB에 저장할) : " + strPwd);
			System.out.println("-------------------------  The End  -------------------------");
			System.out.println();			
			
			// 다시 로그인할 때 DB의 비밀번호를 가져와서 복호화 시켜준다
			long decPwd;
			intPwd = Long.parseLong(strPwd.substring(9));
			decPwd = intPwd ^ key;
			
			System.out.println("디코딩된 strPwd : " + decPwd);
			System.out.println("로그인 인증처리 한다");
			System.out.println("-------------------------  The End  -------------------------");
			
			// 복호화된 비밀번호는 숫자이기에 문자로 변환 후 2개씩 문자처리한다
			strPwd = decPwd + "";
			char ch;
			String result = "";
			// 문자로 변환된 복호화 코드를 각각 2자리씩 잘라서 문자로 변환 후 누적처리... 처음 비밀번호와 비교한다
			for(int i=0; i<strPwd.length(); i+=2) {
				ch = (char)Integer.parseInt(strPwd.substring(i, i+2));
				result += ch;
			}
			System.out.println();
			System.out.println("최종 복호화된 비밀번호(원본과 비교 기릿) : " + result);
			request.setAttribute("encordingPwd2", strPwd);
		}
			
		
	
	}
}





































