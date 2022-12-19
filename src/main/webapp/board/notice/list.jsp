<%@page import="com.community.vo.Employee"%>
<%@page import="java.util.List"%>
<%@page import="com.community.util.Pagination"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.community.dao.NoticeDao"%>
<%@page import="com.community.vo.Notice"%>

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
<%
	Employee loginEmployees = (Employee) session.getAttribute("loginedEmployees");

	// 페이지번호를 조회한다.
	int currentPage = StringUtils.stringToInt(request.getParameter("page"), 1);
	
	// 페이지번호에 맞는 조회범위를 계산
	int rows = 10;
	int begin = (currentPage - 1)*rows +1;
	int end = currentPage*rows;
	
	Map<String, Object> param = new HashMap<>();
	param.put("begin", begin);
	param.put("end", end);
	
	// NoticeDao 객체를 생성해서 noticeDao 메소드해서 목록조회
	NoticeDao noticeDao = new NoticeDao();
	List<Notice> noticeList = noticeDao.getNotices(param);
%>
	<div class="row mb-3">
		<div class="col">
			<h1 class="heading">공지사항 게시판</h1>
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
				<div class="card-header">공지사항</div>
				<div class="card-body">
					<form class="mb-3" method="get" action="list.jsp">
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
								<col width="3%">
								<col width="9%">
								<col width="*">
								<col width="10%">
								<col width="20%">
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
				if (noticeList.isEmpty()) {
			%>
				<tr>
					<td> 게시글이 없습니다 </td>
				</tr>
			<%
				} else {
					for (Notice notice : noticeList) {
				
			%>
				
								<tr>
									<td><input type="checkbox" name="" value=""/></td>
									<td><%=notice.getPostNo() %></td>
									<td><a href="detail.jsp?no=<%=notice.getPostNo() %>" class="text-decoration-none text-dark"><%=notice.getTitle() %></a></td>
									<td><%=notice.getWriterNo() %></td>
									<td><%=StringUtils.dateToText(notice.getCreatedDate()) %></td>
									<td><%=notice.getReadCount() %></td>
									<td><%=notice.getSuggestionCount() %></td>
								</tr>
				<%		
		}
	}
%>
							</tbody>
						</table>
						
						<%
							// 총 게시글 갯수 조회
							int totalRows = noticeDao.getTotalRows();
						
						// 총페이지 블록갯수 시작,끝페이지 번호 계산
						int pages = 5;
						int totalPages = (int) Math.ceil((double) totalRows/rows);
						int totalBlocks = (int) Math.ceil((double) totalPages/pages);
						int currentPageBlock = (int) Math.ceil((double) currentPage/pages);
						int beginPage = (currentPageBlock - 1) *pages+1;
						int endPage = currentPageBlock == totalBlocks ? totalPages : currentPageBlock *pages;
						
						%>
					</form>
					<nav>
						<ul class="pagination pagination-sm justify-content-center">
							<li class="page-item">
								<a class="page-link <%=currentPage <=1 ? "disabled" : "" %>" href="list.jsp?page=<%=currentPage -1%>">이전</a></li>
							<%
								for(int number = beginPage; number <= endPage; number++) {
							%>
							
							<li class="page-item"><a class="page-link <%=currentPage == number ? "active" : "" %>" href="list.jsp?page<%=number %>"><%=number %></a></li>
			<%
								}
			%>
							<li class="page-item">
								<a class="page-link <%=currentPage >= totalPages ? "disabled" : "" %>" href="list.jsp?page=<%=currentPage+1%>">다음</a>
							</li>
						</ul>
					</nav>
					<div class="text-end">
<%
	if (loginEmployees != null) {
%>
						<button class="btn btn-dark btn-xs" data-bs-toggle="modal" data-bs-target="#modal-form-posts">등록</button>
<%
	}
%>
						<button class="btn btn-outline-dark btn-xs">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%
	if (loginEmployees != null) {
%>
<div class="modal" tabindex="-1" id="modal-form-posts">
	<div class="modal-dialog modal-lg">
		<form method="post" action="register.jsp">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">게시글 등록폼</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">게시판 이름</label>
						<div class="col-sm-5">
							<select class="form-select form-select-sm" name="boardNo">
								<option value="100"> 공지사항</option>
								<option value="101"> 파일게시판</option>
								<option value="102"> 갤러리</option>
								<option value="103"> 묻고 답하기</option>
								<option value="104"> 벼룩시장</option>
								<option value="105"> 사는 얘기</option>
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
							<input type="text" class="form-control form-control-sm" readonly="readonly" value="<%=loginEmployees.getName()%>">
						</div>
					</div>
					<div class="row mb-2">
						<div class="col-sm-8 offset-sm-2">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="important" value="N" checked="checked">
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
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">첨부파일</label>
						<div class="col-sm-9 mb-1">
							<input type="file" class="form-control form-control-sm">
						</div>
						<div class="col-sm-1">
							<button type="button" class="btn btn-sm"><i class="bi bi-plus-circle"></i></button>
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">첨부파일</label>
						<div class="col-sm-9 mb-1">
							<input type="file" class="form-control form-control-sm">
						</div>
						<div class="col-sm-1">
							<button type="button" class="btn btn-sm"><i class="bi bi-plus-circle"></i></button>
						</div>
					</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary btn-xs" data-bs-dismiss="modal">닫기</button>
				<button type="submit" class="btn btn-primary btn-xs">등록</button>
			</div>
			
		</div>
		</form>
	</div>
</div>
<%
	}
%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html> --%>