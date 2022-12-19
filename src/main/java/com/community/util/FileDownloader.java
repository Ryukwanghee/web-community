package com.community.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

import org.apache.tomcat.jakartaee.commons.io.IOUtils;

import com.community.dao.FileShareDao;
import com.community.vo.FileShare;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 파일다운로드를 요청하는 URL : http://localhost/web-community/download?no=글번호&filename=파일명
@WebServlet("/download")
public class FileDownloader extends HttpServlet {
	
	private String directory = "C:\\Users\\apple\\web-workspace\\temp";

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 쿼리스트링으로 전달된 글 번호를 조회한다.
		int postNo = StringUtils.stringToInt(request.getParameter("no"));
		// BoardDao객체를 생성하고, 글번호에 해당하는 게시글 정보를 조회한다.
		FileShareDao fileShareDao = new FileShareDao();
		List<FileShare> files = fileShareDao.getFilesByNo(postNo);		
		// 첨부파일의 파일명을 조회한다.
		String filename = null;
		
		for (FileShare file : files) {
			if (file.getName().equals(request.getParameter("filename"))) {
				filename = file.getName();
			}
		}
		
		// 1. 응답컨텐츠의 타입을 지정한다.
		// 		application/octet-stream은 바이너리 데이터 타입의 기본값이다.
		// 		컨텐츠 타입을 알 수 없는 바이너리 데이터는 application/octet-stream을 컨텐츠 타입으로 지정한다.
		response.setContentType("application/octet-stream");
		// 2. 응답메세지의 헤더부에 다운로드되는 파일이름 정보를 추가한다.
		// 		Content-Disposition은 응답메세지 헤더이름이다.
		// 		Content-Disposition을 이용해서 다운로드되는 파일이름 정보를 응답메세지의 응답헤더부에 포함시킨다.
		// 		Content-Disposition의 응답헤더 값은 "attachment; filename=파일명" 이다.
		// 		attachment;는 첨부파일을 브라우저창에서 오픈없이 저장시킨다.
		// 		filename=파일명은 다운로드되는 파일명을 지정한다.
		response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(filename, "utf-8"));
		
		// 3. 다운로드할 파일을 읽어오는 FileInputStream 객체를 생성한다.
		//  	FileInputStream 객체는 파일을 읽어오는 객체다.
		// 		new File(디렉토리, 파일명)은 파일의 정보를 표현하는 객체를 생성한다.
		InputStream in = new FileInputStream(new File(directory, filename));
		// 4. 응답객체가 브라우저로 바이너리 데이터를 출력할 때 사용되는 객체를 획득한다.
		//		OutputStream 객체는 출력을 담당하는 객체다.
		// 		response.getOutputStream()을 실행하면 OutputStream 객체를 반환한다.
		// 		response.getOutputStream()을 실행해서 획득한 OutputStream객체는 브라우저로 출력하는 객체다.
		// 브라우저로 바이너리 데이터를 출력하는 OutPutStream객체를 획득한다.
		OutputStream out = response.getOutputStream();
		// 5. IOUtils클래스의 copy()는 in으로 읽어온 바이너리 데이터를 out으로 내보낸다.
		IOUtils.copy(in, out);
		// 6. InputStream과 OutputStream은 컴퓨터의 읽기/쓰기 자원을 사용하기 때문에 읽기/쓰기 작업이 완료되면 사용했던 자원을 반납한다.
		in.close();
		out.close();
	}
}
