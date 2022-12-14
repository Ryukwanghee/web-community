<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.dao.FreeDao"%>
<%@page import="com.community.vo.Free"%>
<%@page import="com.community.util.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	Employee employee = (Employee)session.getAttribute("loginedEmployee");
	
	MultipartRequest mr = new MultipartRequest(request,"");
	int boardNo = Integer.parseInt(mr.getParameter("boardNo"));
	String title = mr.getParameter("title");
	String content = mr.getParameter("content");
	String important = mr.getParameter("important");
	int writerNo = employee.getNo(); 		
	
	Free free = new Free();
	free.setBoardNo(boardNo);
	free.setTitle(title);
	free.setContent(content);
	free.setImportant(important);
	free.setWriterNo(writerNo);
	
	FreeDao freeDao = FreeDao.getInstance();
	freeDao.insertFree(free);
	
	response.sendRedirect("list.jsp");
%>