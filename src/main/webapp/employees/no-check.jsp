<%@page import="com.community.vo.Employees"%>
<%@page import="com.community.dao.EmployeesDao"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8" 
pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%
int no = Integer.parseInt(request.getParameter("no"));

EmployeesDao employeesDao = EmployeesDao.getInstance();
Employees employees =employeesDao.getUserByNo(no);

if (employees == null) {
	out.write("notExist");
} else {
	out.write("exist");
}
%>