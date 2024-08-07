package webMessage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WmDeleteCheckCommand implements WebMessageInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		int mSw = request.getParameter("mSw") == null ? 1 : Integer.parseInt(request.getParameter("mSw"));
		
		WebMessageDAO dao = new WebMessageDAO();
		int res = dao.WmDeleteCheck(idx, mSw);
		
		if(res != 0) {
			request.setAttribute("message", "메세지를 휴지통으로 이동했습니다");
		}
		else {
			request.setAttribute("message", "메세지를 휴지통으로 이동하지 못했습니다");
		}
		request.setAttribute("url", "WebMessage.wm?mSw=1");			
		
	}
}
