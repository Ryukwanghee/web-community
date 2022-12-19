<%@page import="com.community.vo.Post"%>
<%@page import="com.community.dao.PostDao"%>
<%@page import="com.community.vo.Suggestion"%>
<%@page import="java.util.List"%>
<%@page import="com.community.dao.SuggestionDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/plane; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file= "../../common/logincheck.jsp" %>
<%
	int postNo = StringUtils.stringToInt(request.getParameter("no"));
	int empNo = loginUser.getNo();

	SuggestionDao suggestionDao = SuggestionDao.getInstance();
	List<Suggestion> suggestions = suggestionDao.getSuggestionsByEmpNo(empNo);
	for (Suggestion sgt : suggestions) {
		if (sgt.getPostNo() == postNo) {
			out.write("exist");
			return;
		}
	}
%>