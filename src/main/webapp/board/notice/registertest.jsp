<%@page import="com.community.dao.TempPostDao"%>
<%@page import="com.community.vo.TempPost"%>
<%@page import="com.community.vo.Notice"%>
<%@page import="com.community.dao.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%
	// 요청객체에 저장된 요청파라미터값을 가져온다.

	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writer_no = request.getParameter("writer_no");
	
	// 조회된 요청 파라미터값을 Notice객체에 저장
		Notice notice = new Notice();
		notice.setTitle(title);
		notice.setContent(content);
		notice.setWriter(writer_no);

		// NoticeDao객체를 생성하고, insertNotice(Notice notice)메소드를 실행해서 게시글 정보를 저장시킨다.
		NoticeDao noticeDao = new NoticeDao();
		noticeDao.insertNotice(notice);
		
	// 저장/변경/삭제 작업 중에서 저장작업을 수행하였음으로 재요청 URL을 전송한다.
	response.sendRedirect("list.jsp");
%>