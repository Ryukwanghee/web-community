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

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<title>익명 게시판</title>
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

	<div class="row mb-3">
		<div class="col">
			<h1 class="heading">로그인</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-sm-6">
			<form id="form-login" class="border bg-light p-3" method="post" action="login.jsp">
				<div class="mb-3">
					<label class="form-label">직원번호</label>
					<input type="text" class="form-control" name="no"/>
				</div>
				<div class="mb-3">
					<label class="form-label">비밀번호</label>
					<input type="password" class="form-control" name="password"/>
				</div>
				<div class="text-end">
					<a href="../home.jsp" class="btn btn-secondary">취소</a>
					<button type="submit" class="btn btn-primary">로그인</button>
				</div>
			</form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#form-login").submit(function(){
		let EmployeesNo = $(":input[name=no]").val();	
		let EmployeesPassword = $(":input[name=password]").val();
		if(EmployeesNo === "") {
			alert("아이디는 필수입력입니다");
			return false;
		}
		if(EmployeesPassword === "") {
			alert("비밀번호는 필수입력입니다");
			return false;
		}
		
		return true;
	});
});


	<h1 class="mb-3 fs-4 border p-2 bg-light">로그인 폼</h1>
	<%
		// 회원가입 실패로 form.jsp?error=invalid로 재요청했을 때 errorCode의 값은 invalid다. 
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
		<strong>요청 거부</strong> 로그인한 사용자만 이용가능한 페이지입니다.
		</div>
	<%
		}	
	%>
	<div id="error-message-box" class="alert alert-danger d-none">
		<strong>입력값 누락</strong><span id="message-box"></span>
	</div>
	
	<form class="bg-light border p-3" method="post" action="login.jsp" onsubmit="return checkLoginForm();">
		<div class="mb-3">
			<label class="form-label">e-mail</label>
			<input type="text" class="form-control" name="email" />
		</div>
		<div class="mb-3">
			<label class="form-label">password</label>
			<input type="password" class="form-control" name="password" />
		</div>
		<div class="text-end">
			<button type="submit" class="btn btn-primary">로그인</button>
		</div>
	</form>
</div>
<script>
	function checkLoginForm(){
		var emailField = document.querySelector("[name=email]");
		var passwordField = document.querySelector("[name=password]");
		var errorMessageBox = document.querySelector("#error-message-box");
		var messageBox = document.querySelector("#message-box");
		
		if (emailField.value === '') {
			errorMessageBox.classList.remove("d-none");
			messageBox.textContent = " 아이디는 필수입력값입니다.";
			idField.focus();
			return false;
		}
		if (passwordField.value === '') {
			errorMessageBox.classList.remove("d-none");
			messageBox.textContent = " 비밀번호는 필수입력값입니다.";
			passwordField.focus();
			return false;
		}
	}

</script>
</body>
</html>