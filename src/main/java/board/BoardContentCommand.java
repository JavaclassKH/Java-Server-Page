package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.AdminDAO;

@SuppressWarnings("unchecked")
public class BoardContentCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag") == null ? 0 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize") == null ? 0 : Integer.parseInt(request.getParameter("pageSize"));
		String flag = request.getParameter("flag") == null ? "" : request.getParameter("flag");
		String search = request.getParameter("search") == null ? "" : request.getParameter("search");
		String searchString = request.getParameter("searchString") == null ? "" : request.getParameter("searchString");
		
				
		BoardDAO dao = new BoardDAO();
		
		// 조회수 어뷰징 방지
		HttpSession session = request.getSession();
		ArrayList<String> ContentReadNum = (ArrayList<String>)session.getAttribute("sContentIdx"); 
		if(ContentReadNum == null) ContentReadNum = new ArrayList<String>();
		String imsiContentReadNum = "board" + idx;
		
		if(!ContentReadNum.contains(imsiContentReadNum)) {
			// 게시글 조회수 1씩 증가시키기
			dao.setBoardReadNumPlus(idx);
			ContentReadNum.add(imsiContentReadNum);
		}
		session.setAttribute("sContentIdx", ContentReadNum);

		BoardVO vo = dao.getBoardContent(idx);	
		request.setAttribute("vo", vo);

		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		
		// 이전글 , 다음글 처리
		BoardVO preVo = dao.getPreNextSearch(idx, "preVo");
		BoardVO nextVo = dao.getPreNextSearch(idx, "nextVo");
		
		request.setAttribute("preVo", preVo);
		request.setAttribute("nextVo", nextVo);
		
		// 현재 게시글 신고여부 확인 
		AdminDAO adminDao = new AdminDAO();
		String report = adminDao.getReportCheck("board", idx); 
		request.setAttribute("report", report);
		request.setAttribute("flag", flag);
		request.setAttribute("search", search);
		request.setAttribute("searchString", searchString);
		
		// 댓글 화면에 표시 처리
		ArrayList<BoardReplyVO> replyVos = new ArrayList<BoardReplyVO>();
		replyVos = dao.getBoardReply(idx);	
		
		request.setAttribute("replyVos", replyVos);
		
		
		
		
		
		
		
		
		
		
		
	}
}