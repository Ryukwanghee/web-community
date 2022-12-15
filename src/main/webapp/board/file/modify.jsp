<%@page import="com.community.dao.PostDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.vo.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "../../common/logincheck.jsp" %>
<%
	// 모달 수정 폼에서 데이터 전달받기
	int boardNo = StringUtils.stringToInt(request.getParameter("boardNo"));
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String important = request.getParameter("important");
	String content = request.getParameter("content");
	int no = StringUtils.stringToInt(request.getParameter("postNo"));
	
	// post 번호로 게시글 정보를 가진 객체를 생성한다.
	PostDao postDao = new PostDao();
	Post post = postDao.getPostByNo(no);
	// 객체 정보 변경
	post.setBoardNo(boardNo);
	post.setTitle(title);
	post.setImportant(important);
	post.setContent(content);
	// 변경된 객체를 업데이트
	postDao.updatePost(post);
	// 재응답 url을 보내 리스트로 이동하게한다.
	response.sendRedirect("list.jsp");
%>