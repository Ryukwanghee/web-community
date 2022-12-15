<%@page import="com.community.vo.Board"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.community.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../../common/logincheck.jsp" %>
<div class="modal" tabindex="-1" id="modal-form-posts">
	<div class="modal-dialog modal-lg">
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
				<form class="border p-3 bg-light">
					<div class="row mb-2">
						<label class="col-sm-2 col-form-label col-form-label-sm">게시판 이름</label>
						<div class="col-sm-5">
							<select class="form-select form-select-sm">
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

							<input type="text" class="form-control form-control-sm" readonly="readonly" value="<%=loginEmployee.getName() %>">

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
				</form>
			</div>

		</div>
	</div>
</div>