<%@page import="jakarta.websocket.SendResult"%>
<%@page import="com.community.vo.Temp"%>
<%@page import="com.community.dto.TempDto"%>
<%@page import="com.community.dao.TempDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%@ include file="../../common/logincheck.jsp" %>
<%
	int tempNo = StringUtils.stringToInt(request.getParameter("tempNo"));

	TempDao tempDao = TempDao.getInstance();
	
	TempDto tempDto = tempDao.getTempByNo(tempNo);
	
	tempDto.setRecommendCount(tempDto.getRecommendCount() + 1);
	
	Temp temp = new Temp(tempNo, loginEmployee.getNo());
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