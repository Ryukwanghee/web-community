<%@page import="com.community.dto.EmployeeDto"%>
<%@page import="java.util.Date"%>
<%@page import="com.community.vo.Free"%>
<%@page import="com.community.dao.FreeDao"%>
<%@page import="com.community.dto.DetailDto"%>
<%@page import="com.community.dao.DetailDao"%>
<%@page import="com.community.vo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	EmployeeDto employee = (EmployeeDto)session.getAttribute("loginedUser");

	if(employee.equals(null)){
		response.sendRedirect("/loginForm.jsp?error=deny");
		return;
	}
	
	String[] postNoList =  request.getParameterValues("no");
	
	FreeDao freeDao = FreeDao.getInstance();
	
	//parameterValues들을 하나씩 꺼내서.
	for(String x : postNoList){
		int postNo = Integer.parseInt(x);
		
		//번호에 맞는 free객체 가져오기.
		Free free = freeDao.getFreeByNo(postNo);
		
		//로그인한 아이디와 작성자가 맞나 확인하기
		if(employee.getNo() != free.getWriterNo()){
			response.sendRedirect("/loginForm.jsp?error=deny");
			return;
		}
		
		free.setDeleted("D");
		free.setDeletedDate(new Date());
		freeDao.updateFree(free);
	}
	
	response.sendRedirect("list.jsp");
	
	
	
	
%>