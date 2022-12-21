<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.dto.EmployeeDto"%>
<%@page import="com.community.util.Pagination"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.community.dao.CommentDao"%>
<%@page import="com.community.vo.Comment"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<jsp:include page="../common/logincheck.jsp">
	<jsp:param name="my" value="comments"/>
</jsp:include>
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
						<a href="mycomments.jsp" class="list-group-item list-group-item-action">내가 작성한 댓글</a>
						<a href="mynotice.jsp" class="list-group-item list-group-item-action">나에게 온 알림</a>
					</div>
				</div>
				<div class="card-body">
					<div class="list-group">
						<a href="passwordform.jsp" class="list-group-item list-group-item-action active">비밀번호 변경하기</a>
					</div>
				</div>
			</div>
		</div>
		<div class="col-9">
			<div class="row mb-3">
				<div class="col-12">
					<p>내가 작성한 댓글을 확인하세요</p>
					<div class="card">
						<!-- 댓글 반복 시작 -->
<%
	//employee객체 갖고오기
	EmployeeDto employee = (EmployeeDto) session.getAttribute("loginedUser");
	int empNo = employee.getNo();
	
	//param에 담아야할 값 구하기
	CommentDao commentDao = CommentDao.getInstance();
	int totalRows = commentDao.getCommentsCountByEmpNo(empNo);
	
	//페이지네이션
	int currentPage = StringUtils.stringToInt(request.getParameter("page"), 1);
	Pagination pagination = new Pagination(currentPage, totalRows);
				
	
	Map<String, Object> param = new HashMap<>();
	param.put("empNo", empNo);
	param.put("begin", pagination.getBegin());  
	param.put("end", pagination.getEnd());
	
	List<Comment> commentList = commentDao.getmyComments(param);
	if(commentList.isEmpty()){
%>		
	<div class="card-body py-1 px-3 small border-bottom">
							<div class="mb-1 text-muted text-end">
								<span><span class="me-4"></span> <a href="" class="text-danger"><i class="bi bi-trash-fill"></i></a></span>
							</div>
							<p class="card-text">등록된 댓글이 없습니다.</p>
						</div>	
<%
	}else{
		for(Comment comment : commentList){
%>
						<div class="card-body py-1 px-3 small border-bottom">
							<div class="mb-1 text-muted text-end">
								<span><span class="me-4"><%=StringUtils.dateToText(comment.getCreatedDate()) %></span> <a href="deleteComment.jsp?commentNo=<%=comment.getNo()%>"
								 class="text-danger"><i class="bi bi-trash-fill"></i></a></span>
							</div>
							<p class="card-text"><%=comment.getContent() %></p>
						</div>
<%
		}
	}
%>
						<!-- 댓글 반복 끝 -->
					</div>
				</div>
			</div>	
<%
	if(!commentList.isEmpty()){
		int beginPage = pagination.getBeginPage();
		int endPage = pagination.getEndPage();
		boolean isFirst = pagination.isFirst();
		boolean isLast = pagination.isLast();
		int nextPage = pagination.getNextPage();
		int prevPage = pagination.getPrevPage();
%>
		<form>
			<div class="row mb-3">
				<div class="col-12">	
					<nav>
						<ul class="pagination pagination-sm justify-content-center">
							<li class="page-item <%=isFirst ? "disabled" : "" %>">
								<a href="mycomments.jsp?page=<%=prevPage %>" 
								class="page-link"
								id="prevPage">이전</a>
							</li>
<%
	for(int no = beginPage; no <= endPage; no++){
%>
							<li class="page-item"><a class="page-link <%=currentPage == no ? "active" : "" %>"  
							href="mycomments.jsp?page=<%=no %>"><%=no %></a></li>
<%
	}
%>
							<li class="page-item">
								<a class="page-link <%=isLast ? "disabled" : "" %> " 
								href="mycomments.jsp?page=<%=nextPage %>"
								onclick="changePage(event, <%=nextPage %>)">다음</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
<%
	}
%>
		</form>

		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>