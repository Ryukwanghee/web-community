
<%@page import="com.community.vo.Employees"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.dao.NoticeDao"%>
<%@page import="com.community.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	Employees loginEmployees = (Employees) session.getAttribute("loginedEmployees");
	if (loginEmployees == null) {
		response.sendRedirect("/web-community/employees/loginform.jsp?error=deny");
		return;
	}
	
	// 요청 객체에 저장된 요청파라미터값을 가져온다.
	int boardNo = StringUtils.stringToInt(request.getParameter("boardNo"));
	String title = request.getParameter("title");
	String important = request.getParameter("important");
	String content = request.getParameter("content");
	
	// 조회된 요청파라미터값을 Notice객체에 저장한다.
	Notice notice = new Notice();
	notice.setBoardNo(boardNo);
	notice.setTitle(title);
	notice.setContent(content);
	notice.setWriterNo(loginEmployees.getNo());
	notice.setImportant(important);
	
	// NoticeDao 객체를 생성하고, insertBoard(Board board) 메소드를 실행해서 게시글 정보를 저장시킨다.
	NoticeDao noticeDao = new NoticeDao();
	noticeDao.insertNotice(notice);
	
	// 저장/변경/삭제 작업중에서 저장작업을 수행하였음으로 재요청 URL을 전송한다.
	response.sendRedirect("list.jsp");
%>