
<%@page import="com.community.vo.Employees"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Employees loginEmployees = (Employees) session.getAttribute("loginedEmployees");
	if (loginEmployees == null) {
		response.sendRedirect("/web-community/employees/loginform.jsp?error=deny");
		return;
	}
%>