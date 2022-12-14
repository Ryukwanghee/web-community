<%@page import="com.community.vo.Free"%>
<%@page import="com.community.dao.FreeDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.dto.CommentDto"%>
<%@page import="com.community.dao.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	//댓글추가하기
	Employee loginedEmployee = (Employee)session.getAttribute("loginedEmployee");
	//일단 null이면 돌려보내기
	if(loginedEmployee.equals(null)){
		response.sendRedirect("loginForm.jsp?error=deny");
		return;
	}
	//댓글내용 불러오고 저장시키기.
	int empNo = loginedEmployee.getNo();
	String content = (String)request.getParameter("content");
	int postNo = StringUtils.stringToInt(request.getParameter("postNo"));
	
	CommentDto commentDto = new CommentDto();
	commentDto.setCommentEmpNo(empNo);
	commentDto.setCommentContent(content);
	commentDto.setCommentPostNo(postNo);
			
	CommentDao commentDao = CommentDao.getInstance();
	commentDao.insertComment(commentDto);
	
	//댓글수1증가시키기
	FreeDao freeDao = FreeDao.getInstance();
	Free free = (Free)freeDao.getFreeByNo(postNo);
	free.setCommentCount(free.getCommentCount() + 1);
	freeDao.updateFree(free);
	
	response.sendRedirect("detail.jsp?no=" + postNo);
%>