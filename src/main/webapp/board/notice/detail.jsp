<%@page import="java.util.List"%>
<%@page import="com.community.vo.Comment"%>
<%@page import="com.community.dao.CommentDao"%>
<%@page import="com.community.vo.Employee"%>
<%@page import="com.community.dao.EmployeeDao"%>
<%@page import="com.community.vo.Notice"%>
<%@page import="com.community.dao.NoticeDao"%>
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
	<div class="row mb-3">
		<div class="col-12">
		<%
			// 글번호를 조회한다.
			int postNo = StringUtils.stringToInt(request.getParameter("no"));
		
			String id = request.getParameter("id");
		
			// NoticeDao 객체를 생성하고 getNoticeByNo를 실행하고 조회하고 출력
			NoticeDao noticeDao = new NoticeDao();
			Notice notice = noticeDao.getNoticeByNo(postNo);
			
		
					
			// 조회수를 1 증가 시키고, 테이블에도 반영시킨다.
			notice.setReadCount(notice.getReadCount() + 1);
			noticeDao.updateNotice(notice);
		
			notice.setSuggestionCount(notice.getSuggestionCount() + 1);
			noticeDao.updateNotice(notice);
			
			//Comment comment = new Comment();
			
			//CommentDao commentDao = new CommentDao();
			//commentDao.insertComment(comment);
		%>
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
						<td><%=notice.getPostNo() %></td>
						<th class="text-center bg-light">등록일</th>
						<td><%=StringUtils.dateToText(notice.getCreatedDate()) %></td>
					</tr>
					<tr>
						<th class="text-center bg-light">제목</th>
						<td><%=notice.getTitle() %></td>
						<th class="text-center bg-light">추천수</th>
						<td><%=notice.getSuggestionCount() %></td>
					</tr>
					<tr>
						<th class="text-center bg-light">작성자</th>
						<td><%=notice.getWriterNo() %></td>
						<th class="text-center bg-light">소속부서</th>
						<td>개발팀</td>
					</tr>
					<tr>
						<th class="text-center bg-light">조회수</th>
						<td><%=notice.getReadCount() %></td>
						<th class="text-center bg-light">댓글 수</th>
						<td><%=notice.getCommentCount() %></td>
					</tr>
					<tr>
						<th class="text-center bg-light">내용</th>
						<td colspan="3"><textarea rows="4" class="form-control border-0"><%=notice.getContent() %></textarea> </td>
					</tr>
				</tbody>
			</table>
			<div class="d-flex justify-content-between">
				<span>
					<a href="delete.jsp?no=<%=notice.getPostNo() %>" class="btn btn-danger btn-xs">삭제</a>
					<a href="modifyform.jsp?no=<%=notice.getPostNo() %>" class="btn btn-warning btn-xs" data-bs-toggle="modal" data-bs-target="#modal-form-posts">수정</a>
				</span>
				<span>
					<a href="" class="btn btn-outline-primary btn-xs">추천</a>
					<button class="btn btn-outline-primary btn-xs">답변</button>
				</span>
			</div>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12 mb-1">
			<form method="post" action="comment.jsp">
				<!-- 게시글의 글 번호을 value에 설정하세요 -->
				<input type="hidden" name="postNo" value="<%=postNo %>"/>
				<div class="row mb-3">
					<div class="col-sm-11">
						<input type="text" class="form-control form-control-sm" name="content" placeholder="댓글을 남겨주세요">
					</div>
					<div class="col-sm-1 text-end" style="margin-top: 2px;">
						<button type="submit" class="btn btn-secondary btn-xs">댓글</button>
					</div>
				</div>
			</form>
		</div>
		<%
			// CommentDao 객체를 생성해서 getCommentsByPostNo(int postNo)를 실행해서 리뷰를 조회하낟.
			CommentDao commentDao = new CommentDao();
			List<Comment> commentList = commentDao.getCommentsByNo(postNo);
		%>
		
		<div class="col-12">
			<div class="card">
			
			<%
				if (commentList.isEmpty()) {
					for (Comment comment : commentList) {
			%>
				<div class="card-body py-1 px-3 small border-bottom">
					<div class="mb-1 d-flex justify-content-between text-muted">
						<span><%=comment.getEmpNo() %></span>
						<span><span class="me-4"><%=StringUtils.dateToText(comment.getCreatedDate()) %></span> <a href="" class="text-danger"><i class="bi bi-trash-fill"></i></a></span>
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
	<form class="border p-3 bg-light" method="post" action="update.jsp">
		<!-- 게시글의 글 번호을 value에 설정하세요 -->
		<input type="hidden" name="postNo" value="<%=notice.getPostNo() %>"/>
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">게시글 등록폼</h5>
				
			
				
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">게시판 이름</label>
						<div class="col-sm-5">
							<select class="form-select form-select-sm">
								<option value="100"> 공지사항</option>
								<option value="100"> 파일게시판</option>
								<option value="100"> 갤러리</option>
								<option value="100"> 묻고 답하기</option>
								<option value="100"> 벼룩시장</option>
								<option value="100"> 사는 얘기</option>
							</select>
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">제목</label>
						<div class="col-sm-10">
							<input type="text" class="form-control form-control-sm" placeholder="제목" name="title" value=<%=notice.getTitle() %>>
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">작성자</label>
						<div class="col-sm-10">
							<input type="text" class="form-control form-control-sm" readonly="readonly" value="<%=notice.getWriterNo() %>">
						</div>
					</div>
					<div class="row mb-2">
						<div class="col-sm-8 offset-sm-2">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="" value="N" checked>
								<label class="form-check-label">일반</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="" value="Y" >
								<label class="form-check-label">중요</label>
							</div>
						</div>
					</div>
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">내용</label>
						<div class="col-sm-10">
							<textarea rows="5" class="form-control" name="content"><%=notice.getContent() %></textarea>
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