package admin.complain;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminDAO;
import admin.AdminInterface;

public class ComplainListCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminDAO dao = new AdminDAO();
		
		ArrayList<ComplainVO> vos = new ArrayList<ComplainVO>();
		vos = dao.ComplainList();
		
		request.setAttribute("vos", vos);
		request.setAttribute("complainCnt", vos.size());
	}
}
