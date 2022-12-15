<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.dao.EmployeeDao"%>
<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	String password = request.getParameter("password");
	
	EmployeeDao employeeDao = EmployeeDao.getInstance();
	
	Employee savedEmployee = employeeDao.getEmployeeByNo(no);
	
	if (savedEmployee == null){
		response.sendRedirect("loginform.jsp?error=fail");
		return;
	}

	if (!savedEmployee.getPassword().equals(password)){
		response.sendRedirect("loginform.jsp?error=fail");
		return;
	}

	session.setAttribute("loginedEmployee", savedEmployee);

	response.sendRedirect("../home.jsp");
%>