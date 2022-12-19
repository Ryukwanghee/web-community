<%@page import="com.community.dto.EmployeeDto"%>
<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.vo.Question"%>
<%@page import="com.community.dao.QuestionDao"%>
<%@page import="com.community.dao.CommentDao"%>
<%@page import="com.community.vo.Comment"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%
EmployeeDto employee = (EmployeeDto) session.getAttribute("loginedUser");
	
	if (employee == null ) {
		response.sendRedirect("/web-community/employees/loginform.jsp?error=deny");
		return;
	}
	// 게시글 번호, 내용 조회
	int postNo = StringUtils.stringToInt(request.getParameter("postNo"));
	String content = request.getParameter("content"); 
	
	// Comment객체를 생성, 댓글 정보 저장
	Comment comment = new Comment();
	comment.setPostNo(postNo);
	comment.setEmpNo(employee.getNo());
	comment.setContent(content);
	
    // CommentDao객체를 생성하고, insertComment(Comment comment)를 실행해서 댓글 등록
	CommentDao commentDao = CommentDao.getInstance();
	commentDao.addComment(comment);
	
	// QuestionDao객체 생성하고, getQuestionByNo게시글정보 조회
	QuestionDao questionDao = new QuestionDao();
	Question question= questionDao.getQuestionByNo(postNo);
	
	// 조회된 게시글정보의 댓글갯수 1증가
	question.setCommentCount(question.getCommentCount() + 1);
	
	questionDao.updateQuestion(question);
	
	// 추가작업 수행으로 재요청URL 서버로 제출
	response.sendRedirect("detail.jsp?no=" + postNo);
	
	 
%>