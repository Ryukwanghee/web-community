<%@page import="com.community.vo.Board"%>
<%@page import="com.community.dao.BoardDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.community.dto.TempDto"%>
<%@page import="com.community.vo.Temp"%>
<%@page import="java.util.List"%>
<%@page import="com.community.util.Pagination"%>
<%@page import="com.community.dao.TempDao"%>
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
<jsp:include page="../../common/header.jsp">
	<jsp:param name="menu" value="board"/>
</jsp:include>
<div class="container my-3">
<%
	int rows = StringUtils.stringToInt(request.getParameter("rows"), 5);
	int currentPage = StringUtils.stringToInt(request.getParameter("page"), 1);
	String opt = StringUtils.nullToValue(request.getParameter("opt"), "title");
	String keyword = StringUtils.nullToValue(request.getParameter("keyword"), "");
	
	TempDao tempDao = TempDao.getInstance();
	
	Map<String, Object> param = new HashMap<>();
	param.put("empNo", loginUser.getNo());	//totalRows 에 값 들어가야하니까 더 위에 있어야함
	if (!opt.isEmpty() && !keyword.isEmpty()) {
		param.put("opt", opt);
		param.put("keyword", keyword);
	} 
	int totalRows = tempDao.getTotalRows(param);
	
	Pagination pagination = new Pagination(currentPage, totalRows, rows);
	
	param.put("begin", pagination.getBegin());
	param.put("end", pagination.getEnd());
	
	List<TempDto> dtoList = tempDao.getTemps(param);
%>
	<div class="row mb-3">
		<div class="col">
			<h1 class="heading">임시 저장함</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-3">
			<div class="card">
				<div class="card-header">전체 게시판 목록</div>
				<div class="card-body">
					<div class="d-grid gap-2">
						<button class="btn btn-dark btn-sm mb-3" data-bs-toggle="modal" data-bs-target="#modal-form-posts">임시 게시글 등록</button>
					</div>
					<jsp:include page="../../common/tree.jsp" />
				</div>
			</div>
		</div>
		<div class="col-9">
					<form class="mb-3" method="get" action="deleteItems.jsp">
						
			<div class="card">
				<div class="card-header">임시저장함</div>
				<div class="card-body">
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
              						<option value="boardName" <%="boardName".equals(opt) ? "selected" : ""  %>> 게시판이름</option>
								</select>
								<input type="text" class="form-control form-control-xs w-150" name="keyword" value=<%=keyword %>>
								<button type="submit" class="btn btn-outline-secondary btn-xs" onclick="submitForm(1)">검색</button>
							</div>
							
						</div>
						
						<table class="table table-sm border-top">
							<colgroup>
								<col width="3%">
								<col width="10%">
								<col width="15%">
								<col width="*%">
								<col width="7%">
								<col width="17%">
							</colgroup>
							<thead>
								<tr class="bg-light">
									<th><input type="checkbox" id="checkbox-all" ></th>
									<th>번호</th>
									<th>게시판 이름</th>
									<th>제목</th>
									<th>작성자</th>
									<th>등록일</th>
								</tr>
							</thead>
							<tbody>
<%
	if (dtoList.isEmpty()){
%>
		<tr>
			<td colspan="6" class="text-center">등록된 임시 게시글이 없습니다.</td>
		</tr>
<%
	} else {
		for (TempDto tempDto : dtoList) {
%>
								<tr>
									<td><input type="checkbox" name="tempNo" value="<%=tempDto.getTempNo() %>"/></td>
									<td><%=tempDto.getTempNo() %></td>
									<td><%=tempDto.getBoardName() %></td>
									<td><a href="detail.jsp?tempNo=<%=tempDto.getTempNo() %>" class="text-decoration-none text-dark"><%=tempDto.getTitle() %></a></td>
									<td><%=tempDto.getEmpName() %></td>
									<td><%=StringUtils.dateToText(tempDto.getCreatedDate()) %></td>
								</tr>
<%
		}
	}
%>
							</tbody>
						</table>
					
<%
	 if (totalRows >= 1) {
		
%>	
					<nav>
						<ul class="pagination pagination-sm justify-content-center">
							<li class="page-item">
								<a class="page-link <%=pagination.isFirst() ? "disabled" : "" %>" 
								href="list.jsp?page=<%=pagination.getPrevPage() %>"
								 onclick="changePage(event, <%=pagination.getPrevPage() %>)" >이전</a>
							</li>
<%	
	for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
%>
							<li class="page-item">
							<a class="page-link <%=num == currentPage ? "active" : "" %>" 
							href="list.jsp?page=<%=num %>"
							onclick="changePage(event, <%=num %>) "><%=num %></a>
							</li>
<%
		}
%>
							<li class="page-item">
								<a class="page-link <%=pagination.isLast() ? "disabled" : "" %>" 
								href="list.jsp?page=<%=pagination.getNextPage() %>"
								onclick="changePage(event, <%=pagination.getNextPage() %>)" >다음</a>
								</li>
							
						</ul>
					</nav>
