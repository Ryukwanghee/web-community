<%@page import="com.community.util.MultipartRequest"%>
<%@page import="com.community.vo.Notice"%>
<%@page import="com.community.dao.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>

<%
	// 요청객체에 저장된 요청파라미터값을 가져온다
	String title = request.getParameter("title");

MultipartRequest mr = new MultipartRequest(request, "C:\\app\\web-workspace\\temp");

	String content = mr.getParameter("content");
	String post_title = mr.getParameter("post_title");


	Notice notice = new Notice();
	notice.setContent(content);
	notice.setPost_title(post_title);
	


	NoticeDao noticeDao = new NoticeDao();
	noticeDao.insertNotice(notice);
	
	response.sendRedirect("list.jsp");
%>
   
