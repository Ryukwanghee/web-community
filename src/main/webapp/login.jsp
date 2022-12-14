<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.dao.EmployeeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	EmployeeDao employeeDao = EmployeeDao.getInstance();
	
	Employee savedEmployee = employeeDao.getEmployeeByEmail(email);
	
	if(savedEmployee == null){
		response.sendRedirect("login.jsp?error=fail");
		return;
	}
	
	//비밀번호 암호화하기~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	
	if(!savedEmployee.getPassword().equals(password)){
		response.sendRedirect("login.jsp?error=fail");	
		return;
	}
	
	session.setAttribute("loginedEmployee", savedEmployee);
	
	response.sendRedirect("home.jsp");
%>