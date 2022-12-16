<%@page import="com.community.dto.CommentDto"%>
<%@page import="com.community.dao.CommentDao"%>
<%@page import="java.util.List"%>
<%@page import="com.community.dto.FileShareDto"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.dao.FileShareDao"%>
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
			<h1 class="heading">게시글 상세정보</h1>
		</div>
	</div>
<%
	String errorCode = request.getParameter("error");

	if ("fail".equals(errorCode)){
%>
	<div class="alert alert-danger">
		 이미 추천한 게시글입니다.
	</div>
<%
	}
%>
<%
	// list.jsp 에서 post 번호를 전달받는다.
	int no = StringUtils.stringToInt(request.getParameter("no"));

	FileShareDao fileShareDao = new FileShareDao();
	
	// 게시글 번호로 해당 게시글 정보를 가진 객체를 생성한다.
	FileShareDto post = fileShareDao.getPostByNo(no);
	// 조회수를 1 증가시킨다.
	post.setReadCount(post.getReadCount() + 1);
	// 변경된 객체 정보를 업데이트 시킨다.
	fileShareDao.updateCount(post);
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
						<td><%=post.getNo() %></td>
						<th class="text-center bg-light">등록일</th>
						<td><%=StringUtils.dateToText(post.getCreatedDate()) %></td>
					</tr>
					<tr>
						<th class="text-center bg-light">제목</th>
						<td><%=post.getTitle() %></td>
						<th class="text-center bg-light">추천수</th>
						<td><%=post.getSuggestionCount() %></td>
					</tr>
					<tr>
						<th class="text-center bg-light">작성자</th>
						<td><%=post.getName() %> (<%=post.getPositionName() %>)</td>
						<th class="text-center bg-light">소속부서</th>
						<td><%=post.getDepartmentName() %></td>
					</tr>
					<tr>
						<th class="text-center bg-light">조회수</th>
						<td><%=post.getReadCount() %></td>
						<th class="text-center bg-light">댓글 수</th>
						<td><%=post.getCommentCount() %></td>
					</tr>
					<tr>
						<th class="text-center bg-light">내용</th>
						<td colspan="3"><textarea rows="4" class="form-control border-0" readonly="readonly"><%=post.getContent() %></textarea></td>
					</tr>
				</tbody>
			</table>
			<div class="d-flex justify-content-between">
<%
	// 로그인한 사용자의 사원번호와 게시글 작성자의 번호가 일치하면 삭제, 수정 버튼이 활성화되도록 하기
%>
				<span>
					<a href="delete.jsp?no=<%=post.getNo() %>" class="btn btn-danger btn-xs <%=loginUser.getNo() == post.getWriterNo() ? "" : "disabled" %>">삭제</a>
					<a href="modify.jsp" class="btn btn-warning btn-xs <%=loginUser.getNo() == post.getWriterNo() ? "" : "disabled" %>" data-bs-toggle="modal" data-bs-target="#modal-form-posts">수정</a>
				</span>
				<span>
					<a href="suggestion.jsp?no=<%=post.getNo() %>" class="btn btn-outline-primary btn-xs <%=post.getWriterNo() == loginUser.getNo() ? "disabled" : "" %>">추천</a>
				</span>
			</div>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12 mb-1">
			<form method="post" action="comment.jsp">
				<!-- 게시글의 글 번호을 value에 설정하세요 -->
				<input type="hidden" name="postNo" value="<%=post.getNo() %>"/>
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
		<div class="col-12">
			<div class="card">
<%
	CommentDao commentDao = new CommentDao();
	
	List<CommentDto> comments = commentDao.getCommentsByNo(post.getNo());
	
		for (CommentDto comment : comments) {
%>
				<!-- 댓글 반복 시작 -->
				<div class="card-body py-1 px-3 small border-bottom">
					<div class="mb-1 d-flex justify-content-between text-muted">
						<span><%=comment.getName() %></span>
						<span><span class="me-4"><%=StringUtils.dateToText(comment.getCreatedDate()) %></span> <a href="deleteComment.jsp?commentNo=<%=comment.getNo() %>&postNo=<%=post.getNo() %>" class="text-danger <%=loginUser.getNo() == comment.getEmpNo() ? "" : "d-none" %>"><i class="bi bi-trash-fill"></i></a></span>
					</div>
					<p class="card-text"><%=comment.getContent() %></p>
				</div>
				<!-- 댓글 반복 끝 -->
<%
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
		<input type="hidden" name="postNo" value="<%=post.getNo() %>"/>
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
							<input type="text" class="form-control form-control-sm" readonly="readonly" value="<%=loginUser.getName() %>">
						</div>
					</div>
					<div class="row mb-2">
						<div class="col-sm-8 offset-sm-2">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="important" value="N">
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
<script type="text/javascript">

</script>
</body>
</html>