<%@page import="com.community.dto.EmployeeDto"%>
<%@page import="com.community.vo.Employee"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%
	EmployeeDto loginUser = (EmployeeDto) session.getAttribute("loginedUser");
	if (loginUser == null) {

		response.sendRedirect("/web-community/employees/loginform.jsp?error=deny");
		return;
	}
%>