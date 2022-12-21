<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.dao.EmployeeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%@ include file= "../../common/logincheck.jsp" %>
<%
	String prevPassword = request.getParameter("prevPassword");
	String password = request.getParameter("password");
	int no = loginUser.getNo();
	
	if (!loginUser.getPassword().equals(prevPassword)) {
		response.sendRedirect("passwordform.jsp?error=fail");
		return;
	}

	EmployeeDao employeeDao = EmployeeDao.getInstance();
	
	Employee employee = employeeDao.getEmployeeByNo(no);
	
	employee.setPassword(password);
	
	employeeDao.changePassword(employee);
	
	response.sendRedirect("home.jsp");
%>