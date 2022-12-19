<%@page import="com.community.dao.CommentDao"%>
<%@page import="com.community.dto.DetailDto"%>
<%@page import="com.community.dao.DetailDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.community.util.Pagination"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.vo.Free"%>
<%@page import="java.util.List"%>
<%@page import="com.community.dao.FreeDao"%>
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
			<h1 class="heading">자유게시판</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-3">
			<div class="card">
				<div class="card-header">전체 게시판 목록</div>
				<div class="card-body">
					<div class="d-grid gap-2">
						<button class="btn btn-dark btn-sm mb-3" data-bs-toggle="modal" data-bs-target="#modal-form-posts">공지사항 등록</button>
					</div>
					<jsp:include page="../../common/tree.jsp" />
				</div>
			</div>
		</div>
		<div class="col-9">
			<div class="card">
				<div class="card-header">자유게시판</div>
				<div class="card-body">
<%
	//pagination부분
	int rows = StringUtils.stringToInt(request.getParameter("rows"), 10);
	int currentPage = StringUtils.stringToInt(request.getParameter("page"), 1);
	String opt = StringUtils.nullToValue(request.getParameter("opt"), "title");
	String keyword = StringUtils.nullToValue(request.getParameter("keyword"), "");
	
	Map<String, Object> param = new HashMap<>();
	if (!opt.isEmpty() && !keyword.isEmpty()) {
		param.put("opt", opt);		
		param.put("keyword", keyword);		
	}
	
	FreeDao freeDao = FreeDao.getInstance();
	int totalRows = freeDao.getTotalRows(param);
	
	Pagination pagination = new Pagination(currentPage,totalRows, rows);
	param.put("begin", pagination.getBegin());
	param.put("end", pagination.getEnd());
	
	List<Free> freeList = freeDao.getFrees(param);
%>
					<form class="mb-3" method="get" action="list.jsp">
						<input type="hidden" name="page" value="<%=currentPage %>" />
						<div class="mb-2 d-flex justify-content-between">
							<div>
								<select class="form-select form-select-xs" name="rows" id="rows-select" onchange="changeRows()">
									<option value="10" <%=rows == 10 ? "selected" : ""%>> 10개</option>
									<option value="15" <%=rows == 15 ? "selected" : ""%>> 15개</option>
									<option value="20" <%=rows == 20 ? "selected" : ""%>> 20개</option>
								</select>
							</div>
							<div>
								<small><input type="checkbox"> 안읽은 게시글</small>
								<select class="form-select form-select-xs" name="opt">
									<option value="title" <%="title".equals(opt) ? "selected" : "" %>> 제목</option>
									<option value="writer" <%="writer".equals(opt) ? "selected" : "" %>> 작성자</option>
									<option value="content" <%="content".equals(opt) ? "selected" : "" %>> 내용</option>
								</select>
								<input type="text" class="form-control form-control-xs w-150" name="keyword" value="<%=keyword %>">
								<button type="button" class="btn btn-outline-secondary btn-xs" onclick="submitForm(1)">검색</button>
							</div>
						</div>
						<table class="table table-sm border-top">
							<colgroup>
								<col width="3%">
								<col width="12%">
								<col width="*">
								<col width="12%">
								<col width="17%">
								<col width="7%">
								<col width="7%">
							</colgroup>
							<thead>
								<tr class="bg-light">
									<th><input type="checkbox" name="checkboxAllToggle" onclick="CheckboxAllToggle()"></th>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>등록일</th>
									<th>조회</th>
									<th>추천</th>
								</tr>
							</thead>
							<tbody>
<%
	
	
	if(freeList.isEmpty()){
%>
	<tr>
		<td></td>
		<td></td>
		<td>게시글이 없습니다.</td>
		<td></td>
		<td></td>
	</tr>
<% 
	}else{
		for(Free free: freeList){	
			//writerNo부분 이름으로 바꾸기.
			DetailDao detailDao = DetailDao.getInstance();
			DetailDto detail = detailDao.getDetailByNo(free.getNo());
			
%>		
								<tr>
									<td><input type="checkbox" name="no" value="<%=free.getNo() %>"/></td>
									<td><%=free.getNo() %></td>
									<td><a href="detail.jsp?no=<%=free.getNo() %>" class="text-decoration-none text-dark"><%=free.getTitle() %></a></td>
									<td><%=detail.getEmpName() %></td>	 
									<td><%=StringUtils.dateToText(free.getCreatedDate()) %></td>
									<td><%=free.getReadCount() %></td>
									<td><%=free.getSuggestionCount()%></td>
								</tr>
<%
		}
	}
%>
							</tbody>
						</table>

						<div class="text-end">
						<button class="btn btn-dark btn-xs" data-bs-toggle="modal" id="register" data-bs-target="#modal-form-posts">등록</button>
						<button class="btn btn-outline-dark btn-xs" onclick="deletePost()">삭제</button>
					</div>
					</form>
					<nav>
<%
	if(!freeList.isEmpty()){
		int beginPage = pagination.getBeginPage();	// 시작 페이지번호
		int endPage = pagination.getEndPage();		// 끝 페이지번호
		boolean isFirst = pagination.isFirst();		// 첫 페이지인지 여부, 이전 버튼의 비활성화에서 사용
		boolean isLast = pagination.isLast();		// 마지막 페이지인지 여부, 다음 버튼의 비활성화에서 사용
		int prevPage = pagination.getPrevPage();	// 이전 페이지번호, 이전 버튼에서 사용
		int nextPage = pagination.getNextPage();	// 다음 페이지번호, 다음 버튼에서 사용
%>
	<ul class="pagination pagination-sm justify-content-center">
							<li class="page-item <%=isFirst ? "disabled" : "" %>">
								<a href="list.jsp?page=<%=prevPage %>" 
								class="page-link"
								onclick="changPage(event, <%=prevPage%>)">이전</a>
							</li>
<%
		for(int number = beginPage; number <= endPage; number++){
%>
			<li class="page-item"><a class="page-link <%=currentPage == number ? "active" : "" %>" 
				href="list.jsp?page=<%=number %>"
				onclick="changePage(event, <%=number %>)"><%=number %>
				</a></li>
<%
		}
%>
				
							<li class="page-item">
								<a class="page-link <%=isLast ? "disabled" : "" %> " 
								href="list.jsp?page=<%=nextPage %>"
								onclick="changePage(event, <%=nextPage %>)">다음</a>
							</li>
						</ul>
					</nav>
<%
	}
%>
					
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="modal-form-posts.jsp">
	<jsp:param name="boardNo" value="102"/>
</jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">

	//10줄씩, 15줄씩 이거 해결해야됨.
	function changeRows(){									
		
		submitForm(1);	
	}
	
	function changePage(event, page) {
		event.preventDefault();	
		
		submitForm(page);
	}
	
	function submitForm(page) {
		let pageField = document.querySelector("[name=page]");	
		pageField.value = page;									
		
		let form = document.querySelector("form");				
		form.submit();	
	}
	
	function CheckboxAllToggle(){
		let checkboxAllToggle = document.querySelector("[name=checkboxAllToggle]");
		let currentChecked = checkboxAllToggle.checked;	//맨 위에꺼의 check 상태
		
		let elements = document.querySelectorAll("[name=checkbox]")
		for( index=0; index <= elements.length; index++){
			let el = elements[index];
			el.checked = currentChecked;
		}
	}
	
	function deletePost(){
		let form = document.querySelector("form");
		form.setAttribute("action","deleteFree.jsp");
	}
	
	$("#register").click(function(){
		return false;
	})
	
</script>
</body>
</html>