package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test4InputOkCommand implements Test4Interface {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 Test4InputOkCommand 입니돠");
		System.out.println("이곳에서는 가입한 회원의 정보를 DB에 저장할 준비를 한다");
		
		// DB에 저장하러 이동함
		String massage = "회원가입이 완료되었습니다! 환영합니다!";
		request.setAttribute("massage", massage);
		request.setAttribute("url", "Test4.do4");
		
		 
		
	}

}
