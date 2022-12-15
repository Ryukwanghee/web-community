<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%@ include file= "../../common/logincheck.jsp" %>
<%
	String password = request.getParameter("password");
	
	if (loginUser.getPassword().equals(password)) {
		out.write("samePassword");
	} else if (!loginUser.getPassword().equals(password)) {
		out.write("NotSamePassword");
	}
%>