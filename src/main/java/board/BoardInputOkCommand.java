package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

public class BoardInputOkCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String nickName = request.getParameter("nickName") == null ? "" : request.getParameter("nickName");
		String title = request.getParameter("title") == null ? "" : request.getParameter("title");
		String content = request.getParameter("content") == null ? "" : request.getParameter("content");
		String hostIp = request.getParameter("hostIp") == null ? "" : request.getParameter("hostIp");
		String openSw = request.getParameter("openSw") == null ? "" : request.getParameter("openSw");
		
		BoardVO vo = new BoardVO();
		
		vo.setMid(mid);
		vo.setNickName(nickName);
		title = title.replace("<", "&lt;").replace(">", "&gt;");
		vo.setTitle(title);
		vo.setContent(content);
		vo.setHostIp(hostIp);
		vo.setOpenSw(openSw);
		
		BoardDAO dao = new BoardDAO();
		
		int res = dao.setBoardInput(vo);
		
		if(res != 0) {
			request.setAttribute("message", "게시글이 정상적으로 등록되었습니다");
			request.setAttribute("url", "BoardList.bo");
		}
		else {
			request.setAttribute("message", "게시글등록에 실패하였습니다");
			request.setAttribute("url", "BoardInput.bo");			
		}
		
		
		
		
		
		
		
		
	}

}
