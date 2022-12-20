<%@page import="com.community.dao.PostNoticeDao"%>
<%@page import="com.community.dao.NoticeDao"%>
<%@page import="com.community.dao.CommentDao"%>
<%@page import="com.community.vo.Post"%>
<%@page import="com.community.dao.PostDao"%>
<%@page import="com.community.dao.EmployeeDao"%>
<%@page import="com.community.util.StringUtils"%>
<%@page import="com.community.vo.Employee"%>
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
<%@ include file="../common/logincheck.jsp" %>
<title>사내 커뮤니티</title>
</head>
<body>
<jsp:include page="../common/header.jsp">
	<jsp:param name="menu" value="admin"/>
</jsp:include>
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
						<a href="home.jsp" class="list-group-item list-group-item-action active">내 정보 보기</a>
						<a href="myposts.jsp" class="list-group-item list-group-item-action">내가 작성한 게시글</a>
						<a href="mycomments.jsp" class="list-group-item list-group-item-action">내가 작성한 댓글</a>
						<a href="mynotice.jsp" class="list-group-item list-group-item-action">나에게 온 알림</a>
					</div>
				</div>
				<div class="card-body">
					<div class="list-group">
						<a href="passwordForm.jsp" class="list-group-item list-group-item-action">비밀번호 변경하기</a>
					</div>
				</div>
			</div>
		</div>
		<div class="col-9">
			<div class="row mb-3">
				<div class="col-12">
					<p>내 정보를 확인하세요</p>
					<table class="table table-bordered">
						<colgroup>
							<col width="15%">
							<col width="35%">
							<col width="15%">
							<col width="35%">
						</colgroup>
<%
	EmployeeDao employeeDao = EmployeeDao.getInstance();
	EmployeeDto employeeDto = employeeDao.getEmployeeByEmail(loginUser.getEmail());

%>
						<tbody>
							<tr>
								<th class="bg-light">직원번호</th><td><%=employeeDto.getNo() %></td>
								<th class="bg-light">입사일</th><td><%=StringUtils.dateToText(employeeDto.getCreatedDate()) %></td>
							</tr>
							<tr>
								<th class="bg-light">소속부서</th><td><%=employeeDto.getDepartmentName() %></td>
								<th class="bg-light">직위</th><td><%=employeeDto.getPositionName() %></td>
							</tr>
							<tr>
								<th class="bg-light">이름</th><td colspan="3"><%=employeeDto.getName() %></td>
							</tr>
							<tr>
								<th class="bg-light">연락처</th><td><%=employeeDto.getPhone() %></td>
								<th class="bg-light">이메일</th><td><%=employeeDto.getEmail() %></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
<%
	PostDao postDao = PostDao.getInstance();
	CommentDao commentDao = CommentDao.getInstance();
	PostNoticeDao postNoticeDao = PostNoticeDao.getInstance();
%>
			<div class="row mb-3">
				<div class="col-12">
					<div class="card">
						<div class="card-header">내 정보</div>
						<div class="card-body">
							<div class="row p-3">
								<div class="col-4">
								<div class="card">
									<div class="card-body bg-primary text-white text-bold">
										<h5>내가 작성한 글</h5>
										<small>내가 작성한 글은 <strong><%=postDao.getPostCountByEmpNo(loginUser.getNo()) %>개</strong> 입니다.</small>
									</div>
								</div>
								</div>
								<div class="col-4">
									<div class="card">
										<div class="card-body bg-success text-white text-bold">
											<h5>내가 작성한 댓글</h5>
											<small>내가 작성한 댓글은 <strong><%=commentDao.getCommentCountByEmpNo(loginUser.getNo()) %>개</strong> 입니다.</small>
										</div>
									</div>
								</div>
								<div class="col-4">
									<div class="card">
										<div class="card-body bg-danger text-white text-bold">
											<h5>나에게 온 알림</h5>
											<small>나에게 온 알림은 <strong><%=postNoticeDao.getPostCount(loginUser.getNo()) %>개</strong> 입니다.</small>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>