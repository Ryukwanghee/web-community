

<%@page import="com.community.vo.Employees"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Employees loginEmployees = (Employees) session.getAttribute("loginedEmployees");
	if (loginEmployees == null) {

<%@page import="com.community.dto.EmployeeDto"%>
<%@page import="com.community.vo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	EmployeeDto loginUser = (EmployeeDto) session.getAttribute("loginedUser");
	if (loginUser == null) {

		response.sendRedirect("/web-community/employees/loginform.jsp?error=deny");
		return;
	}
%>