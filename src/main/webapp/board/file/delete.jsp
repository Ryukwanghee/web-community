<%@page import="com.community.vo.FileShare"%>
<%@page import="java.util.List"%>
<%@page import="com.community.dao.FileShareDao"%>
<%@page import="com.community.vo.Post"%>
<%@page import="com.community.dao.PostDao"%>
<%@page import="com.community.dto.FileShareDto"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%@ include file= "../../common/logincheck.jsp" %>
<%
	// post 번호를 전달받는다.
	int no = StringUtils.stringToInt(request.getParameter("no"));
	
	FileShareDao fileShareDao = new FileShareDao();
	
	List<FileShare> files = fileShareDao.getFilesByNo(no);
	
	if (files != null) {
		fileShareDao.deleteFiles(no);
	}
	
	
	// post 번호에 해당하는 게시글 정보를 가진 객체를 생성한다.
	PostDao postDao = new PostDao();
	Post post = postDao.getPostByNo(no);
	
	// deleted 여부를 "D"로 변경한다.
	post.setDeleted("D");
	
	postDao.deletePost(post);
	
	response.sendRedirect("list.jsp");
	
%>