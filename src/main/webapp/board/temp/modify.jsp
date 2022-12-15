<%@page import="com.community.dto.TempDto"%>
<%@page import="com.community.vo.Temp"%>
<%@page import="com.community.dao.TempDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	int tempNo = Integer.parseInt(request.getParameter("tempNo"));
	int empNo = Integer.parseInt(request.getParameter("empNo"));
	

	String title = request.getParameter("title");
	String important = request.getParameter("important");
	String content = request.getParameter("content");
	
	TempDao tempDao = TempDao.getInstance();
	TempDto tempDto = tempDao.getTempByNo(tempNo);
	tempDto.setTitle(title);
	tempDto.setImportant(important);
	tempDto.setContent(content);
	
	Temp temp = new Temp(tempNo, empNo);
	temp.setPostReadCount(tempDto.getPostReadCount());
	temp.setTitle(tempDto.getTitle());
	temp.setContent(tempDto.getContent());
	temp.setImportant(tempDto.getImportant());
	temp.setBoardNo(tempDto.getBoardNo());
	temp.setPostReviewCount(tempDto.getPostReviewCount());
	temp.setRecommendCount(tempDto.getRecommendCount());
	tempDao.updateTemp(temp);
	
	response.sendRedirect("detail.jsp?tempNo=" + tempNo);

%>