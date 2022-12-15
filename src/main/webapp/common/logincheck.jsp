<%@page import="com.community.vo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Employee loginEmployee = (Employee) session.getAttribute("loginedEmployee");
	if (loginEmployee == null) {
		response.sendRedirect("/web-community/employees/loginform.jsp?error=deny"); //어디에 포함될 지 모르니까 절대경로로 적음
		return;
	}
%>