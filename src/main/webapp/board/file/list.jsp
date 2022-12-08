<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.vo.Employee"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.community.dao.PostDao"%>
<%@page import="com.community.vo.Post"%>
<%@page import="com.community.dao.FileShareDao"%>
<%@page import="java.util.List"%>
<%@page import="com.community.vo.FileShare"%>
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
<jsp:include page="../../common/header.jsp">
	<jsp:param name="menu" value="board"/>
</jsp:include>
<div class="container my-3">
	<div class="row mb-3">
		<div class="col">
			<h1 class="heading">파일 게시판</h1>
		</div>
		<%
			Employee employee = (Employee) session.getAttribute("loginedUser");
	
			if (employee == null) {
			response.sendRedirect("loginform.jsp?error=deny");
			return;
			}
			// 페이징 처리하기
			
			int rows = StringUtils.stringToInt(request.getParameter("rows"), 10);
		
			int currentPage = StringUtils.stringToInt(request.getParameter("page"), 1);
			
			
			int begin = (currentPage - 1)*rows + 1;
			int end = currentPage*rows;
			
			Map<String, Object> param = new HashMap<>();
			param.put("begin", begin);
			param.put("end", end);		
			
			FileShareDao fileShareDao = new FileShareDao();
			List<Post> posts = fileShareDao.getFileShares(param);
		%>
	</div>
	<div class="row mb-3">
		<div class="col-3">
			<div class="card">
				<div class="card-header">전체 게시판 목록</div>
				<div class="card-body">
					<div class="d-grid gap-2">
						<button class="btn btn-dark btn-sm mb-3" data-bs-toggle="modal" data-bs-target="#modal-form-posts">파일 등록</button>
					</div>
					<jsp:include page="../../common/tree.jsp" />
				</div>
			</div>
		</div>
		<div class="col-9">
			<div class="card">
				<div class="card-header">파일 목록</div>
				<div class="card-body">
					<form class="mb-3" method="get" action="list.jsp">
						<div class="mb-2 d-flex justify-content-between">
							<div>
								<select class="form-select form-select-xs" id="rows" onchange="changeRows(event)">
									<option value="10"> 10</option>
									<option value="15"> 15</option>
									<option value="20"> 20</option>
								</select>
							</div>
							<div>
								<select class="form-select form-select-xs">
									<option value="10"> 제목</option>
									<option value="10"> 작성자</option>
									<option value="10"> </option>
								</select>
								<input type="text" class="form-control form-control-xs w-150">
								<input type="hidden" name="page" value="<%=currentPage %>" />
								<button type="button" class="btn btn-outline-secondary btn-xs">검색</button>
							</div>
						</div>
						<table class="table table-sm border-top">
							<colgroup>
								<col width="3%">
								<col width="9%">
								<col width="7%">
								<col width="*">
								<col width="10%">
								<col width="12%">
								<col width="7%">
							</colgroup>
							<thead>
								<tr class="bg-light">
									<th><input type="checkbox"></th>
									<th>번호</th>
									<th><i class="bi bi-paperclip"></i></th>
									<th>제목</th>
									<th>작성자</th>
									<th>등록일</th>
									<th>조회</th>
								</tr>
							</thead>
<%
	List<Post> postList = fileShareDao.getFileShares(param);

	if (postList.isEmpty()) {
%>
			<tr><td class="text-center" colspan="6"> 게시글 정보가 없습니다. </td></tr>
<%
	} else {
		for (Post post : postList) {
			Employee emp = fileShareDao.getEmployeeByNo(post.getWriterNo());
			
%>
							<tbody>
								<tr>
									<td><input type="checkbox" name="" value=""/></td>
									<td><%=post.getNo() %></td>
									<td><a href="download"><i class="bi bi-paperclip"></i></a></td>
									<td><a href="detail.jsp?no=<%=post.getNo() %>" class="text-decoration-none text-dark"><%=post.getTitle() %></a></td>
									<td><%=emp.getName() %></td>
									<td><%=StringUtils.dateToText(post.getCreatedDate()) %></td>
									<td><%=post.getReadCount() %></td>
								</tr>
							</tbody>
<%
	}}
%>
						</table>
					</form>
					<nav>
<%
	int totalRows = fileShareDao.getTotalRows();
	int totalPages = (int)Math.ceil((double)totalRows/rows);
%>
						<ul class="pagination pagination-sm justify-content-center">
							<li class="page-item <%=currentPage == 1 ? "disabled" : "" %>">
								<a class="page-link" href="list.jsp?page=<%=currentPage - 1 %>">이전</a>
							</li>
<%
	for(int number = 1; number <= totalPages; number++) {
%>
				<li class="page-item"><a class="page-link <%=currentPage == number ? "active" : "" %>" href="list.jsp?page=<%=number %>"><%=number %></a></li>
<%
	}
%>
				<li class="page-item <%=currentPage >= totalPages ? "disabled" : "" %>">
					<a class="page-link" href="list.jsp?page=<%=currentPage + 1 %>">다음</a>
				</li>
						</ul>
					</nav>
					<div class="text-end">
						<button class="btn btn-dark btn-xs" data-bs-toggle="modal" data-bs-target="#modal-form-posts">등록</button>
						<button class="btn btn-outline-dark btn-xs">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../../common/modal-form-posts.jsp">
	<jsp:param name="boardNo" value="101"/>
</jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
function changeRows(event) {
	event.preventDefault();	// 링크의 기본동작이 일어나지 않게 한다.
	var rowsField = document.getElementById("rows");	
	rows = rowsField.value;		
	
	submitForm(1);	// 폼 입력값을 서버로 제출하는 함수를 실행한다. 한번에 표시할 행의 갯수를 변경했기 때문에 페이지번호는 1이 되어야 한다.
}

// 페이지번호를 클릭했을 때 실행되는 이벤트 핸들러 함수다.
function changePage(event, page) {
	event.preventDefault();	// 링크의 기본동작이 일어나지 않게 한다.
	
	submitForm(page);// 폼 입력값을 서버로 제출하는 함수를 실행한다. 
}

// 검색버튼을 클릭했을 때 실행되는 이벤트 핸들러 함수다.
function submitForm(page) {
	var pageField = document.querySelector("[name=page]");	// <input type="hidden" name="page" /> input 엘리먼트를 조회한다.
	pageField.value = page;									// 위에서 조회한 input 엘리먼트의 값을 변경한다. page 번호가 변경된다.
}
</script>
</body>
</html>