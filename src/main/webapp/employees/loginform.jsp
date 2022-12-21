<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<title>게시판</title>
<style type="text/css">
	textarea {
		resize: none;
	}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp">
	<jsp:param name="menu" value="login"/>
</jsp:include>
<div class="container my-3">
	<h1 class="mb-3 fs-4 border p-2 bg-light">로그인 폼</h1>

<%
	String errorCode = request.getParameter("error");
%>
	<p>아이디, 비밀번호 입력해서 로그인하세요</p>
<%
	if ("fail".equals(errorCode)){
%>
	<div class="alert alert-danger">
		<strong>로그인 실패</strong> 이메일 혹은 비밀번호가 일치하지 않습니다.
	</div>
<%
	} else if ("deny".equals(errorCode)) {
%>
	<div class="alert alert-danger">
		<strong>요청 거부</strong> 로그인 한 사용자만 이용가능한 페이지입니다.
	</div>
<%
	}
%>
	<div id="error-message-box" class="alert alert-danger d-none" >
		<strong>입력값 누락</strong> <span id="message-box"></span>
	</div>
	<form class="bg-light border p-3" id="form-login" method="post" action="login.jsp">
		<div class="mb-3">
			<label class="form-label">이메일</label>
			<input type="text" class="form-control" name="email" />
		</div>
		<div class="mb-3">
			<label class="form-label">비밀번호</label>
			<input type="password" class="form-control" name="password" />
		</div>
		<div class="text-end">
			<button type="submit" class="btn btn-primary">로그인</button>
		</div>
	</form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#form-login").submit(function(){
		let email = $(":input[name=email]").val();
		let password = $(":input[name=password]").val();
		
		if (email === "") {
			alert("이메일은 필수 입력값입니다.");
			return false;
		}
		
		if (password === "") {
			alert("비밀번호는 필수 입력값입니다.");
			return false;
		}
		
		return true;
	})
	
})
</script>
</body>
</html>