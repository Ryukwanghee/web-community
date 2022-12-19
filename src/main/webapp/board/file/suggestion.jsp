<%@page import="com.community.dao.PostNoticeDao"%>
<%@page import="com.community.vo.PostNotice"%>
<%@page import="java.util.List"%>
<%@page import="com.community.vo.Post"%>
<%@page import="com.community.dao.PostDao"%>
<%@page import="com.community.dto.FileShareDto"%>
<%@page import="com.community.dao.FileShareDao"%>
<%@page import="com.community.dao.NoticeDao"%>
<%@page import="com.community.vo.Notice"%>
<%@page import="com.community.dao.SuggestionDao"%>
<%@page import="com.community.vo.Suggestion"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<%@ include file= "../../common/logincheck.jsp" %>
<%
	// 추천정보 생성에 필요한 값 조회하기
	int postNo = StringUtils.stringToInt(request.getParameter("no"));
	int empNo = loginUser.getNo();
	
	PostDao postDao = new PostDao();
	Post post = postDao.getPostByNo(postNo);
	
	// 글 작성자의 사원번호와 로그인한 사원번호가 일치하면 상세페이지로 이동
	if (post.getWriterNo() == empNo) {
		post.setReadCount(post.getReadCount() - 1);
		response.sendRedirect("detail.jsp?no=" + postNo);
		postDao.updatePost(post);
		return;
	}
	SuggestionDao suggestionDao = SuggestionDao.getInstance();
	List<Suggestion> suggestions = suggestionDao.getSuggestionsByEmpNo(empNo);
	for (Suggestion sgt : suggestions) {
		if (sgt.getPostNo() == postNo) {
			post.setReadCount(post.getReadCount() - 1);
			
			postDao.updatePost(post);
			response.sendRedirect("detail.jsp?no=" + postNo);
			return;
		}
	}
		
	// 추천정보를 저장할 객체 생성하기
	Suggestion suggestion = new Suggestion();
	// 객체에 값 저장하기
	suggestion.setPostNo(postNo);
	suggestion.setEmpNo(empNo);
	// 저장된 값을 가진 추천정보 생성하기
	suggestionDao.addSuggestion(suggestion);
	
	// 알림정보 추가하기
	PostNotice notice = new PostNotice();
	PostNoticeDao noticeDao = PostNoticeDao.getInstance();
	
	notice.setPostNo(postNo);
	notice.setSendEmpNo(empNo);
	
	// 수신자 직원번호 조회 -> 게시글 번호로 해당하는 게시글 조회 -> 게시글의 직원번호 획득 후 수신하는 직원 번호에 대입
	notice.setReceiveEmpNo(post.getWriterNo());
	
	// 알림 정보 추가
	noticeDao.addNotice(notice);
	
	// 추천정보 1 증가시키기
	post.setSuggestionCount(post.getSuggestionCount() + 1);
	
	postDao.updatePost(post);
	
	// 재응답 url로 게시글 번호에 맞는 상세페이지로 보내기
	response.sendRedirect("detail.jsp?no=" + postNo);
%>