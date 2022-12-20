<%@page import="com.community.util.MultipartRequest"%>
<%@page import="com.community.dao.TempDao"%>
<%@page import="com.community.dto.TempDto"%>
<%@page import="com.community.vo.Temp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/logincheck.jsp" %>
<%
	MultipartRequest mr = new MultipartRequest(request, "C:\\app\\web-workspace\\temp");
	
	int boardNo = Integer.parseInt(mr.getParameter("boardNo"));
	
/* 	String title = request.getParameter("title");
	String important = request.getParameter("important");
	String content = request.getParameter("content"); */
	String title = mr.getParameter("title");
	String important = mr.getParameter("important");
	String content = mr.getParameter("content");
	String filename = mr.getFilename("attachfile");
	
	System.out.println("게시글 제목: " + title);
	System.out.println("게시글 중요도: " + important);
	System.out.println("게시글 내용: " + content);
	System.out.println("게시글 첨부파일명: " + filename);
	
	TempDao tempDao = TempDao.getInstance();
	
	Temp temp = new Temp();
	temp.setTitle(title);
	temp.setContent(content);
	temp.setImportant(important);
	temp.setBoardNo(boardNo);
	temp.setFileName(filename);
	temp.setEmpNo(loginUser.getNo());
	tempDao.insertTemp(temp);
	
	response.sendRedirect("list.jsp");
	
	
%>