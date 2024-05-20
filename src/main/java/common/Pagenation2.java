package common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import board.BoardDAO;
import board.BoardVO;

public class Pagenation2 {

	public static void pageChange(HttpServletRequest request, int pag, int pageSize, String contentsShow, String part, String string) {
		BoardDAO boardDao = new BoardDAO();
//		PdsDAO pdsDao = new PdsDAO();
		int totRecCnt = 0;
		
		if(contentsShow.equals("board")) {
			totRecCnt = boardDao.gettotRecCnt(contentsShow, "",""); // 게시판의 전체 레코드수 구하기			
		}
		else if(contentsShow.equals("pds")) {
			//totRecCnt = PdsDao.gettotRecCnt(); // 자료실의 전체 레코드수 구하기						
		}
		
		int totPage = (totRecCnt % pageSize)==0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize) + 1;
		if(pag > totPage) pag = 1;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStartNo = totRecCnt - startIndexNo;
		
		int blockSize = 3;
		int curBlock = (pag - 1) / blockSize;
		int lastBlock = (totPage - 1) / blockSize;
		
		List<BoardVO> vos = null;
		/* List<PdsVO> vos = null; */
		
		if(contentsShow.equals("board")) {
			vos = boardDao.getBoardList(startIndexNo, pageSize, contentsShow, "", "");
		}
		else if(contentsShow.equals("pds")) {
			//vos = PdsDao.getBoardList(startIndexNo, pageSize);
		}
		request.setAttribute("vos", vos);	
		
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("totRecCnt", totRecCnt);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
		
		/* request.setAttribute("part", part); */

		
		
	}
	
//  public static void pageChange(HttpServletRequest request, int pag, int pageSize) {	
//    
//   
//	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}

/* 
 	
 	
 	현재 페이지(pag) / 총 페이지 개수(pageSize) => 프론트에서 계속 값을 받아와야 함! get방식 QueryString 사용!
 	총 게시글 수 구해오기 = dao에서 구해오기! (Count함수 사용)
  총 페이지 수 : (총 게시글 수 % 총 페이지 개수)가 0일 시에는 (총 게시글 수 / 총 페이지 개수), 0이 아니면 (총 게시글 수 / 총 페이지 개수) + 1
  만약 현재 페이지가 총 페이지 개수를 넘어가면 다시 1페이지로 보내기
  1페이지의 시작 글 번호는 : (현재 페이지 - 1) X 페이지 총 개수
  ex)
 	현재 페이지의 시작 글 번호는 : 총 개시글 개수 - 1페이지 시작 글 개수  
  ex)
  
 	// 페이징 처리 시작
	int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
	int pageSize = request.getParameter("pageSize")==null ? 10 : Integer.parseInt(request.getParameter("pageSize"));
	int totRecCnt = dao.gettotRecCnt();
	int totPage = (totRecCnt % pageSize)==0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize) + 1;
	if(pag > totPage) pag = 1;
	int startIndexNo = (pag - 1) * pageSize;
	int curScrStartNo = totRecCnt - startIndexNo;
	int blockSize = 3;
	int curBlock = (pag - 1) / blockSize;
	int lastBlock = (totPage - 1) / blockSize;
	// 페이징 처리 끝

	 
*/













