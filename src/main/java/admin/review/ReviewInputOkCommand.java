package admin.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminDAO;
import admin.AdminInterface;

public class ReviewInputOkCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String part = request.getParameter("part") == null ? "전체" : request.getParameter("part");
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int partIdx = request.getParameter("partIdx") == null ? 0 : Integer.parseInt(request.getParameter("partIdx"));
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String nickName = request.getParameter("nickName") == null ? "" : request.getParameter("nickName");
		int star = request.getParameter("star") == null ? 0 : Integer.parseInt(request.getParameter("star"));
		String content = request.getParameter("content") == null ? "" : request.getParameter("content");
		
		ReviewVO vo = new ReviewVO();
		
		vo.setPart(part);
		vo.setPartIdx(partIdx);
		vo.setMid(mid);
		vo.setNickName(nickName);
		vo.setStar(star);
		vo.setContent(content);
		
		AdminDAO dao = new AdminDAO();
		String str = "";
		int res = 0; 
		res = dao.getReviewSearch(vo);
		if(res != 0) str = "이미 리뷰를 작성하신 글입니다";
		else {
			res  = dao.setReviewInputOk(vo);
			if(res != 0) str = "리뷰 작성을 완료하였습니다";
			else str = "리뷰 작성에 실패하였습니다";
		}
		response.getWriter().write(str);
		
	}
}
