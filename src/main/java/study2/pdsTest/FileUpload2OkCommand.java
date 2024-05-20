package study2.pdsTest;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import study2.StudyInterface;

@SuppressWarnings("unused")
public class FileUpload2OkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
		String realPath = request.getServletContext().getRealPath("/images/pdsTest");
		int maxSize = 1024 * 1024 * 10;
		String encording = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encording, new DefaultFileRenamePolicy());
		String oFileName1 = multipartRequest.getOriginalFileName("fName1");
		String oFileName2 = multipartRequest.getOriginalFileName("fName2");
		String oFileName3 = multipartRequest.getOriginalFileName("fName3");
		
		System.out.println("원본1 : " + oFileName1);
		System.out.println("원본2 : " + oFileName2);
		System.out.println("원본3 : " + oFileName3);
		System.out.println();
		
		String fsName1 = multipartRequest.getFilesystemName("fName1");
		String fsName2 = multipartRequest.getFilesystemName("fName2");
		String fsName3 = multipartRequest.getFilesystemName("fName3");
		System.out.println("서버저장1 : " + fsName1);
		System.out.println("서버저장2 : " + fsName2);
		System.out.println("서버저장3 : " + fsName3);
		
		if(oFileName1 != null && !oFileName1.equals("")) {
			request.setAttribute("message", "멀티 파일 업로드 완료!");
		}
		else {
			request.setAttribute("message", "멀티 파일 업로드 실패!");			
		}
		
		request.setAttribute("url", "FileUpload2.st");			
		
	}
}
