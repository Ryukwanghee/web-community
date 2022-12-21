<%@page import="com.community.dto.FileShareDto"%>
<%@page import="com.community.dao.FileShareDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	int no = StringUtils.stringToInt(request.getParameter("no"));

	FileShareDao fileShareDao = new FileShareDao();
	
	FileShareDto post = fileShareDao.getPostByNo(no);
	
	if (post.getBoardNo() == 100) {
		response.sendRedirect("../board/notice/detail.jsp?no=" + no);
		return;
	} else if (post.getBoardNo() == 101) {
		response.sendRedirect("../board/file/detail.jsp?no=" + no);
		return;
	} else if (post.getBoardNo() == 102) {
		response.sendRedirect("../board/free/detail.jsp?no=" + no);
		return;		
	} else if (post.getBoardNo() == 103) {
		response.sendRedirect("../board/temp/detail.jsp?no=" + no);
		return;		
	} else if (post.getBoardNo() == 105) {
		response.sendRedirect("../board/qna/detail.jsp?no=" + no);
		return;		
	}
%>