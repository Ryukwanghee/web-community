<%@page import="com.community.vo.Comment"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.community.util.Pagination"%>
<%@page import="com.community.dao.CommentDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file= "../../common/logincheck.jsp" %>
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
						<a href="mycomments.jsp" class="list-group-item list-group-item-actio active">내가 작성한 댓글</a>
						<a href="mynotice.jsp" class="list-group-item list-group-item-action">나에게 온 알림</a>
					</div>
				</div>
				<div class="card-body">
					<div class="list-group">
						<a href="passwordform.jsp" class="list-group-item list-group-item-action">비밀번호 변경하기</a>
					</div>
				</div>
			</div>
		</div>
		<div class="col-9">
			<div class="row mb-3">
				<div class="col-12">
					<p>내가 작성한 댓글을 확인하세요</p>
<%
	int empNo = loginUser.getNo();
	int rows = 10;
	int currentPage = StringUtils.stringToInt(request.getParameter("page"), 1);
	
	CommentDao commentDao = CommentDao.getInstance();
	
	int totalRows = commentDao.getTotalRowsByEmpNo(empNo);
	
	Pagination pagination = new Pagination(currentPage, totalRows, rows);
	
	Map<String, Object> param = new HashMap<>();
	param.put("begin", pagination.getBegin());
	param.put("end", pagination.getEnd());
	param.put("empNo", empNo);
	
	List<Comment> comments = commentDao.getCommentsByEmpNo(param);
	
	
%>
					<div class="card">
						<!-- 댓글 반복 시작 -->
<%
	if (comments.isEmpty()) {
%>
  						<p class="card-text">작성한 댓글이 없습니다.</p>
<% 		
	} else {
		for (Comment comment : comments) {
%>
						<div class="card-body py-1 px-3 small border-bottom">
							<div class="mb-1 text-muted text-end">
								<span><span class="me-4"><%=StringUtils.dateToText(comment.getCreatedDate()) %></span> <a href="mycommentDelete.jsp?no=<%=comment.getNo() %>" class="text-danger"><i class="bi bi-trash-fill"></i></a></span>
							</div>
							<p class="card-text"><%=comment.getContent() %></p>
						</div>
						<!-- 댓글 반복 끝 -->
<%
			}
		}	
%>						
					</div>		
				</div>
			</div>	
<%
int beginPage = pagination.getBeginPage();	// 시작페이지 번호
int endPage = pagination.getEndPage();		// 끝페이지 번호
boolean isFirst = pagination.isFirst();		// 첫페이지인지 여부 , 이전 버튼의 비활성화에서 사용
boolean isLast = pagination.isLast();		// 마지막페이지인지 여부. 다음 버튼의 비활성화에서 사용
int prevPage = pagination.getPrevPage();	// 이전 페이지번호, 이전 버튼에서 사용
int nextPage = pagination.getNextPage();	// 다음 페이지번호, 다음 버튼에서 사용
%>
			<div class="row mb-3">
				<div class="col-12">	
					<nav>
						<ul class="pagination pagination-sm justify-content-center">
							<li class="page-item">
								<a class="page-link <%=isFirst ? "disabled" : "" %>" href="mycomments.jsp?page=<%=prevPage %>"
								>이전</a>
							</li>
<%
	for (int number = beginPage; number <= endPage; number++) {
%>
							<li class="page-item">
								<a class="page-link <%=currentPage == number ? "active" : "" %>"  href="mycomments.jsp?page=<%=number %>"
								><%=number %></a></li>
<%
	}
%>
							<li class="page-item">
								<a class="page-link <%=isLast ? "disabled" : "" %>" href="mycomments.jsp?page=<%=nextPage %>"
								>다음</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
//페이지번호를 클릭했을 때 실행되는 이벤트 핸들러 함수다.
function changePage(event, page) {
	event.preventDefault();	// 링크의 기본동작이 일어나지 않게 한다.
	
	submitForm(page);// 폼 입력값을 서버로 제출하는 함수를 실행한다. 
}

// 검색버튼을 클릭했을 때 실행되는 이벤트 핸들러 함수다.
 function submitForm(page) {
	var pageField = document.querySelector("[name=page]");	// <input type="hidden" name="page" /> input 엘리먼트를 조회한다.
	pageField.value = page;									// 위에서 조회한 input 엘리먼트의 값을 변경한다. page 번호가 변경된다.
	
   var form = document.querySelector("form");	// <form /> 엘리먼트를 조회한다.
	form.submit();	// 폼 입력값을 서버로 제출한다. rows, page, keyboard가 한번에 서버로 제출된다.
}
</script>
</body>
</html>