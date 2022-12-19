<%@page import="com.community.dto.EmployeeDto"%>
<%@page import="com.community.dao.DetailDao"%>
<%@page import="com.community.vo.Free"%>
<%@page import="com.community.dao.FreeDao"%>
<%@page import="com.community.vo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	EmployeeDto employee =  (EmployeeDto)session.getAttribute("loginedUser");
	
	if(employee.equals(null)){
		response.sendRedirect("/login.jsp?error=deny");
		return;
	}
	//parameter값 가져오기.
	int postNo = Integer.parseInt(request.getParameter("postNo"));
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	String title = request.getParameter("title");
	String name = request.getParameter("name");
	String important = request.getParameter("important");
	String content = request.getParameter("content");
	//직원번호가 없어서 가져오기.
	DetailDao detailDao = DetailDao.getInstance();
	int writerNo = detailDao.getDetailByNo(postNo).getPostWriterNo();
	
	Free free = new Free();
	free.setNo(postNo);
	free.setBoardNo(boardNo);
	free.setTitle(title);
	free.setWriterNo(writerNo);
	free.setImportant(important);
	free.setContent(content);
	
	FreeDao freeDao = FreeDao.getInstance();
	freeDao.updateFree(free);
	
	response.sendRedirect("detail.jsp?no=" + postNo);
	
%>