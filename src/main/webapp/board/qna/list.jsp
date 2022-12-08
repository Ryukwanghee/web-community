<%@page import="com.community.vo.Question"%>
<%@page import="java.util.List"%>
<%@page import="com.community.dao.QuestionDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.community.util.StringUtils"%>
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
			<h1 class="heading">묻고 답하기</h1>
		</div>
	</div>
<%
	// 페이지 번호를 조회
	int currentPage = StringUtils.stringToInt(request.getParameter("page"), 1);
	
	// 페이지번호에 맞는 조회범위 계산, Map 객체에 저장
	int rows = 10;
	int begin = (currentPage - 1)*rows + 1;
	int end = currentPage*rows;
	
	Map<String, Object> param = new HashMap<>();
	param.put("begin", begin);
	param.put("end", end);
	
	QuestionDao questionDao = new QuestionDao();
	List<Question> questionList = questionDao.getQuestions(param);
	
%>
	<div class="row mb-3">
		<div class="col-3">
			<div class="card">
				<div class="card-header">전체 게시판 목록</div>
				<div class="card-body">
					<div class="d-grid gap-2">
						<button class="btn btn-dark btn-sm mb-3" data-bs-toggle="modal" data-bs-target="#modal-form-posts">질문 등록</button>
					</div>
					<jsp:include page="../../common/tree.jsp" />
				</div>
			</div>
		</div>
		<div class="col-9">
			<div class="card">
				<div class="card-header">묻고 답하기 게시판</div>
				<div class="card-body">
					<form class="mb-3" method="get" action="">
						<div class="mb-2 d-flex justify-content-between">
							<div>
								<select class="form-select form-select-xs">
									<option value="10"> 10</option>
									<option value="10"> 15</option>
									<option value="10"> 20</option>
								</select>
							</div>
							<div>
								<small><input type="checkbox"> 안읽은 게시글</small>
								<select class="form-select form-select-xs">
									<option value="10"> 제목</option>
									<option value="10"> 작성자</option>
									<option value="10"> </option>
								</select>
								<input type="text" class="form-control form-control-xs w-150">
								<button type="button" class="btn btn-outline-secondary btn-xs">검색</button>
							</div>
						</div>
						<table class="table table-sm border-top">
							<colgroup>
								<col width="5%">
								<col width="12%">
								<col width="*">
								<col width="12%">
								<col width="18%">
								<col width="7%">
								<col width="7%">
							</colgroup>
							<thead>
								<tr class="bg-light">
									<th><input type="checkbox"></th>
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
					if (questionList.isEmpty()) {
						
				%>	
					<tr><td class="text-center" colspan="6"> 게시글 정보가 없습니다. </td></tr>				
				<%
					} else {
						for (Question question : questionList) {
				%>	
						<tr>
							<td><input type="checkbox"></td> 
							<td><%=question.getNo() %></td>
							<td><%=question.getTitle() %></td>
							<td><%=question.getWriterNo() %></td>
							<td><%=StringUtils.dateToText(question.getCreatedDate()) %></td>
							<td><%=question.getReadCount() %></td>
							<td><%=question.getSuggestionCount() %></td>
						</tr>
				<%	
						}
					}
				%>
							</tbody>
						</table>
						
				<% 
					// 총 게시글 갯수를 조회
					int totalRows = questionDao.getTotalRows();
					
					// 총 페이지 갯수, 총 페이지 블록갯수, 현재 페이지블록번호, 시작페이지번호, 끝 페이지번호를 계산
					int pages = 5;
					int totalPages = (int) Math.ceil((double) totalRows/rows);
					int totalBlocks = (int) Math.ceil((double) totalPages/pages);
					int currentPageBlock = (int) Math.ceil((double) currentPage/pages);
					int beginPage = (currentPageBlock - 1)*pages + 1;
					int endPage = currentPageBlock == totalBlocks ? totalPages : currentPageBlock*pages;
				%>
					</form>
					<nav>
						<ul class="pagination pagination-sm justify-content-center">
							<li class="page-item">
								<a class="page-link <%=currentPage <= 1 ? "disabled" : "" %>" href="list.jsp?page=<%=currentPage - 1 %> ">이전</a>
							</li>
				<%
					for	(int number = beginPage; number <= endPage; number++) {
				%>
							<li class="page-item"><a class="page-link <%=currentPage == number ? "active" : "" %>" href="list.jsp?page=<%=number %>"><%=number %></a></li>
				<%
					}
				%>
							<li>
								<a class="page-link <%=currentPage >= totalPages ? "disabled" : ""  %>" href="list.jsp?page=<%=currentPage + 1 %> ">다음</a>
							</li>
						</ul>
					</nav>
					<div class="text-end">
						<button class="btn btn-dark btn-xs" data-bs-toggle="modal" data-bs-target="#modal-form-posts">질문 등록</button>
						<button class="btn btn-primary btn-xs" data-bs-toggle="modal" data-bs-target="#modal-form-posts">답변 등록</button>
						<button class="btn btn-outline-dark btn-xs">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="../../common/modal-form-posts.jsp">
	<jsp:param name="boardNo" value="105"/>
</jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>