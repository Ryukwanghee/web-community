<%@page import="com.community.vo.Post"%>
<%@page import="com.community.dao.PostDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	int postNo = StringUtils.stringToInt(request.getParameter("postNo"));
	
	PostDao postDao = PostDao.getInstance();
	Post post = postDao.getPostByNo(postNo);
	
	if (post.getBoardNo() == 100){
		response.sendRedirect("board/notice/detail.jsp?postNo=" + postNo);
	}
	if (post.getBoardNo() == 101){
		response.sendRedirect("board/file/detail.jsp?postNo=" + postNo);
	}
	if (post.getBoardNo() == 102){
		response.sendRedirect("board/free/detail.jsp?postNo=" + postNo);
	}
	if (post.getBoardNo() == 104){
		response.sendRedirect("board/gallery/detail.jsp?postNo=" + postNo);
	}
	if (post.getBoardNo() == 105){
		response.sendRedirect("board/qna/detail.jsp?postNo=" + postNo);
	}

%>