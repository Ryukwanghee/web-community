<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	// 로그아웃은 기존 세션객체를 무효화시킨다.
	session.invalidate();

	// 재요청 URL을 응답으로 보낸다.

	session.invalidate();


	response.sendRedirect("../home.jsp");
%>