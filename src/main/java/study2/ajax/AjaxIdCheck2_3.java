package study2.ajax;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import database.LoginDAO;
import database.LoginVO;

@WebServlet("/AjaxIdCheck2_3")
public class AjaxIdCheck2_3 extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		
		LoginDAO dao = new LoginDAO();
		
		LoginVO vo = dao.getLoginIdSearch(mid);
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("mid", vo.getMid());
		map.put("name", vo.getName());
		map.put("age", vo.getAge()+""); 
		map.put("gender", vo.getGender());
		map.put("address", vo.getAddress());
		
		// json형식은? [{"키":"값","키":"값"}]
		// Map형식은? {address=서울, gender=여자, name=유소나, mid=sona123, age=35}
		System.out.println("map : " + map);
		
		// Map형식의 자료를 JSON형식으로 변환
		JSONObject jObj = new JSONObject(map);
		System.out.println("jObj : " + jObj);
		
		// JSON형식의 문자열로 변경
		String str = jObj.toJSONString();
		System.out.println("str : " + str);
		
		
//		String str = "";
//		
//		
//		
//		if(vo.getName() == null) str = "찾는 자료가 없습니다";
//		else str = vo.getMid() + "/" + vo.getName() + "/" + vo.getAge() + "/" + vo.getGender() + "/" + vo.getAddress() + "/";
//		
		response.getWriter().write(str);
		
		
		
	}

}
