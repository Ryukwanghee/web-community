<%@page import="com.community.dao.TempDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/logincheck.jsp" %>

<%
	int empNo = loginUser.getNo();
	TempDao tempDao = TempDao.getInstance();
	tempDao.deleteEmployeeNo(empNo);

	response.sendRedirect("list.jsp");
%>