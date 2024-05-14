package admin.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.AdminInterface;
import board.BoardDAO;
import board.BoardVO;

public class BoardContentCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag") == null ? 0 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize") == null ? 0 : Integer.parseInt(request.getParameter("pageSize"));
		
		
		BoardDAO dao = new BoardDAO();
		
		// 조회수 어뷰징 방지
		HttpSession session = request.getSession();
		ArrayList<String> ContentReadNum = (ArrayList<String>)session.getAttribute("sContentIdx"); 
		if(ContentReadNum == null) ContentReadNum = new ArrayList<String>();
		String imsiContentReadNum = "Board" + idx;
		
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
		
		System.out.println("이전" + preVo.getIdx());
		System.out.println("다음" + nextVo.getIdx());
		
		request.setAttribute("preVo", preVo);
		request.setAttribute("nextVo", nextVo);
	}
}