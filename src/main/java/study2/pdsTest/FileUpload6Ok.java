package study2.pdsTest;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
@MultipartConfig (
	fileSizeThreshold = 1024 * 1024,        // 업로드 시 메모리에 저장되는 임시 파일 크기 결정 	
  maxFileSize = 1024 * 1024 * 5,          // 업로드 시 한개 파일의 최대 용량을 5MB로 설정
  maxRequestSize = 1024 * 1024 * 5 * 10   // 한번 request시 전송할 파일의 최대 개수
)
@WebServlet("/FileUpload6Ok")
public class FileUpload6Ok extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdsTest/");
		
		// requset객체 안의 getParts() 메소드 이용하여 배열로 받기
		Collection<Part> fileParts = request.getParts();
		
		for(Part filePart : fileParts) {
			if(!filePart.getName().equals("fName")) continue;
			if(filePart.getSize() == 0) continue;
			
			String fileName = filePart.getSubmittedFileName();
			InputStream fis = filePart.getInputStream(); 
			
			String uid = UUID.randomUUID().toString().substring(0,8);
			fileName = fileName.substring(0, fileName.lastIndexOf(".")) + "_" + uid + fileName.substring(fileName.lastIndexOf("."));
		
			FileOutputStream fos = new FileOutputStream(realPath + fileName);
			
			byte[] buffer = new byte[2048];
			int size = 0;
			
			while((size = fis.read(buffer)) != - 1) {
				fos.write(buffer, 0, size);
			}

			fos.close();
			fis.close();
		}
		
		request.setAttribute("message", "파일 업로드 완료");
		request.setAttribute("url", "FileUpload6.st");
		
		String viewPage = "/include/message.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}

































