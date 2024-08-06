package guest;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardVO;

@SuppressWarnings("serial")
@WebServlet("/GuestList")
public class GuestList extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GuestDAO dao = new GuestDAO();
		
		
		// (1) 현재 페이지 번호를 구해온다. ※ 가장 처음 입장시 반드시 1페이지!
		int pag = request.getParameter("pag") == null ? 1 : Integer.parseInt(request.getParameter("pag"));
		
		// (2) 한 페이지당 보여줄 분량 / 보고싶은 분량값 가져오기
		int pageSize = request.getParameter("pageSize") == null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		if(pageSize > 5) pag = 1;
		
		// (3) 총 레코드 건 수 (sql명령어 count함수 이용)
		int totRecCnt = dao.gettotRecCnt();
		
		// (4) totPage 수를 구한다
		int totPage = (totRecCnt % pageSize) == 0 ? (totRecCnt / pageSize) : (totRecCnt / pageSize) + 1;
		
		// (5) 현재 페이지에서 출력할 '시작 인덱스 번호(startIndexNo)'를 구한다
		int startIndexNo = (pag - 1) * pageSize;
		
		// (6) 현재 화면에 표시된 시작(실제 게시글 번호)번호를 구한다
		int curScrStartNo = totRecCnt - startIndexNo;
		
		// 시작 블럭을 0으로 처리한다
		// (1)블럭의 크기 결정 ()
		int blockSize = 3;
		
		// (2) 현재 페이지가 속하는 블럭을 구한다 (총 페이지가 38일 경우 한 페이지당 보여주는 값이 5개라면 총 페이지 수는 8개이다)
		// 이때 0블럭은 1,2,3페이지가 1블럭은 4,5,6페이지가 출력된다 
		int curBlock = (pag - 1) / blockSize;
		
		// (3) 마지막 블럭을 구한다.
		int lastBlock = (totPage - 1) / blockSize;
		
		// 설정된 페이지의 모든 자료(변수)들을 viewPage로 넘겨줄 준비
		ArrayList<GuestVO> vos = dao.getGuestList(startIndexNo, pageSize);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("totRecCnt", totRecCnt);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
		request.setAttribute("vos", vos);
		
		
		String viewPage = "/guest/guestList.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	
	}
}
