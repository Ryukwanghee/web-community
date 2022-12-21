<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.vo.Post"%>
<%@page import="com.community.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	String posts[] = request.getParameterValues("check-post");

	PostDao postDao = new PostDao();
	for (int i = 0; i < posts.length; i++) {
		int postNo = StringUtils.stringToInt(posts[i]);
		Post post = postDao.getPostByNo(postNo);
		
		post.setDeleted("D");
		postDao.deletePost(post);
	}
	
	response.sendRedirect("myposts.jsp");
%>