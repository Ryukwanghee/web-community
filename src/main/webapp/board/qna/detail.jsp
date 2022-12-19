<%@page import="com.community.vo.Comment"%>
<%@page import="java.util.List"%>
<%@page import="com.community.dao.CommentDao"%>
<%@page import="com.community.dto.QuestionDetailDto"%>
<%@page import="com.community.dao.DepartmentDao"%>
<%@page import="com.community.vo.Department"%>
<%@page import="com.community.vo.Position"%>
<%@page import="com.community.dao.PositionDao"%>
<%@page import="com.community.dao.QuestionDao"%>
<%@page import="com.community.vo.Question"%>
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
			<h1 class="heading">게시글 상세정보</h1>
		</div>
	</div>

	<%
		// 글번호를 조회
		int questionNo = StringUtils.stringToInt(request.getParameter("no"));
	
		// Question객체 생성, getQuestionByNo(int questionNo) 실행하여 게시글 정보를 조회하고 출력
		QuestionDao questionDao = new QuestionDao();
		QuestionDetailDto dto = questionDao.getQuestionDetailDtoByNo(questionNo);
		
		// 조회수를 1 증가시키고, 테이블 반영
		dto.setReadCount(dto.getReadCount() + 1);
		questionDao.increaseReadCount(questionNo);
		
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
						<td><%=dto.getNo() %></td>
						<th class="text-center bg-light">등록일</th>
						<td><%=StringUtils.dateToText(dto.getCreatedDate()) %></td>
					</tr>
					<tr>
						<th class="text-center bg-light">제목</th>
						<td><%=dto.getTitle() %></td>
						<th class="text-center bg-light">추천수</th>
						<td><%=dto.getSuggestionCount() %></td>
					</tr>
					<tr>
						<th class="text-center bg-light">작성자</th>
						<td><%=dto.getEmpName() %> (<%=dto.getPositionName() %>)</td>
						<th class="text-center bg-light">소속부서</th>
						<td><%=dto.getDeptName() %></td>
					</tr>
					<tr>
						<th class="text-center bg-light">조회수</th>
						<td><%=dto.getReadCount() %></td>
						<th class="text-center bg-light">댓글수</th>
						<td><%=dto.getCommentCount() %></td>
					</tr>
					<tr>
						<th class="text-center bg-light">내용</th>
						<td colspan="3"><textarea rows="4" class="form-control border-0"><%=dto.getContent() %></textarea> </td>
					</tr>
				</tbody>
			</table>
			<div class="d-flex justify-content-between">
				<span>
					<a href="delete.jsp?no=<%=dto.getNo() %>" class="btn btn-danger btn-xs">삭제</a>
					<a href="" class="btn btn-warning btn-xs" data-bs-toggle="modal" data-bs-target="#modal-form-posts">수정</a>
				</span>
				<span>
					<a href="addsuggestion.jsp?no=<%=dto.getNo() %>" class="btn btn-outline-primary btn-xs">추천</a>
					<button class="btn btn-outline-primary btn-xs" data-bs-toggle="modal" data-bs-target="#modal-answer-posts">답변</button>
					<a href="list.jsp" class="btn btn-outline-primary btn-xs">목록</a>
				</span>
			</div>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12 mb-1">
			<form method="post" action="addComment.jsp">
				<!-- 게시글의 글 번호을 value에 설정하세요 -->
				<input type="hidden" name="postNo" value="<%=dto.getNo() %>"/>
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
			// CommentDao 객체 생성해서 getCommentByQuestionNo(int questionNo)를 실행해서 댓글을 조회한다.
			CommentDao commentDao = new CommentDao();
		/* 이 부분 은송씨는 번호로 조회, 승우씨는 게시판글 번호로 조회해서 Dao랑 xml에 중복된게 2개 있음. 나중에 통일 시켜야함 */
			List<Comment> commentList = commentDao.getCommentByQuestionNo(questionNo); 
		%>
		<div class="col-12">
		<div class="card">
		<%
			if (!commentList.isEmpty()) {
				for (Comment comment : commentList) {
		%>
			<div class="card-body py-1 px-3 small border-bottom">
					<div class="mb-1 d-flex justify-content-between text-muted">
						<span><%=dto.getEmpName() %></span>
						<span><span class="me-4"><%=StringUtils.dateToText(comment.getCreatedDate()) %></span><a href="deleteComment.jsp?postNo=<%=dto.getNo()%>&commentNo=<%=comment.getNo()%>" class="text-danger"><i class="bi bi-trash-fill"></i></a></span>
					</div>
					<p class="card-text"><%=comment.getContent() %></p>
			</div>
		<% 
				}
			}
		%>
			</div>				
		</div>
	</div>
</div>
<div class="modal" tabindex="-1" id="modal-form-posts">
	<div class="modal-dialog modal-lg">
	<form class="border p-3 bg-light" method="post" action="modify.jsp">
		<!-- 게시글의 글 번호을 value에 설정하세요 -->
		<input type="hidden" name="no" value="<%=dto.getNo() %>"/>
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">게시글 수정폼</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">게시판 이름</label>
						<div class="col-sm-5">
							<select class="form-select form-select-sm" name="boardNo">
								<option value="100"> 공지사항</option>
								<option value="101"> 파일게시판</option>
								<option value="102"> 자유게시판</option>
								<option value="103"> 임시게시판</option>
								<option value="104"> 갤러리</option>
								<option value="105" selected> QnA게시판</option>
							</select>
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">제목</label>
						<div class="col-sm-10">
							<input type="text" class="form-control form-control-sm" placeholder="제목" name="title" value="<%=dto.getTitle() %>">
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">작성자</label>
						<div class="col-sm-10">
							<input type="text" class="form-control form-control-sm" readonly="readonly" name="writer" value="<%=dto.getEmpName() %>">
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
							<textarea rows="5" class="form-control" name="content"><%=dto.getContent() %></textarea>
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
<div class="modal" tabindex="-1" id="modal-answer-posts">
	<div class="modal-dialog modal-lg">
	<form class="border p-3 bg-light" method="post" action="addAnswer.jsp" >
		<input type="hidden" name="originalNo" value="<%=dto.getNo()%>">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">게시글 상세정보 답변폼</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
				<div class="modal-body">
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">게시판 이름</label>
						<div class="col-sm-5">
							<select class="form-select form-select-sm" name="boardNo">
								<option value="100"> 공지사항</option>
								<option value="101"> 파일게시판</option>
								<option value="102"> 자유게시판</option>
								<option value="103"> 임시게시판</option>
								<option value="104"> 갤러리</option>
								<option value="105" selected> QnA게시판</option>
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
							<input type="text" class="form-control form-control-sm" readonly="readonly" value="이순신" name="writer">
						</div>
					</div>
					<div class="row mb-2">
						<div class="col-sm-8 offset-sm-2">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="important" value="N" >
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
							<input type="file" class="form-control form-control-sm" name="attachedFile1">
						</div>
						<div class="col-sm-1">
							<button type="button" class="btn btn-sm"><i class="bi bi-plus-circle"></i></button>
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">첨부파일</label>
						<div class="col-sm-9 mb-1">
							<input type="file" class="form-control form-control-sm" name="attachedFile2">
						</div>
						<div class="col-sm-1">
							<button type="button" class="btn btn-sm"><i class="bi bi-plus-circle"></i></button>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary btn-xs" data-bs-dismiss="modal">닫기</button>
						<button type="submit" class="btn btn-primary btn-xs">등록</button>
					</div>
			</div>
		</div>
		</form>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>
