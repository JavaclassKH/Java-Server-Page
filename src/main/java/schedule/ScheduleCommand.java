package schedule;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study2.StudyInterface;

public class ScheduleCommand implements ScheduleInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 오늘날짜 처리(저장)
		Calendar calToday = Calendar.getInstance();
		int toYear = calToday.get(Calendar.YEAR);
		int toMonth = calToday.get(Calendar.MONTH);
		int toDay = calToday.get(Calendar.DATE);
	
		// 화면에 보여줄 해당연도와 월을 준비한다
		int yy = request.getParameter("yy") == null ? toYear : Integer.parseInt(request.getParameter("yy"));
		int mm = request.getParameter("mm") == null ? toMonth : Integer.parseInt(request.getParameter("mm"));
		
		
		// 이전 월 클릭시 1월(0)은 음수가 넘어오니 년도를 하나 빼주고 월은 12월로 세팅해준다
		// 다음 월 클릭시 12월(11)은 13월(12)이 넘어오니 년도를 하나 더해주고 월은 1월(0)로 세팅해준다
				
		if(mm < 0) {
			yy--;
			mm = 11;
		}
		if(mm > 11) {
			yy++;
			mm = 0;
		}
		
		// 선택한 현재의 년,월,일 의 1일을 기준으로 날짜 세팅 (처음 날짜 셋팅 '년/월/일(1일부터)')
		calToday.set(yy, mm, 1);
		
		// 앞에서 세팅된 해당 년도 '년/월,일'의 요일에 해당하는 값을 숫자로 가져온다. 1~7 = 일~토 
		// 날짜를 표시할 시작테이블의 1일이 들어갈 첫 요일을 찾는다. 
		// ex) 5월 1일이 수요일이라면 요일 값은 '4'로 하여 수요일에 1일을 표시하기 위한 것
		int startWeek = calToday.get(Calendar.DAY_OF_WEEK);
		
		// 해당 '년,월'의 마지막 일자를 구함
		int lastDay = calToday.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		// 화면에 보여줄 달력의 해당 내역('년,월,요일숫자,마지막일자')을 보낸다
		request.setAttribute("yy", yy);
		request.setAttribute("mm", mm);
		request.setAttribute("startWeek", startWeek);
		request.setAttribute("lastDay", lastDay);
		
		// 오늘 날짜를 담아 저장(오늘 날짜를 보내놔야 오늘날짜 선택 시 오늘날짜로 돌아오기가 가능!)
		request.setAttribute("toYear", toYear);
		request.setAttribute("toMonth", toMonth);
		request.setAttribute("toDay", toDay);
		
		// 현재일을 기준으로 전월/다음월 을 구하여 저장소에 담아서 넘겨준다
		
		// 앞에서 세팅한 '년/월'의 앞쪽 셀은 이전일 마지막일수
		int preYear = yy;
		int preMonth = mm - 1;
		int nextYear = yy;
		int nextMonth = mm + 1;
		
		if(preMonth == -1) {
			preYear--;
			preMonth = 11;
		}
		if(nextMonth == 12) {
			nextYear++;
			nextMonth = 0;
		}
		
		calToday.set(preYear, preMonth, 1);
		int prevLastDay = calToday.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		// 다음월의 1일에 해당하는 요일을 숫자로 구한다.
		calToday.set(nextYear, nextMonth, 1);
		int nextStartWeek = calToday.get(Calendar.DAY_OF_WEEK);
		
		// 현재 달의 전,다음 월의 변수를 넘겨준다
		request.setAttribute("preYear", preYear);
		request.setAttribute("preMonth", preMonth);
		request.setAttribute("prevLastDay", prevLastDay);
		request.setAttribute("nextYear", nextYear);
		request.setAttribute("nextMonth", nextMonth);
		request.setAttribute("nextStartWeek", nextStartWeek);
		
		// DB에 저장된 일정 정보들을 가져와서 저장소에 담아준다.
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		
		// 2024년 5월 => 2024-05로 변환
		String ym = "";
		if(mm + 1 < 10) ym = yy + "-0" + (mm + 1);
		else ym = yy + "-" + (mm + 1);
		
		ScheduleDAO dao = new ScheduleDAO();
		ArrayList<ScheduleVO> vos = dao.getScheduleList(mid, ym, 0);
		request.setAttribute("vos", vos);
		
	}
}























