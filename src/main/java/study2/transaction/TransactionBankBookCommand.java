package study2.transaction;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyDAO;
import study2.StudyInterface;

public class TransactionBankBookCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudyDAO dao = new StudyDAO();
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		
		ArrayList<BankBookVO> vos = dao.getBankBookList(mid);
		
		request.setAttribute("vos", vos);
		
		
	}
}
