package schedule;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ScheduleMenuCommand implements ScheduleInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		
		String[] ymds = request.getParameter("ymd").toString().split("-");
				
		if(ymds[1].length() != 2) ymds[1] = "0" + ymds[1];
		if(ymds[2].length() != 2) ymds[2] = "0" + ymds[2];		
		
		String yy = ymds[0];
		String mm = ymds[1];
		String dd = ymds[2];
		
		String ymd = yy + "-" + mm + "-" + dd;
		
		ScheduleDAO dao = new ScheduleDAO();
		ArrayList<ScheduleVO> vos = dao.getScheduleList(mid, ymd, 1);
		System.out.println("vosSize : " + vos.size());
		
		
		request.setAttribute("vos", vos);
		request.setAttribute("ymd", ymd);
		request.setAttribute("scheduleCnt", vos.size());
		
	}
}