<%
	}
%> 
					<div class="text-end">
 						<a href="clear.jsp" class="btn btn-outline-dark btn-xs" >전체 삭제</a>
 						<button type="submit" class="btn btn-outline-dark btn-xs disabled" id="btn-delete-selected" >선택삭제</button>
					</div>
				</div>
			</div>
		</form>
		</div>
	</div>
</div>

<div class="modal" tabindex="-1" id="modal-form-posts">
	<div class="modal-dialog modal-lg">
		<form class="border p-3 bg-light" method="post" action="register.jsp">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">게시글 등록폼</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
<%
	BoardDao boardDao = BoardDao.getInstance();
	
	List<Board> boardList = boardDao.getBoards();
	
%>
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">게시판 이름</label>
						<div class="col-sm-5">
							<select class="form-select form-select-sm" name="boardNo">
<%
	for (Board board : boardList) {
%>
								<option value="<%=board.getNo() %>"> <%=board.getName() %></option>
<%
	}
%>
							</select>
						</div>
					</div>

					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">제목</label>
						<div class="col-sm-10">
							<input type="text" class="form-control form-control-sm" placeholder="제목" name="title">
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">작성자</label>
						<div class="col-sm-10">
							<input type="text" class="form-control form-control-sm" name="empName" readonly="readonly" value="<%=loginUser.getName() %>">
						</div>
					</div>
					<div class="row mb-2">
						<div class="col-sm-8 offset-sm-2">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="important" value="N" checked>
								<label class="form-check-label">일반</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="important" value="Y" >
								<label class="form-check-label">중요</label>
							</div>
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">내용</label>
						<div class="col-sm-10">
							<textarea rows="5" class="form-control" name="content"></textarea>
						</div>
					</div>
					<!-- <div id="box-file"> append는 안쪽에 생성되는 거라서 div를 바깥에 생성해서 감싸준다. 
						<div class="row mb-2">
							<label class="col-sm-2 col-form-label col-form-label-sm">첨부파일</label>
							<div class="col-sm-8 mb-1">
								<input type="file" class="form-control form-control-sm" name="add">
							</div>
							<div class="col-sm-1">
								<button type="button" class="btn btn-sm" id="file-add-field" ><i class="bi bi-plus-circle" ></i></button>
							</div>
						</div>
					</div> -->
					
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary btn-xs" data-bs-dismiss="modal">닫기</button>
				<button type="submit" class="btn btn-primary btn-xs">등록</button>
			</div>
		</div>
	</form>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
		$("#checkbox-all").change(function(){
			var checkboxAllChecked = $(this).prop("checked");
			$(":checkbox[name=tempNo]").prop('checked', checkboxAllChecked);
			
			toggleSelectedButton();
		});
		
		$(":checkbox[name=tempNo]").change(function(){
			
			toggleCheckboxAll();
			toggleSelectedButton();
		});
		
		function toggleCheckboxAll() {
			var checkboxLength = $(":checkbox[name=tempNo]").length;
			var checkedCheckboxLength = $(":checkbox[name=tempNo]:checked").length;
			
			$("#checkbox-all").prop("checked", checkboxLength == checkedCheckboxLength);
		}
		
		
		
		function toggleSelectedButton() {
			var checkedCheckboxLength = $(":checkbox[name=tempNo]:checked").length;
			
			var $btnDeleteSelected = $("#btn-delete-selected");
			
			if (checkedCheckboxLength == 0) {
				$btnDeleteSelected.addClass("disabled");
			} else {
					$btnDeleteSelected.removeClass("disabled");
			}
		}
		
		
		// 체크박스에 체크한게 없으면 
		/* $("#btn-delete-selected").click(function() {
			event.preventDefault();
			
			var checkedCheckboxLength = $(":checkbox[name=tempNo]:checked").length;
			
			if (checkedCheckboxLength == 0){
				alert("체크한게 하나도 없습니다. 체크하세요");
			}
		}); */
		/* $("#file-add-field").click(function() { 첨부파일
			var htmlContent = `
				<div class="row ">
					<div class="col-8 offset-2">
						<input type="file" class="form-control form-control-sm" name="add">
					</div>
					<div class="col-2 text-end pt-1">
					<button type="button" class="btn btn-sm" id="file-add-field" ><i class="bi bi-dash-circle" ></i></button>
					</div>
				</div>
			`;
			$("#box-file").append(htmlContent);
		});
			
		//미래에 생길 테이블에서 삭제버튼 클릭했을 때 발생하는 이벤트, 클래스의 bi-dash-circle이 실제 이벤트 핸들러 대상임
		$("#box-file").on("click", '.bi-dash-circle', function() {
			$(this).closest('.row').remove();
		}); */
	
});


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
		form.setAttribute("action", "list.jsp");
		form.submit();
	}
</script>
</body>
</html>