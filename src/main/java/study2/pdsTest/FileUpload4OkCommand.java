package study2.pdsTest;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import study2.StudyInterface;

public class FileUpload4OkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdsTest");
		int maxSize = 1024 * 1024 * 10;
		String encording = "UTF-8";

		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encording, new DefaultFileRenamePolicy());
		
		// 업로드된 파일의 정보를 추출해온다
		String fNames = multipartRequest.getParameter("fNames");
		
		Enumeration fileNames = multipartRequest.getFileNames();
		String file = "";
		String oFileName = "";
		String fsName = "";
		
		while(fileNames.hasMoreElements()) {
			file = (String)fileNames.nextElement();
			oFileName += multipartRequest.getOriginalFileName(file) + "/";
			fsName += multipartRequest.getFilesystemName(file) + "/";		
		}				
		
		oFileName = oFileName.substring(0,oFileName.lastIndexOf("/"));
		fsName = fsName.substring(0,fsName.lastIndexOf("/"));
		
		System.out.println("원본 파일명 : " + oFileName);
		System.out.println("저장되는 파일명 : " + fsName);
		System.out.println("클라이언트에서 업로드 된 파일명 : " + fNames);
		System.out.println();
		
		if(oFileName != null && !oFileName.equals("")) {
			request.setAttribute("message", "파일 업로드 성공");
		}
		else {
			request.setAttribute("message", "파일 업로드 실패");				
		}

		request.setAttribute("url", "FileUpload4.st");				

	}
}
