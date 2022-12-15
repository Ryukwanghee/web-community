<%@page import="com.community.vo.Employees"%>
<%@page import="com.community.dao.EmployeesDao"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8" 
pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%
String email = request.getParameter("email");

EmployeesDao employeesDao = EmployeesDao.getInstance();
Employees employees =employeesDao.getUserByEmail(email);

if (employees == null) {
	out.write("notExist");
} else {
	out.write("exist");
}
%>