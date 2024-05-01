package study.j0429;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.DispatcherType;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@SuppressWarnings("serial")
@WebServlet("/j0429/Jstl3Ok")
public class Jstl3Ok extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
	
		MemberVO vo = null;
		
		vo = new MemberVO();
		vo.setName("설윤아");
		vo.setAge(21);
		vo.setGender("여자");
		vo.setJob("NMIXX");
		vo.setAddress("서울");
		vos.add(vo);
		
		vo = new MemberVO();	
		vo.setName("장원영");
		vo.setAge(21);
		vo.setGender("여자");
		vo.setJob("IVE");
		vo.setAddress("부산");
		vos.add(vo);
		
		vo = new MemberVO();	
		vo.setName("신유나");
		vo.setAge(23);
		vo.setGender("여자");
		vo.setJob("ITZY");
		vo.setAddress("청주");
		vos.add(vo);
		
		vo = new MemberVO();	
		vo.setName("카리나");
		vo.setAge(23);
		vo.setGender("여자");
		vo.setJob("aespa");
		vo.setAddress("부산");
		vos.add(vo);
		
		request.setAttribute("vos", vos);
		request.setAttribute("cnt", vos.size());
		
		String viewPage = "/study/0429_JSTL/jstl3Res.jsp";		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
		
		
	}
	
	
}
