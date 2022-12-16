<%@page import="com.community.vo.PostNotice"%>
<%@page import="com.community.dao.PostNoticeDao"%>
<%@page import="com.community.vo.Notice"%>
<%@page import="com.community.dao.NoticeDao"%>
<%@page import="com.community.dto.FileShareDto"%>
<%@page import="com.community.dao.FileShareDao"%>
<%@page import="com.community.dao.PostDao"%>
<%@page import="com.community.vo.Post"%>
<%@page import="com.community.vo.Comment"%>
<%@page import="com.community.dao.CommentDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%@ include file= "../../common/logincheck.jsp" %>
<%
	// 전달받은 정보를 저장하기
	int postNo = StringUtils.stringToInt(request.getParameter("postNo"));
	String content = request.getParameter("content");
	int empNo = loginUser.getNo();
	
	// 정보를 저장할 객체를 생성하기
	CommentDao commentDao = new CommentDao();
	Comment comment = new Comment();
	// 생성된 객체에 전달받은 정보를 대입하기
	comment.setPostNo(postNo);
	comment.setContent(content);
	comment.setEmpNo(empNo);
	// 정보가 저장된 댓글을 추가하기
	commentDao.addComment(comment);
	
	// 저장할 알림 정보 객체 생성하기
	PostNoticeDao postNoticeDao = new PostNoticeDao();
	PostNotice postNotice = new PostNotice();
	
	postNotice.setPostNo(postNo);
	postNotice.setSendEmpNo(empNo);
	// 수신자 직원번호 조회 -> 게시글 번호로 해당하는 게시글 조회 -> 게시글의 직원번호 획득 후 수신하는 직원 번호에 대입
	FileShareDao fileShareDao = new FileShareDao();
	FileShareDto dto = fileShareDao.getPostByNo(postNo);
	postNotice.setReceiveEmpNo(dto.getWriterNo());
	
	// 알림 정보 추가
	postNoticeDao.addNotice(postNotice);
	
	postNotice.setContent(content);
	
	postNoticeDao.updateNotice(postNotice);
	
	// post 번호로 게시글 정보를 불러와 댓글 개수를 1 증가시킨후 업데이트하기
	PostDao postDao = new PostDao();
	Post post = postDao.getPostByNo(postNo);
	post.setCommentCount(post.getCommentCount() + 1);
	postDao.updatePost(post);
	// 재응답 url로 게시글 번호에 맞는 상세페이지로 보내기
	response.sendRedirect("detail.jsp?no=" + postNo);
%>
