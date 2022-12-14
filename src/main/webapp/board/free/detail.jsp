<%@page import="com.community.vo.Free"%>
<%@page import="com.community.dao.FreeDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="java.util.List"%>
<%@page import="com.community.dao.CommentDao"%>
<%@page import="com.community.dto.CommentDto"%>
<%@page import="com.community.dto.DetailDto"%>
<%@page import="com.community.dao.DetailDao"%>
<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.dao.EmployeeDao"%>
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
			<h1 class="heading">게시글 상세정보</h1>
		</div>
	</div>
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
<%
	Employee loginedEmployee = (Employee)session.getAttribute("loginedEmployee");	

	//필요한건 게시글의 정보 + 작성자의 이름 + 작성자의 직위이름 
	
	int postNo = Integer.parseInt(request.getParameter("no"));
	//조회수 1늘리기
	FreeDao freeDao = FreeDao.getInstance();
	Free free =(Free) freeDao.getFreeByNo(postNo);
	free.setReadCount(free.getReadCount()+1);
	freeDao.updateFree(free);
	
	//번호에 맞는 Detail객체 갖고오기
	
	DetailDao detailDao = DetailDao.getInstance();
	DetailDto detail = detailDao.getDetailByNo(postNo);
	
%>
					<tr>
						<th class="text-center bg-light">번호</th>
						<td><%=detail.getPostNo() %></td>
						<th class="text-center bg-light">등록일</th>
						<td><%=detail.getPostCreatedDate() %></td>
					</tr>
					<tr>
						<th class="text-center bg-light">제목</th>
						<td><%=detail.getPostTitle() %></td>
						<th class="text-center bg-light">추천수</th>
						<td><%=detail.getPostSuggestionCount() %></td>
					</tr>
					<tr>
						<th class="text-center bg-light">작성자</th>
						<td><%=detail.getEmpName() %>(<%=detail.getPositionName() %>)</td>
						<th class="text-center bg-light">소속부서</th>
						<td><%=detail.getDeptName() %></td>
					</tr>
					<tr>
						<th class="text-center bg-light">조회수</th>
						<td><%=detail.getPostReadCount() %></td>
						<th class="text-center bg-light">댓글 수</th>
						<td><%=detail.getPostCommentCount() %></td>
					</tr>
					<tr>
						<th class="text-center bg-light">내용</th>
						<td colspan="3"><textarea rows="4" class="form-control border-0" readOnly><%=detail.getPostContent() %></textarea> </td>
					</tr>
				</tbody>
			</table>
			<div class="d-flex justify-content-between">
				<span>
<%
	if(loginedEmployee != null){
%>
					<a href="../deleteFree.jsp?no=<%=detail.getPostNo() %> " 
					class="btn btn-danger btn-xs <%=detail.getPostWriterNo() == loginedEmployee.getNo() ? "" : "disabled" %>">삭제</a>
					<a href="../updateFree.jsp?no=<%=detail.getPostNo() %> "
					 class="btn btn-warning btn-xs <%=detail.getPostWriterNo() == loginedEmployee.getNo() ? "" : "disabled" %>" data-bs-toggle="modal" data-bs-target="#modal-form-posts">수정</a>
<%
	}
%>
				</span>
				<span>
					<a href="suggestion.jsp?no=<%=detail.getPostNo() %>" class="btn btn-outline-primary btn-xs">추천</a>
					<button class="btn btn-outline-primary btn-xs">답변</button>
				</span>
			</div>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12 mb-1">
			<form method="post" action="comment.jsp">
				<!-- 게시글의 글 번호을 value에 설정하세요 -->
				<input type="hidden" name="postNo" value="<%=detail.getPostNo()%>"/>
				<div class="row mb-3">
					<div class="col-sm-11">
						<input type="text" class="form-control form-control-sm" name="content" placeholder="댓글을 남겨주세요">
					</div>
					<div class="col-sm-1 text-end" style="margin-top: 2px;">
						<button type="submit" class="btn btn-secondary btn-xs">댓글등록</button>
					</div>
				</div>
			</form>
		</div>
		<div class="col-12">
			<div class="card">
				<!-- 댓글 반복 시작 -->
<%
	//글번호에 맞는 댓글들 가져오기
	CommentDao commentDao = CommentDao.getInstance();
	List<CommentDto> commentList = commentDao.getComments(postNo);
	
	//for문으로 값가져오는데 이름필요해서 employeeDao생성해서 가져오기. 
	EmployeeDao employeeDao = EmployeeDao.getInstance();
	for(CommentDto comment : commentList){
		Employee emp =  employeeDao.getEmployeeByNo(comment.getCommentEmpNo());
%>
				<div class="card-body py-1 px-3 small border-bottom">
					<div class="mb-1 d-flex justify-content-between text-muted">
						<span><%=emp.getName() %></span>
						<span style="display:none"><%=comment.getCommentNo() %></span>
						<span><span class="me-4"><%=StringUtils.dateToText(comment.getCommentCreatedDate()) %></span> <a href="deleteFreeComment.jsp?commentNo=<%=comment.getCommentNo() %>" class="text-danger"><i class="bi bi-trash-fill"></i></a></span>
					</div>
					<p class="card-text"><%=comment.getCommentContent() %></p>
				</div>
<%
	}
%>
				<!-- 댓글 반복 끝 -->
				
			</div>				
		</div>
	</div>
</div>
<div class="modal" tabindex="-1" id="modal-form-posts">
	<div class="modal-dialog modal-lg">
	<form class="border p-3 bg-light" method="post" action="../modify.jsp">
		<!-- 게시글의 글 번호을 value에 설정하세요 -->
		<input type="hidden" name="postNo" value="<%=detail.getPostNo()%>"/>
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">게시글 수정폼</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">게시판 이름</label>
						<div class="col-sm-5">
							<select name="boardNo" class="form-select form-select-sm">
								<option value="100"> 공지사항</option>
								<option value="101"> 파일게시판</option>
								<option value="102" selected> 자유게시판</option>
								<option value="103"> 임시게시판</option>
								<option value="104"> 갤러리</option>
								<option value="105"> QnA게시판</option>
							</select>
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">제목</label>
						<div class="col-sm-10">
							<input type="text" class="form-control form-control-sm" name="title" placeholder="<%=detail.getPostTitle() %>">
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">작성자</label>
						<div class="col-sm-10">
							<input type="text" class="form-control form-control-sm" readonly="readonly" name="name" value="<%=employeeDao.getEmployeeByNo(detail.getPostWriterNo()).getName() %>">
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
							<textarea rows="5" name="content" class="form-control"><%=detail.getPostContent() %></textarea>
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