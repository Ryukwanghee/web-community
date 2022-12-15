<%@page import="com.community.vo.Board"%>
<%@page import="com.community.dao.BoardDao"%>
<%@page import="com.community.dto.ReviewDto"%>
<%@page import="com.community.vo.Review"%>
<%@page import="java.util.List"%>
<%@page import="com.community.dao.ReviewDao"%>
<%@page import="com.community.dto.TempDto"%>
<%@page import="com.community.vo.Temp"%>
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
	<div class="row mb-3">
		<div class="col">
			<h1 class="heading">게시글 상세정보</h1>
		</div>
	</div>
<%
	String errorCode = request.getParameter("error");
%>
	
<%
	if ("deny".equals(errorCode)) {
%>
	<div class="alert alert-danger">
		<strong>수정/삭제 거부</strong> 다른 사용자가 작성한 게시글은 수정/삭제할 수 없습니다.
	</div>
<%
	}
%>
<%
	int tempNo = StringUtils.stringToInt(request.getParameter("tempNo"));
	TempDao tempDao = TempDao.getInstance();
	
	TempDto tempDto = tempDao.getTempByNo(tempNo);
	
	tempDto.setPostReadCount(tempDto.getPostReadCount() + 1);
	
	Temp temp = new Temp(tempNo, loginEmployee.getNo());
	temp.setPostReadCount(tempDto.getPostReadCount());
	temp.setTitle(tempDto.getTitle());
	temp.setContent(tempDto.getContent());
	temp.setImportant(tempDto.getImportant());
	temp.setBoardNo(tempDto.getBoardNo());
	temp.setPostReviewCount(tempDto.getPostReviewCount());
	temp.setRecommendCount(tempDto.getRecommendCount());
	tempDao.updateTemp(temp);
	
%>
	<div class="row mb-3">
		<div class="col-12">
			<table class="table table-sm table-bordered">
				<colgroup>
					<col width="15%">
					<col width="35%">
					<col width="15%">
					<col width="35%">
				</colgroup>
				<tbody>
					<tr>
						<th class="text-center bg-light">번호</th>
						<td><%=tempDto.getTempNo() %></td>
						<th class="text-center bg-light">등록일</th>
						<td><%=StringUtils.dateToText(tempDto.getCreatedDate()) %></td>
					</tr>
					<tr>
						<th class="text-center bg-light">제목</th>
						<td><%=tempDto.getTitle() %></td>
						<th class="text-center bg-light">추천수</th>
						<td><%=tempDto.getRecommendCount() %></td>
					</tr>
					<tr>
						<th class="text-center bg-light">작성자</th>
						<td><%=tempDto.getEmpName() %></td>
						<th class="text-center bg-light">소속부서</th>
						<td><%=tempDto.getDeptName() %></td>
					</tr>
					<tr>
						<th class="text-center bg-light">조회수</th>
						<td><%=tempDto.getPostReadCount() %></td>
						<th class="text-center bg-light">댓글 수</th>
						<td><%=tempDto.getPostReviewCount() %></td>
					</tr>
					<tr>
				<th class="text-center bg-light">첨부파일</th>
				<td colspan="3">
					<%=tempDto.getFileName() != null ? tempDto.getFileName() : "없음" %>
	<%
			if (tempDto.getFileName() != null) {
				//download를 서블릿으로 만든다.
	%>
					<a href="../download?no<%=tempDto.getTempNo() %>" class="ms-5 btn btn-success" 
						style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .4rem; --bs-btn-font-size: .65rem;">다운로드</a>
	<%
			}
	%>
				</td>
			</tr>
					<tr>
						<th class="text-center bg-light">내용</th>
						<td colspan="3"><textarea rows="4" class="form-control border-0" readonly="readonly"><%=tempDto.getContent() %></textarea> </td>
					</tr>
				</tbody>
			</table>
			<div class="d-flex justify-content-between">
				<span>
					<a href="deleteItems.jsp" class="btn btn-danger btn-xs">삭제</a>
					<a href="" class="btn btn-warning btn-xs" data-bs-toggle="modal" data-bs-target="#modal-form-posts">수정</a>
				</span>
				<span>
				<!-- 추천 한 유저당 한번되게 하는 것 질문하기 -->
					<a href="recommend.jsp?tempNo=<%=tempDto.getTempNo() %>" class="btn btn-outline-primary btn-xs" >추천</a>
					<!-- <button class="btn btn-outline-primary btn-xs">답변</button> -->
				</span>
			</div>
		</div>
	</div>
<%
	ReviewDao reviewDao = ReviewDao.getInstance();
	List<ReviewDto> dtoList = reviewDao.getReviewsByTempNo(tempNo);
%>
	<div class="row mb-3">
		<div class="col-12 mb-1">
			<form method="post" action="addReview.jsp">
				<!-- 게시글의 글 번호을 value에 설정하세요 -->
				<input type="hidden" name="tempNo" value="<%=tempNo%>"/>
				<input type="hidden" name="empNo" value="<%=loginEmployee.getNo()%>"/>
				<div class="row mb-3">
					<div class="col-sm-11">
						<input type="text" class="form-control form-control-sm" name="content" placeholder="댓글을 남겨주세요">
					</div>
					<div class="col-sm-1 text-end" style="margin-top: 2px;">
						<button class="btn btn-secondary btn-xs">댓글</button>
					</div>
				</div>
			</form>
		</div>
<%
	if (!dtoList.isEmpty()) {
		for (ReviewDto reviewDto : dtoList) {
	
%>
		<div class="col-12">
			<div class="card">
				<!-- 댓글 반복 시작 -->
				<div class="card-body py-1 px-3 small border-bottom">
					<div class="mb-1 d-flex justify-content-between text-muted">
						<span><%=reviewDto.getEmpName()%></span>
						<span><span class="me-4"><%=StringUtils.dateToText(reviewDto.getCreatedDate()) %></span> <a href="" class="text-danger"><i class="bi bi-trash-fill"></i></a></span>
					</div>
					<p class="card-text"><%=reviewDto.getContent() %></p>
				</div>
				<!-- 댓글 반복 끝 -->
			</div>				
		</div>
<%
		}
	}
%>
	</div>
</div>
<div class="modal" tabindex="-1" id="modal-form-posts">
	<div class="modal-dialog modal-lg">
	<form class="border p-3 bg-light" method="post" action="modify.jsp">
		<!-- 게시글의 글 번호을 value에 설정하세요 -->
		<input type="hidden" name="tempNo" value="<%=tempNo %>"/>
		<input type="hidden" name="empNo" value="<%=loginEmployee.getNo() %>"/>
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">게시글 수정폼</h5>
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
							<input type="text" class="form-control form-control-sm" readonly="readonly" name="empName" value="<%=loginEmployee.getName() %>">
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
							<textarea rows="5" class="form-control" name="content">내용을 수정하세요</textarea>
						</div>
					</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary btn-xs" data-bs-dismiss="modal">닫기</button>
				<button type="submit" class="btn btn-primary btn-xs">수정</button>
			</div>
		</div>
	</form>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>