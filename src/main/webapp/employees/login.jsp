<%@page import="com.community.dto.EmployeeDto"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.dao.EmployeeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	EmployeeDao employeeDao = new EmployeeDao();
	
	EmployeeDto savedUser = employeeDao.getEmployeeByEmail(email);
	
	if (savedUser == null) {
		response.sendRedirect("loginform.jsp?error=fail");
		return;
	}
	
	if (!savedUser.getPassword().equals(password)){
		response.sendRedirect("loginform.jsp?error=fail");
		return;
	}
	
	session.setAttribute("loginedUser", savedUser);
	
	response.sendRedirect("../home.jsp");
%>