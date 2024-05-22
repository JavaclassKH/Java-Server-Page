package pds;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PdsDeleteCheckCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		String[] fSNames = request.getParameter("fSName").split("/");
		
		String realPath = request.getServletContext().getRealPath("/images/pds/");
		for(String fSName : fSNames) {
			new File(realPath + fSName).delete();
		}
	
	  // 서버 파일 삭제 후 DB에서 자료 삭제
		PdsDAO dao = new PdsDAO();
		int res = dao.setPdsDeleteCheckCommand(idx);
		
		response.getWriter().write(res+"");
		
	}
}
