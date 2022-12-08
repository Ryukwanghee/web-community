<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.dao.FileShareDao"%>
<%@page import="com.community.dao.PostDao"%>
<%@page import="com.community.vo.Post"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	FileShareDao fileShareDao = new FileShareDao();
	Employee emp = fileShareDao.getEmployeeByName(writer);
	
	post.setWriterNo(emp.getNo());
	
	postDao.insertPost(post);
	
	response.sendRedirect("list.jsp");
%>