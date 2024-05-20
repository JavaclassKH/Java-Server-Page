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
public class FileUpload1OkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String fName = request.getParameter("fName") == null ? "" : request.getParameter("fName");		
//		System.out.println("fName : " + fName);
		
		/* 
		  COS라이브러리에서 제공해주는 객체: MultipartRequest() / DefaultFileRenamePolicy()
			(필수는 앞의 4개)사용법 : MultipartRequest(저장소명(request), 서버에 저장될 파일의 경로(/images/pdsTest), 서버에 저장될 파일의 최대용량, 코드변환방식(UTF-8), 기타옵션(파일 이름 중복 방지 : DefaultFileRenamePolicy))	
			
			저장되는 서버 웹 사이트의 절대경로 : /webapp : getRealPath("/")
			application.getRealPath("/");     
		*/
		
		// 일반 자바에서 어노테이션으로 사용하는 방법		 --
		
	//    @MultipartConfig( location = "/images/pdsTest", maxFileSize = 1024 * 1024 *
	//    10, maxRequestSize = 1024 * 1024 * 10 * 10 )
		
		// 일반 자바에서 어노테이션으로 사용하는 방법	   --
		
		
		String realPath = request.getServletContext().getRealPath("/images/pdsTest");
		int maxSize = 1024 * 1024 * 10;
		String encording = "UTF-8";
		
		// 파일 업로드 처리 (객체 생성시 파일이 자동을 업로드 된다)
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encording, new DefaultFileRenamePolicy());
		
		// 닉네임 받아서 출력
		//String nickName = request.getParameter("nickName") == null ? "" : request.getParameter("nickName");	
		String nickName = multipartRequest.getParameter("nickName") == null ? "실패" : multipartRequest.getParameter("nickName");	
		System.out.println("파일 업로드 닉네임 : " + nickName);
		
		// 업로드된 파일의 정보를 추출한다
		String originalFileName = multipartRequest.getOriginalFileName("fName");
		System.out.println("원본파일명 : " + originalFileName);
		
		// 백엔드 파일체크
		if(originalFileName != null && originalFileName.equals("")) {
			request.setAttribute("message", "파일전송완료");			
		}
		else {
			request.setAttribute("message", "파일전송실패");						
		}
		String fsn = multipartRequest.getFilesystemName("fName");
		System.out.println("서버에 저장되는 파일명 : " + fsn);
		System.out.println("서버에 저장되는 파일 경로 : " + realPath);
		
		request.setAttribute("url", "FileUpload1.st");
	}
}
