<%@page import="com.community.dto.PostDto"%>
<%@page import="java.util.List"%>
<%@page import="com.community.util.Pagination"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.community.dao.PostDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/logincheck.jsp" %>
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
						<a href="myposts.jsp" class="list-group-item list-group-item-action active">내가 작성한 게시글</a>
						<a href="mycomments.jsp" class="list-group-item list-group-item-action">내가 작성한 댓글</a>
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
	int rows = StringUtils.stringToInt(request.getParameter("rows"), 5);
	String opt = StringUtils.nullToValue(request.getParameter("opt"), "title");
	String keyword = StringUtils.nullToValue(request.getParameter("keyword"), "");
	
	PostDao postDao = PostDao.getInstance();
	
	Map<String, Object> param = new HashMap<>();
	param.put("writerNo", loginUser.getNo());
	if (!opt.isEmpty() && !keyword.isEmpty()) {
		param.put("opt", opt);
		param.put("keyword", keyword);
	} 
	
	int totalRows = postDao.getTotalRows(param);
	
	Pagination pagination = new Pagination(currentPage, totalRows, rows);
	
	param.put("begin", pagination.getBegin());
	param.put("end", pagination.getEnd());
	
	List<PostDto> dtoList = postDao.getPosts(param);
%>
		<div class="col-9">
			<div class="row mb-3">
				<div class="col-12">
					<p>내가 작성한 게시글을 확인하세요</p>
					<form class="mb-3" method="get" action="myposts.jsp">
						<input type="hidden" name="page" value="<%=currentPage %>" />
						<div class="mb-2 d-flex justify-content-between">
							<div>
								<select class="form-select form-select-xs" name="rows" onchange="changeRows()">
									<option value="5"> 5</option>
									<option value="10"> 10</option>
									<option value="15"> 15</option>
								</select>
							</div>
							<div>
								<select class="form-select form-select-xs" name="opt">
									<option value="title" <%="title".equals(opt) ? "selected" : "" %>> 제목</option>
              						<option value="content" <%="content".equals(opt) ? "selected" : ""  %>> 내용</option>
								</select>
								<input type="text" class="form-control form-control-xs w-150" name="keyword" value=<%=keyword %>>
								<button type="submit" class="btn btn-outline-secondary btn-xs" onclick="submitForm(1)">검색</button>
							</div>
						</div>
						<table class="table table-sm border-top">
							<colgroup>
								<col width="9%">
								<col width="15%">
								<col width="*">
								<col width="18%">
								<col width="7%">
								<col width="7%">
								<col width="8%">
							</colgroup>
							<thead>
								<tr class="bg-light">
									<th>번호</th>
									<th>게시판명</th>
									<th>제목</th>
									<th>등록일</th>
									<th>조회</th>
									<th>추천</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
<%
	if (dtoList.isEmpty()) {
%>
		<tr>
			<td colspan="6" class="text-center">등록된 게시글이 없습니다.</td>
		</tr>
<%
	} else {
		for (PostDto postDto : dtoList) {
%>
								<tr>
									<td><%=postDto.getNo() %></td>
									<td><%=postDto.getName() %></td>
									<td><a href="../detail.jsp?postNo=<%=postDto.getNo() %>" class="text-decoration-none text-dark">[<%=postDto.getImportant()== "Y" ? "중요" : "일반" %>] <%=postDto.getTitle() %></a></td>
									<td><%=StringUtils.dateToText(postDto.getCreatedDate()) %></td>
									<td><%=postDto.getReadCount() %></td>
									<td><%=postDto.getSuggestionCount() %></td>
									<td>
										<a href="../delete.jsp?postNo=<%=postDto.getNo() %>" class="btn btn-outline-secondary btn-xs">삭제</a>
									</td>
								</tr>
<%
		}
	}
%>								
							</tbody>
						</table>
					</form>
					<nav>
						<ul class="pagination pagination-sm justify-content-center">
<%
	if (totalRows >= 1) {
%>
							<li class="page-item disabled">
								<a class="page-link <%=pagination.isFirst() ? "disabled" : "" %>"
								href="myposts.jsp?page=<%=pagination.getPrevPage() %>"
								 onclick="changePage(event, <%=pagination.getPrevPage() %>)" >이전</a>
							</li>
							
							
<%
	for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++){
%>							
							<li class="page-item"><a class="page-link <%=num == currentPage ? "active" : "" %>" 
							href="myposts.jsp?page=<%=num %>"
							onclick="changePage(event, <%=num %>) "><%=num %></a>
							</li>
							
<%
	}
%>							
							<li class="page-item">
								<a class="page-link <%=pagination.isLast() ? "disbaled" : "" %>"
								 href="myposts.jsp?page=<%=pagination.getNextPage() %>"
								onclick="changePage(event, <%=pagination.getNextPage() %>)" >다음</a>
							</li>
<%
	}
%>
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
$(function() {
	function changeRows(event) {
		
		submitForm(1);				
	}
	
	
	function changePage(event, page) {
		event.preventDefault();
		
		submitForm(page);
	}
	
	function submitForm(page) {
		var pageField = document.querySelector("[name=page]");
		pageField.value = page;
		
		var form = document.querySelector("form");
		form.submit();
	}
})
	
	

</script>
</body>
</html>