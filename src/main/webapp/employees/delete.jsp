<%@page import="com.community.vo.Comment"%>
<%@page import="com.community.dao.CommentDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../common/logincheck.jsp" %>
<%
	int commentNo = StringUtils.stringToInt(request.getParameter("commentNo"));
	
	CommentDao commentDao = CommentDao.getInstance();
	Comment comment = commentDao.getCommentByCommentNo(commentNo);
	comment.setDeleted("Y");
	commentDao.deleteComment(comment);
	
	response.sendRedirect("mycomments.jsp");
%>