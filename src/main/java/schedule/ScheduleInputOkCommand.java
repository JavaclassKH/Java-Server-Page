package schedule;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ScheduleInputOkCommand implements ScheduleInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String part = request.getParameter("part") == null ? "" : request.getParameter("part");
		String content = request.getParameter("content") == null ? "" : request.getParameter("content");
		String sDate = request.getParameter("sDate") == null ? "" : request.getParameter("sDate");
		
		ScheduleDAO dao = new ScheduleDAO();
		ScheduleVO vo = new ScheduleVO();
		
		vo.setMid(mid);
		vo.setPart(part);
		vo.setsDate(sDate);
		vo.setContent(content);
		
		int res = dao.setScheduleInputOk(vo);
		
		response.getWriter().write(res+"");
		
	}
}
