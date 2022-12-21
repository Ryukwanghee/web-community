<%@page import="com.community.vo.FileShare"%>
<%@page import="com.community.util.MultipartRequest"%>
<%@page import="com.community.dto.FileShareDto"%>
<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.dao.FileShareDao"%>
<%@page import="com.community.dao.PostDao"%>
<%@page import="com.community.vo.Post"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file= "../../common/logincheck.jsp" %>
<%
	//멀티파트 요청처리를 지원하는 MultipartRequest 객체를 생성한다.
	MultipartRequest mr = new MultipartRequest(request, "C:\\Users\\apple\\web-workspace\\temp");
	int boardNo = StringUtils.stringToInt(mr.getParameter("boardNo"));
	String title = mr.getParameter("title");
	String writer = mr.getParameter("writer");
	String important = mr.getParameter("important");
	String content = mr.getParameter("content");
	String filename1 = mr.getFilename("attachedFile1");
	String filename2 = mr.getFilename("attachedFile2");
	
	PostDao postDao = new PostDao();
	
	int no = postDao.getnextPostNo();
	
	Post post = new Post();
	post.setNo(no);
	post.setBoardNo(boardNo);
	post.setTitle(title);
	post.setImportant(important);
	post.setContent(content);
	
	post.setWriterNo(loginUser.getNo());
	
	postDao.insertPost(post);
	
	
	// 첨부 파일 
	FileShare file = new FileShare();
	FileShareDao fileShareDao = new FileShareDao();
	
	if (filename1 != null) {
	file.setName(filename1);
	file.setPostNo(no);
	
	fileShareDao.insertFile(file);
	}
	
	if (filename2 != null) {
	file.setName(filename2);
	file.setPostNo(no);
	
	fileShareDao.insertFile(file);
	}
	
	response.sendRedirect("list.jsp");
%>