<%@page import="com.community.util.Pagination"%>
<%@page import="com.community.dto.FileShareDto"%>
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
<%@ include file= "../../common/logincheck.jsp" %>
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
	// 페이징 처리하기
	// 행 개수, 요청한 페이지번호, 검색 옵션, 검색 키워드를 조회하기. 값이 없으면 기본값 설정.
	int rows = StringUtils.stringToInt(request.getParameter("rows"), 10 );
	int currentPage = StringUtils.stringToInt(request.getParameter("page"), 1);
	String opt = StringUtils.nullToValue(request.getParameter("opt"), "title");
	String keyword = StringUtils.nullToValue(request.getParameter("keyword"), "");
	
	FileShareDao fileShareDao = new FileShareDao();
	
	Map<String, Object> param = new HashMap<>();
	if (!opt.isEmpty() && !keyword.isEmpty()){
		param.put("opt", opt);		
		param.put("keyword", keyword);
	}
	
	// 게시글 개수 조회
	int totalRows = fileShareDao.getTotalRows(param); 
	
	// Pagination 객체 생성
	Pagination pagination = new Pagination(currentPage, totalRows, rows);
	
	param.put("begin", pagination.getBegin());
	param.put("end", pagination.getEnd());		
	
	List<FileShareDto> posts = fileShareDao.getFileShares(param);
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
						<input type="hidden" name="page" value="<%=currentPage %>" />
						<input type="hidden" name="rows" value="<%=rows %>" />	
						<div class="mb-2 d-flex justify-content-between">
							<div>
								<select class="form-select form-select-xs" id="rows-num" onchange="changeRows();" >
									<option value="5" <%=rows == 5 ? "selected" : "" %>> 5</option>
									<option value="10" <%=rows == 10 ? "selected" : "" %>> 10</option>
									<option value="15" <%=rows == 15 ? "selected" : "" %>> 15</option>
								</select>
							</div>
							<div>
								<select class="form-select form-select-xs" name="opt">
									<option value="title" <%="title".equals(opt) ? "selected" : "" %>> 제목</option>
									<option value="writer" <%="writer".equals(opt) ? "selected" : "" %>> 작성자</option>
									<option value="content" <%="content".equals(opt) ? "selected" : "" %>> 내용</option>
								</select>
								<input type="text" class="form-control form-control-xs w-150" name="keyword" value="<%=keyword %>">
								<button type="submit" class="btn btn-outline-secondary btn-xs" onclick="submitForm(1);">검색</button>
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
if (posts.isEmpty()) {
%>
			<tr><td class="text-center" colspan="6"> 게시글 정보가 없습니다. </td></tr>
<%
} else {
		for (FileShareDto post : posts) {
%>
							<tbody>
								<tr>
									<td><input type="checkbox" name="" value=""/></td>
									<td><%=post.getNo() %></td>
									<td><a href="download"><i class="bi bi-paperclip"></i></a></td>
									<td><a href="detail.jsp?no=<%=post.getNo() %>" class="text-decoration-none text-dark"><%=post.getTitle() %></a></td>
									<td><%=post.getName() %></td>
									<td><%=StringUtils.dateToText(post.getCreatedDate()) %></td>
									<td><%=post.getReadCount() %></td>
								</tr>
							</tbody>
<%
			}
		}	
%>
						</table>
					</form>
					<nav>
<%
	int beginPage = pagination.getBeginPage();	// 시작페이지 번호
	int endPage = pagination.getEndPage();		// 끝페이지 번호
	boolean isFirst = pagination.isFirst();		// 첫페이지인지 여부 , 이전 버튼의 비활성화에서 사용
	boolean isLast = pagination.isLast();		// 마지막페이지인지 여부. 다음 버튼의 비활성화에서 사용
	int prevPage = pagination.getPrevPage();	// 이전 페이지번호, 이전 버튼에서 사용
	int nextPage = pagination.getNextPage();	// 다음 페이지번호, 다음 버튼에서 사용

	
	// 3. 페이지 네비게이션을 출력한다.
%>
				<ul class="pagination pagination-sm justify-content-center">
					<li class="page-item">
						<a class="page-link <%=isFirst ? "disabled" : "" %>" href="list.jsp?page=<%=prevPage %>"
						onclick="changePage(event, <%=prevPage %>)">이전</a>
					</li>
<%
	for (int number = beginPage; number <= endPage; number++) {
%>
				<li class="page-item">
				<a class="page-link <%=currentPage == number ? "active" : "" %>"  href="list.jsp?page=<%=number %>"
				onclick="changePage(event, <%=number %>)"><%=number %></a></li>
<%
	}
%>
				<li class="page-item">
				<a class="page-link <%=isLast ? "disabled" : "" %>" href="list.jsp?page=<%=nextPage %>"
					onclick="changePage(event, <%=nextPage %>)">다음</a>
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
// 표시할 행 갯수를 클릭했을 때 실행되는 이벤트 핸들러 함수다.
function changeRows() {
	
	var rowsField = document.querySelector("[name=rows]");
	rowsField.value = $("#rows-num").val();
	
	
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
	
   var form = document.querySelector("form");	// <form /> 엘리먼트를 조회한다.
	form.submit();	// 폼 입력값을 서버로 제출한다. rows, page, keyboard가 한번에 서버로 제출된다.
}
</script>
</body>
</html>