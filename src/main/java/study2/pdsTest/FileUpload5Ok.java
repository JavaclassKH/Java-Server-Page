package study2.pdsTest;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
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
@WebServlet("/FileUpload5Ok")
public class FileUpload5Ok extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdsTest/");
// requset객체 안의 getPart() 메소드 이용하여 하나의 파일 받기
		
		Part filePart = request.getPart("fName"); // form태그의 file속성 name명을 적는다
		String fileName = filePart.getSubmittedFileName(); // 클라이언트에서 전송한 파일 이름
		
		InputStream fis = filePart.getInputStream();  // 파일 입력 스트림 생성
		
		// 파일명 중복 방지
		String uid = UUID.randomUUID().toString().substring(0,8);
		// ex) 저장되는 파일명의 예시 : atom_23E214df.jpg  -- 이것을 가공한다
		fileName = fileName.substring(0, fileName.lastIndexOf(".")) + "_" + uid + fileName.substring(fileName.lastIndexOf("."));
		System.out.println("fileName : " + fileName);
		
		
		FileOutputStream fos = new FileOutputStream(realPath + fileName);  // 파일 출력 스트림 생성
		
		// 전송되는 파일을 2048Byte 단위로 버퍼에 읽어서 서버 파일 시스템에 저장한다.
		byte[] buffer = new byte[2048];
		int size = 0;
		
		while((size = fis.read(buffer)) != - 1) {
			fos.write(buffer, 0, size);
		}

		fos.close();
		fis.close();
		
		request.setAttribute("message", "파일 업로드 완료");
		request.setAttribute("url", "FileUpload5.st");
		
		String viewPage = "/include/message.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}

































