package study2.Calendar;

import java.io.IOException;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class Calendar1Command implements StudyInterface {

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
		
	}
}
