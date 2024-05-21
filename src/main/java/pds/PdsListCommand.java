package pds;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Pagenation;

public class PdsListCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pag = request.getParameter("pag") == null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize") == null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		String part = request.getParameter("part") == null ? "전체" : request.getParameter("part");
		
		ArrayList<PdsVo> vos = new ArrayList<PdsVo>();
		PdsDAO dao = new PdsDAO();
		
		Pagenation.pageChange(request, pag, pageSize, "", "pds", part);
		
		
	}
}
