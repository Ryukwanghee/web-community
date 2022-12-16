<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.dao.TempDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/logincheck.jsp" %>
<%
	String[] values = request.getParameterValues("tempNo");
	
	TempDao tempDao = TempDao.getInstance();
	for (String value : values) {
		int tempNo = StringUtils.stringToInt(value);
		tempDao.deleteTempByNo(tempNo);
	}
	
	response.sendRedirect("list.jsp");
	
%>
