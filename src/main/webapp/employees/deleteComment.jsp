<%@page import="com.community.vo.Post"%>
<%@page import="com.community.dao.PostDao"%>
<%@page import="com.community.dto.EmployeeDto"%>
<%@page import="com.community.vo.Comment"%>
<%@page import="com.community.vo.Free"%>
<%@page import="com.community.dao.FreeDao"%>
<%@page import="java.util.Date"%>
<%@page import="com.community.dto.CommentDto"%>
<%@page import="com.community.dao.CommentDao"%>
<%@page import="com.community.vo.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	//일단 로그인확인하기
	EmployeeDto loginedEmployee = (EmployeeDto)session.getAttribute("loginedUser");
	if(loginedEmployee == null){
		response.sendRedirect("list.jsp");
		return;
	}
	
	//commentNo로 해당하는 Comment객체를 가져오기
	int commentNo = Integer.parseInt(request.getParameter("commentNo"));
	CommentDao commentDao = CommentDao.getInstance();
	Comment comment = commentDao.getCommentBycommentNo(commentNo);
	
	if(comment.getEmpNo() == loginedEmployee.getNo()){
		//댓글을 삭제하면 댓글정보의 삭제여부를 'Y'로 변경한다.
		comment.setDeleted("Y");
		comment.setUpdatedDate(new Date());
		comment.setDeletedDate(new Date());
		commentDao.updateComment(comment);
		
		//해당 댓글의 게시글정보에서 댓글 갯수를 1감소시킨다.
		//FreeDao로 Free객체가져와서 -1시키고 업데이트시키기.
		PostDao postDao = new PostDao();
		Post post = (Post)postDao.getPostByNo(comment.getPostNo());
		post.setCommentCount(post.getCommentCount() - 1);
		postDao.updatePost(post);
		
		response.sendRedirect("mycomments.jsp");
		
	}
	else{
		response.sendRedirect("mycomments.jsp");
		return;
	}
%>