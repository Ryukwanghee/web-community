<%@page import="com.community.vo.Post"%>
<%@page import="com.community.dao.PostDao"%>
<%@page import="com.community.dao.CommentDao"%>
<%@page import="com.community.vo.Comment"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%@ include file= "../../common/logincheck.jsp" %>
<%
	// commentNo와 postNo 전달받기.
	int no = StringUtils.stringToInt(request.getParameter("commentNo"));
	int postNo = StringUtils.stringToInt(request.getParameter("postNo"));
	
	CommentDao commentDao = CommentDao.getInstance();
	Comment comment = commentDao.getCommentBycommentNo(no);
	
	// 삭제여부를 'Y'로 변경후 업데이트 반영
	comment.setDeleted("Y");
	commentDao.deleteComment(comment);
	
	// post 번호로 게시글 정보를 불러와 댓글 개수를 1 감소시킨후 업데이트하기
	PostDao postDao = new PostDao();
	Post post = postDao.getPostByNo(postNo);
	post.setCommentCount(post.getCommentCount() - 1);
	postDao.updatePost(post);
	// 재응답 URL로 상세페이지로 반환.
	response.sendRedirect("detail.jsp?no=" + postNo);
%>