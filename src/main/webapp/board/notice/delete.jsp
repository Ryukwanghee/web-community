<%@page import="com.community.vo.Notice"%>
<%@page import="com.community.dao.NoticeDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%
	// 게시글번호를 조회한다.
	int postNo = StringUtils.stringToInt(request.getParameter("postNo"));

	// NoticeDao 생성하고 getNoticeByNo를 실행
	NoticeDao noticeDao = new NoticeDao();
	Notice notice = noticeDao.getNoticeByNo(postNo);
	
	// 게시글정보의 삭제여부를 Y로 변경하고 테이블에 반영
	// NoticeDao 객체의 updateNotice를 실행해서 저장시킨다.
	notice.setDeleted("Y");
	noticeDao.updateNotice(notice);
	
	// 추가/변경/삭제 작업중에서 삭제작업을 수행하고 재요청URL
	response.sendRedirect("list.jsp");
%>