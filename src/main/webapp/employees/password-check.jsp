<%@ page language="java" contentType="text/plane; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file= "../../common/logincheck.jsp" %>
<%
	String password = request.getParameter("password");

	System.out.println("[" + password + "]");
	
	System.out.println("[" + loginUser.getPassword() + "]");
	
	if (loginUser.getPassword().equals(password)) {
		out.write("samePassword");
	} else if (!loginUser.getPassword().equals(password)) {
		out.write("NotSamePassword");
	}
%>