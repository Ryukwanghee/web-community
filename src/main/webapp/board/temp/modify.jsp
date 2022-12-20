<%@page import="com.community.util.MultipartRequest"%>
<%@page import="com.community.dto.TempDto"%>
<%@page import="com.community.vo.Temp"%>
<%@page import="com.community.dao.TempDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%

	MultipartRequest mr = new MultipartRequest(request, "C:\\app\\web-workspace\\temp");
	int tempNo = Integer.parseInt(mr.getParameter("tempNo"));
	int empNo = Integer.parseInt(mr.getParameter("empNo"));
	

	/* String title = request.getParameter("title");
	String important = request.getParameter("important");
	String content = request.getParameter("content"); */
	String title = mr.getParameter("title");
	String important = mr.getParameter("important");
	String content = mr.getParameter("content");
	String filename = mr.getParameter("attachfile");
	
	TempDao tempDao = TempDao.getInstance();
	TempDto tempDto = tempDao.getTempByNo(tempNo);
	tempDto.setTitle(title);
	tempDto.setImportant(important);
	tempDto.setContent(content);
	tempDto.setFileName(filename);
	
	Temp temp = new Temp(tempNo, empNo);
	temp.setPostReadCount(tempDto.getPostReadCount());
	temp.setTitle(tempDto.getTitle());
	temp.setContent(tempDto.getContent());
	temp.setImportant(tempDto.getImportant());
	temp.setBoardNo(tempDto.getBoardNo());
	temp.setPostReviewCount(tempDto.getPostReviewCount());
	temp.setRecommendCount(tempDto.getRecommendCount());
	temp.setFileName(tempDto.getFileName());
	tempDao.updateTemp(temp);
	
	response.sendRedirect("detail.jsp?tempNo=" + tempNo);

%>