<%@page import="com.community.vo.Comment"%>
<%@page import="com.community.vo.Question"%>
<%@page import="com.community.dao.QuestionDao"%>
<%@page import="com.community.dao.CommentDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%
	
	// 게시글 번호와 댓글번호를 조회한다.
	int postNo = StringUtils.stringToInt(request.getParameter("postNo"));
	int commentNo = StringUtils.stringToInt(request.getParameter("commentNo"));
	
	// CommentDao객체 생성해서, deleteComment(int commentNo)를 실행해서 댓글을 삭제한다.
	CommentDao commentDao = new CommentDao();
	
	Comment comment = commentDao.getCommentByCommentNo(commentNo);	//<<<<< 새로 추가한 코드>>>>
	//   commentDao.deleteComment(commentNo); -> 기존에 있던 코드
	
	comment.setDeleted("Y");				//<<<<< 새로 추가한 코드>>>>
	commentDao.deleteComment(comment);		//<<<<< 새로 추가한 코드>>>>
	
	// QuestionDao객체 생성해서, getQuestionByNo(int questionNo)를 실행해서 게시글정보 조회한다.
	QuestionDao questionDao = new QuestionDao();
	Question question= questionDao.getQuestionByNo(postNo);
	
	// 게시글정보의 댓글갯수를 1감소시킨다.
	question.setCommentCount(question.getCommentCount() - 1);
	
	// 변경된 게시글 정보를 updateQuestion(Question question)를 실행해서 반영시킨다.
	questionDao.updateQuestion(question);
	
	// 재요청 URL을 응답으로 보낸다.
	response.sendRedirect("detail.jsp?no=" + postNo);
	


%>
