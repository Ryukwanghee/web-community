<%@page import="com.community.vo.Free"%>
<%@page import="com.community.dao.FreeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	
	int postNo =Integer.parseInt(request.getParameter("no"));
	FreeDao freeDao = FreeDao.getInstance();
	Free free = (Free) freeDao.getFreeByNo(postNo);
	
	free.setSuggestionCount(free.getSuggestionCount() + 1);
	//추천누를때 조회수도 같이 늘어나니까 하나 줄여주자
	free.setReadCount(free.getReadCount() - 1);
	
	//업데이트하기
	freeDao.updateFree(free);
	
	
	response.sendRedirect("detail.jsp?no="+postNo);
%>