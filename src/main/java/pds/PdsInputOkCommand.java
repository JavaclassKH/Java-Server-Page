package pds;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.SecurityUtil;

public class PdsInputOkCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pds");
		int maxSize = 1024 * 1024 * 30;
		String encording = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encording, new DefaultFileRenamePolicy());
		
		Enumeration fileNames = multipartRequest.getFileNames();
		
		String file = "";
		String oFileName = "";
		String fSName = "";
		
		while(fileNames.hasMoreElements()) {
			file = (String)fileNames.nextElement();
			
			if(multipartRequest.getFilesystemName(file) != null) {
				oFileName += multipartRequest.getOriginalFileName(file) + "/";
				fSName += multipartRequest.getFilesystemName(file) + "/";					
			}
		}				
		
		// 업로드시킨 파일을 DB에 저장하기 위해서 전송된 폼의 내용을 모두 변수에 넘겨준다.
		String mid = multipartRequest.getParameter("mid") == null ? "" : multipartRequest.getParameter("mid"); 
		String nickName = multipartRequest.getParameter("nickName") == null ? "" : multipartRequest.getParameter("nickName"); 
		int fSize = multipartRequest.getParameter("fSize") == null ? 0 : Integer.parseInt(multipartRequest.getParameter("fSize")); 
		String title = multipartRequest.getParameter("title") == null ? "" : multipartRequest.getParameter("title"); 
		String part = multipartRequest.getParameter("part") == null ? "" : multipartRequest.getParameter("part"); 
		String openSw = multipartRequest.getParameter("openSw") == null ? "" : multipartRequest.getParameter("openSw"); 
		String pwd = multipartRequest.getParameter("pwd") == null ? "" : multipartRequest.getParameter("pwd"); 
		String hostIp = multipartRequest.getParameter("hostIp") == null ? "" : multipartRequest.getParameter("hostIp"); 
		String content = multipartRequest.getParameter("content") == null ? "" : multipartRequest.getParameter("content"); 
		
		// 비밀번호 암호화(SHA-256)
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		// 가공처리된 모든 자료들을 VO에 담아서 DB에 저장한다
		PdsVo vo = new PdsVo();
		vo.setMid(mid);
		vo.setNickName(nickName);
		vo.setfName(oFileName);
		vo.setFsName(fSName);
		vo.setfSize(fSize);
		vo.setTitle(title);
		vo.setPart(part);
		vo.setOpenSw(openSw);
		vo.setPwd(pwd);
		vo.setHostIp(hostIp);
		vo.setContent(content);
		
		
		PdsDAO dao = new PdsDAO();
		int res = dao.setPdsInputOk(vo);
		
		
		if(res != 0) {
			request.setAttribute("message", "자료 업로드 완료");
			request.setAttribute("url", "PdsList.pds");					
		}
		else {			
			request.setAttribute("message", "자료 업로드 실패");
			request.setAttribute("url", "PdsInput.pds");					
		}		
	}
}
