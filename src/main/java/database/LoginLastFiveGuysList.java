package database;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/study/database/LoginLastFiveGuysList")
public class LoginLastFiveGuysList extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginDAO dao = new LoginDAO();
		
		ArrayList<LoginVO> vos2 = dao.getLoginFiveList();
		System.out.println("vos2 : " + vos2);
		
		request.setAttribute("vos2", vos2);
		
		String viewPage = "/index.jsp";
		RequestDispatcher dispatcher2 = request.getRequestDispatcher(viewPage);
		dispatcher2.forward(request, response);
	}
}