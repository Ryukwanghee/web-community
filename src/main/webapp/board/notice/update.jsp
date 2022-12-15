<%@page import="com.community.vo.Notice"%>
<%@page import="com.community.dao.NoticeDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%
	// 수정폼의 입력값을 요청객체엣 ㅓ가져온다.
	int postNo = StringUtils.stringToInt(request.getParameter("postNo"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	// NoticeDao 객체를 생성해서 , getNoticeByNo 실행 -> 게시글조회
	NoticeDao noticeDao = new NoticeDao();
	Notice notice = noticeDao.getNoticeByNo(postNo);
	
	// 조회된 게시글 정보의 값을 수정폼의 입력값으로 변경한다.
	notice.setTitle(title);
	notice.setContent(content);
	notice.setPostNo(postNo);
	
	// 변경된 게시글정보를 NoticeDao의 updateNotice(Notice)를 실행해서 반영시킨다.
	noticeDao.updateNotice(notice);
	
	// 변경작업을 수행 -> 재요청URL
	response.sendRedirect("detail.jsp?no=" + postNo);
%>