<%@page import="com.community.vo.Post"%>
<%@page import="com.community.dao.PostDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="common/logincheck.jsp" %>
<%
	int postNo = StringUtils.stringToInt(request.getParameter("postNo"));
	
	PostDao postDao = PostDao.getInstance();
	Post post = postDao.getPostByNo(postNo);
	
	post.setDeleted("Y");
	postDao.deletePost(post);
	
	response.sendRedirect("myposts.xml");
%>