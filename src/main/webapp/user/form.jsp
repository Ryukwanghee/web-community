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
	<jsp:param name="menu" value="register"/>
</jsp:include>
<div class="container my-3">
	<h1 class="mb-3 fs-4 border p-2 bg-light">회원가입 폼</h1>
	
	<%
		// 회원가입 실패로 form.jsp?error=invalid 로 재요청했을 때 errorCode의 값은 invalid다.
		String errorCode = request.getParameter("error");
	%>
	
	<p>아이디, 비밀번호, 이름, 이메일을 입력해서 회원가입을 신청하세요</p>
	<%
		if ("invalid".equals(errorCode)) {
	%>
		<div class="alert alert-danger">
			<strong>회원가입 오류</strong> 아이디 혹은 이메일이 이미 사용중입니다.
		</div>
	<%
		}
	%>
	
	<form class="bg-light border p-3" method="post" action="register.jsp" onsubmit="return checkForm();">
		<div class="mb-3">
			<label class="form-label">아이디</label>
			<input type="text" class="form-control" name="id" />
		</div>
		<div class="mb-3">
			<label class="form-label">비밀번호</label>
			<input type="password" class="form-control" name="password" />
		</div>
		<div class="mb-3">
			<label class="form-label">비밀번호 확인</label>
			<input type="password" class="form-control" name="password2" />
		</div>
		<div class="mb-3">
			<label class="form-label">이름</label>
			<input type="text" class="form-control" name="name" />
		</div>
		<div class="mb-3">
			<label class="form-label">이메일</label>
			<input type="text" class="form-control" name="email" />
		</div>
		<div class="text-end">
			<a href="../home.jsp" class="btn btn-secondary">취소</a>
			<button type="submit" class="btn btn-primary">회원가입</button>
		</div>
	</form>
</div>
<script type="text/javascript">
	function checkForm() {
		var idField = document.querySelector("[name=id]");
		var passwordField = document.querySelector("[name=password]");
		var passwordField2 = document.querySelector("[name=password2]");
		var nameField = document.querySelector("[name=name]");
		var emailField = document.querySelector("[name=email]");
		
		if (idField.value === "") {
			alert("아이디는 필수입력값입니다.");
			idField.focus();
			return false;
		}
		if (passwordField.value === "") {
			alert("비밀번호는 필수입력값입니다.");
			passwordField.focus();
			return false;
		}
		if (passwordField.value != passwordField2.value) {
			alert("비밀번호가 서로 일치하지 않습니다.");
			passwordField2.focus();
			return false;
		}
		if (nameField.value === "") {
			alert("이름은 필수입력값입니다.");
			nameField.focus();
			return false;
		}
		if (emailField.value === "") {
			alert("이메일은 필수입력값입니다.");
			emailField.focus();
			return false;
		}
		
		return true;
	}
</script>
</body>
</html>