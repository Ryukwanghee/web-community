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
	int boardNo = StringUtils.stringToInt(request.getParameter("boardNo"));
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String important = request.getParameter("important");
	String content = request.getParameter("content");
	
	Post post = new Post();
	
	post.setBoardNo(boardNo);
	post.setTitle(title);
	post.setImportant(important);
	post.setContent(content);
	
	PostDao postDao = new PostDao();
	
	post.setWriterNo(loginUser.getNo());
	
	postDao.insertPost(post);
	
	response.sendRedirect("list.jsp");
%>