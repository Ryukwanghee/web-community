
<%@page import="com.community.vo.Employees"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Employees loginUser = (Employees) session.getAttribute("loginedUser");
	if (loginUser == null) {
		response.sendRedirect("/web-community/employees/loginform.jsp?error=deny");
		return;
	}
%>