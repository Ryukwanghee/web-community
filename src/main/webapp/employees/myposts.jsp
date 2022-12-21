<%@page import="org.apache.tomcat.util.descriptor.web.LoginConfig"%>
<%@page import="com.community.dto.FileShareDto"%>
<%@page import="java.util.List"%>
<%@page import="com.community.util.Pagination"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.community.dao.FileShareDao"%>
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
<jsp:include page="../common/logincheck.jsp">
	<jsp:param name="menu" value="login"/>
</jsp:include>
<jsp:include page="../common/header.jsp">
	<jsp:param name="menu" value="admin"/>
</jsp:include>
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
	
	param.put("writerNo", loginUser.getNo());
	// 게시글 개수 조회
	int totalRows = fileShareDao.getTotalRowsByEmpNo(param); 
	
	// Pagination 객체 생성
	Pagination pagination = new Pagination(currentPage, totalRows, rows);
	
	param.put("begin", pagination.getBegin());
	param.put("end", pagination.getEnd());
	param.put("writerNo", loginUser.getNo());
	
	List<FileShareDto> posts = fileShareDao.getPostsByEmpNo(param);
%>
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
						<a href="myposts.jsp" class="list-group-item list-group-item-action active" >내가 작성한 게시글</a>
						<a href="mycomments.jsp" class="list-group-item list-group-item-action">내가 작성한 댓글</a>
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
					<p>내가 작성한 게시글을 확인하세요</p>
					<form class="mb-3" method="post" action="myposts.jsp">
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
								<col width="15%">
								<col width="*">
								<col width="18%">
								<col width="7%">
								<col width="7%">
								<col width="8%">
							</colgroup>
							<thead>
								<tr class="bg-light">
									<th><input type="checkbox" id="checkbox-all-toggle"></th>
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
if (posts.isEmpty()) {
%>
			<tr><td class="text-center" colspan="6"> 게시글 정보가 없습니다. </td></tr>
<%
} else {
		for (FileShareDto post : posts) {
%>							
								<tr>
									<td><input type="checkbox" name="check-post" value="<%=post.getNo() %>"/></td>
									<td><%=post.getNo() %></td>
									<td><%=post.getBoardName() %></td>
									<td><a href="link.jsp?no=<%=post.getNo() %>" class="text-decoration-none text-dark"><%=post.getTitle() %></a></td>
									<td><%=StringUtils.dateToText(post.getCreatedDate()) %></td>
									<td><%=post.getReadCount() %></td>
									<td><%=post.getSuggestionCount() %></td>
									<td>
										<a href="mypostDelete.jsp?no=<%=post.getNo() %>" class="btn btn-outline-secondary btn-xs">삭제</a>
									</td>
								</tr>
							</tbody>
<%
			}
		}	
%>							
						</table>
						<button type="submit" class="btn btn-outline-dark btn-xs disabled" id="selected-post-delete" onclick="changeAction();">선택삭제</button>
						<button type="submit" class="btn btn-outline-dark btn-xs disabled" id="all-post-delete" onclick="changeAction();">전체삭제</button>
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
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#checkbox-all-toggle").change(function(){
		var checkboxAllChecked = $(this).prop("checked");
		$(":checkbox[name=check-post]").prop('checked', checkboxAllChecked);
		if (checkboxAllChecked) {
			$("#all-post-delete").removeClass('disabled');
		} else {
			$("#all-post-delete").addClass('disabled');
			
		}
		
	});
	
	$(":checkbox[name=check-post]").change(function(){
		var checkedLength = $(":checkbox[name=check-post]:checked").length;
		var allCheckedLength = $(":checkbox[name=check-post]").length;
		
		if (checkedLength !== allCheckedLength) {
			$("#checkbox-all-toggle").prop('checked', false);
			$("#all-post-delete").addClass('disabled');
			$("#selected-post-delete").removeClass('disabled');
		} else {
			$("#checkbox-all-toggle").prop('checked', true);
			$("#all-post-delete").removeClass('disabled');
			$("#selected-post-delete").addClass('disabled');
		}
	})
	
});

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

 function changeAction() {
	var form = document.querySelector("form");
	form.setAttribute("action", "selectpostDelete.jsp");
	
	form.submit();
 }
</script>
</body>
</html>