<%@page import="com.community.dto.ReviewDto"%>
<%@page import="com.community.util.Pagination"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.vo.Comment"%>
<%@page import="java.util.List"%>
<%@page import="com.community.dao.CommentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<link href="/web-community/resources/css/style.css" rel="stylesheet">
<title>사내 커뮤니티</title>
</head>
<body>
<jsp:include page="../common/header.jsp">
	<jsp:param name="menu" value="admin"/>
</jsp:include>
<div class="container my-3">
	<div class="row mb-3">
		<div class="col">
			<h1 class="heading">내 정보 보기</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-3">
			<div class="card">
				<div class="card-header">나의 메뉴</div>
				<div class="card-body">
					<div class="list-group">
						<a href="home.jsp" class="list-group-item list-group-item-action">내 정보 보기</a>
						<a href="myposts.jsp" class="list-group-item list-group-item-action">내가 작성한 게시글</a>
						<a href="mycomments.jsp" class="list-group-item list-group-item-action active">내가 작성한 댓글</a>
						<a href="mynotice.jsp" class="list-group-item list-group-item-action">나에게 온 알림</a>
					</div>
				</div>
				<div class="card-body">
					<div class="list-group">
						<a href="passwordForm.jsp" class="list-group-item list-group-item-action">비밀번호 변경하기</a>
					</div>
				</div>
			</div>
		</div>
<%
	int currentPage = StringUtils.stringToInt(request.getParameter("page"), 1);

	CommentDao commentDao = CommentDao.getInstance();
	Map<String, Object> param = new HashMap<>();
	
	int totalRows = commentDao.getCommentCountByEmpNo(loginUser.getNo());
	
	Pagination pagination = new Pagination(currentPage, totalRows, 5, 5);
	
	param.put("empNo", loginUser.getNo());
	param.put("begin", pagination.getBegin());
	param.put("end", pagination.getEnd());
	
	List<Comment> commentList = commentDao.getComments(param);
	
%>	
		<div class="col-9">
			<div class="row mb-3">
				<div class="col-12">
					<p>내가 작성한 댓글을 확인하세요</p>
<%
	for (Comment comment : commentList) {
%>
					<div class="card">
						<div class="card-body py-1 px-3 small border-bottom">
							<div class="mb-1 text-muted text-end">
								<span><span class="me-4"><%=StringUtils.dateToText(comment.getCreatedDate()) %></span> <a href="delete.jsp?commentNo=<%=comment.getNo() %>" class="text-danger"><i class="bi bi-trash-fill"></i></a></span>
							</div>
							<p class="card-text"><%=comment.getContent() %></p>
						</div>
					</div>	
<%
	}
%>	
				</div>
			</div>	
<%
	if (totalRows >= 1) {
%>
			<div class="row mb-3">
				<div class="col-12">	
					<nav>
						<ul class="pagination pagination-sm justify-content-center">
							<li class="page-item">
								<a class="page-link <%=pagination.isFirst() ? "disabled" : ""%>" href="mycomments.jsp?page=<%=pagination.getPrevPage() %>">이전</a>
							</li>
<%
	for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++){
%>		
							
							<li class="page-item"><a class="page-link <%=num == currentPage ? "active" : "" %>" href="mycomments.jsp?page=<%=num%>"><%=num %></a></li>
							
<%
	}
%>			
							
							<li class="page-item">
								<a class="page-link <%=pagination.isLast() ? "disabled" : ""%>" href="mycomments.jsp?page=<%=pagination.getNextPage() %>">다음</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
<%
	}
%>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>