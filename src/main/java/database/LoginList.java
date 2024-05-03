package database;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@SuppressWarnings("serial")
@WebServlet("/study/database/LoginList")
public class LoginList extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginDAO dao = new LoginDAO();
		String sort = request.getParameter("sort") == null ? "" : request.getParameter("sort");
			
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
		
		// 설정된 페이지의 모든 자료(변수)들을 viewPage로 넘겨줄 준비!
	
		// 한 페이지에 표시할 건수만을 DAO에서 가져온다 (PageSize 수만큼)
		ArrayList<LoginVO> vos = dao.getLoginList();
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("sort", sort);
		request.setAttribute("totRecCnt", totRecCnt);
		request.setAttribute("totPage", totPage);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("vos", vos);
		
		String viewPage = "/study/database/loginMain.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}