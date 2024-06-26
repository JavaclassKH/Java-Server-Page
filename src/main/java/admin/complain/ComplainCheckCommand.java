package admin.complain;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminDAO;
import admin.AdminInterface;

public class ComplainCheckCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String part = request.getParameter("part") == null ? "" : request.getParameter("part");
		int partIdx = request.getParameter("partIdx") == null ? 0 : Integer.parseInt(request.getParameter("partIdx"));
		String complain = request.getParameter("complain") == null ? "" : request.getParameter("complain");

		AdminDAO dao = new AdminDAO();
		dao.setComplainNoShow(part, partIdx, complain);
		
		
		
		

	}

}
