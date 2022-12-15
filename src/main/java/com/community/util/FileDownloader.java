package com.community.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import org.apache.tomcat.jakartaee.commons.io.IOUtils;

import com.community.dao.TempDao;
import com.community.dto.TempDto;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 파일다운로드를 요청하는 URL : http://localhost/web-board/download?no=글번호
@WebServlet("/download")
public class FileDownloader extends HttpServlet {
	
	private String directory = "c:\\app\\web-workspace\\temp";

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//쿼리스트링으로 전달된 글번호를 조회한다.
		int tempNo = StringUtils.stringToInt(request.getParameter("tempNo"));
		
		// 글번호에 해당하는 게시글 정보를 조회한다.
		TempDao tempDao = TempDao.getInstance();
		TempDto tempDto = tempDao.getTempByNo(tempNo);		
		// 첨부파일의 파일명을 조회한다.
		String fileName = tempDto.getFileName();
		
		////////////////////////////////////////////////////////////////////////////////////////////////////
		// 파일다운로드
		////////////////////////////////////////////////////////////////////////////////////////////////////
		//1. 응답콘텐츠 타입을 지정한다.
		//	application/octect-stream은 바이너리 데이터타입의 기본이다.
		//	콘텐츠 타입을 알 수 없는 바이너리 데이터는 application/octext-stream을 콘텐츠 타입으로 지정한다.
		response.setContentType("application/octect-stream");
		// 2. 응답메시지의 헤더부에 다운로드되는 파일의 이름을 추가한다.
		//	Content-Disposition은 응답헤더이름이다.
		//	Content-Disposition을 이용해서 다운로드되는 파일이름 정보를 응답메시지의 응답헤더부에 포함시킨다.
		//	Content-Disposition의 응답 헤더값은 "attachment; filename="파일명"이다.
		//	"attachment;"는 첨부파일을 브라우저창에서 오픈없이 저장시킨다.
		//	"filename=" + URLEncoder.encode(fileName, "utf-8")는 파일명에 한글이 포함되어 있을 경우 한글이 깨지지 않도록 utf-8방식을 한글로 변환해서 응답을보낸다.
		response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(fileName, "utf-8"));
		
		// 지정된 디렉토리와 파일명으로 저장된 파일을 읽어오는 FileInputStream객체를 생성한다.
		// 3. 다운로드할 파일을 읽어오는 FileInputStream 객체를 생성한다.
		//	FileInputStream 객체를 파일을 읽어오는 객체다.
		//	new File(디렉토리, 파일명)은 파일의 정보를 표현한느 객체를 생성한다.
		//	new FileInputStream(new File(디렉토리, 파일명));은 파일객체가 표현하는 파일을 읽어오는 객체를 생성한다.
		InputStream in = new FileInputStream(new File(directory, fileName));
		// 브라우저로 바이너리 데이터를 출력하는 OutputStream 객체를 획득한다.
		// 4.응답객체가 브라우저로 바이너리 데이터를 출력할 때 사용하는 객체를 획득한다.
		//	OutputStream 객체는 출력을담당하는 객체다.
		//	response.getOutputStream()을 실행하면 OutputStream객체를 반환한다.
		//	response.getOutputStream()을 실행해서 획득한 OutputStream객체는 브라우저로 출력하는 객체다.
		OutputStream out = response.getOutputStream();
		// 5.IOUtils클래스의 copy(InputStream in, OutputStream out)은 in으로 읽어온 바이너리 데이터를 out으로 보낸다.
		IOUtils.copy(in, out);
		// 6.InputStream과 OutputStream은 컴퓨터의 읽기/쓰기 자원을 사용하기 때문에 읽기/쓰기 작업이 완료되면 사용했던 자원을 반납한다.
		in.close();
		out.close();
	}
}








