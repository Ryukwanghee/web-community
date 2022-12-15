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
	<jsp:param name="menu" value="register.jsp"/>
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
	
	<form id="form-register" class="bg-light border p-3" method="post" action="register.jsp" onsubmit="return checkForm();">
		<div class="mb-3">
			<label class="form-label">아이디</label>
			<input type="text" class="form-control" name="no" />
			<div class="form-text" id="form-no-feedback"></div>
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
			<div class="form-text" id="form-email-feedback"></div>
		<div class="mb-3">
			<label class="form-label">소속부서 번호</label>
			<input type="text" class="form-control" name="deptNo" />
		<div class="mb-3">
			<label class="form-label">직위번호</label>
			<input type="text" class="form-control" name="positionNo" />
		<div class="mb-3">
			<label class="form-label">핸드폰</label>
			<input type="text" class="form-control" name="phone" />
		</div>
		<div class="text-end">
			<a href="../home.jsp" class="btn btn-secondary">취소</a>
			<button type="submit" class="btn btn-primary">회원가입</button>
		</div>
	</form>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
$(function() {
	
	let isValidNo = false;
	
		$(":input[name=no]").keyup(function() {
			let employeesNo = $(this).val();
			let $feedback = $("#form-no-feedback").removeClass("text-danger text-success");
			
			if (employeesNo == "") {
				return false;
			}
			// ajax 
			$.get("no-check.jsp", {no:employeesNo}, function(data) {
				if (data === "exist") {
					$feedback.addClass('text-danger').text("사용할수없음")
					isValidNo = false;
				} else if (data === "notExist") {
					$feedback.addClass('text-success').text("사용가능")
					isValidNo = false;
				}
			});
			
		});
		
		$(":input[name=email]").keyup(function() {
			let employeesEmail = $(this).val();
		});
			
		// <form id="form-register" />에서 submit 이벤트 발생시실행할 이벤트 핸들러 함수를 등록한다.
		$("#form-register").submit(function(){
			let employeesName = $(":input[name=name]").val();
			let employeesNo = $(":input[name=no]").val();
			let employeesPassword = $(":input[name=password]").val();
			let employeesEmail = $(":input[name=email]").val();
			let employeesDeptNo = $(":input[name=deptNo]").val();
			let employeesPositionNo = $(":input[name=positionNo]").val();
			
			let employeesPhone = $(":input[name=phone]").val();
			
			if (employeesNo === "" ) {
				alert("직원번호는 필수입력값입니다.");
				return false;			// submit 이벤트 발생시 <form/> 태그의 기본동작(폼입력값을 서버로 제출하는 동작)이 진행되지 않게한다.
			}
			if (employeesName === "" ) {
				alert("이름은 필수입력값입니다.");
				return false;// submit 이벤트 발생시 <form/> 태그의 기본동작(폼입력값을 서버로 제출하는 동작)이 진행되지 않게한다.
			}
			if (employeesPassword === "" ) {
				alert("비밀번호는 필수입력값입니다.");
				return false;// submit 이벤트 발생시 <form/> 태그의 기본동작(폼입력값을 서버로 제출하는 동작)이 진행되지 않게한다.
			}
			if (employeesEmail === "" ) {
				alert("이메일은 필수입력값입니다.");
				return false;// submit 이벤트 발생시 <form/> 태그의 기본동작(폼입력값을 서버로 제출하는 동작)이 진행되지 않게한다.
			}
			if (employeesDeptNo === "" ) {
				alert("소속부서번호는 필수입력값입니다.");
				return false;// submit 이벤트 발생시 <form/> 태그의 기본동작(폼입력값을 서버로 제출하는 동작)이 진행되지 않게한다.
			}
			if (employeesPhone === "" ) {
				alert("전화번호는 필수입력값입니다.");
				return false;// submit 이벤트 발생시 <form/> 태그의 기본동작(폼입력값을 서버로 제출하는 동작)이 진행되지 않게한다.
			}
			if (employeesPositionNo === "" ) {
				alert("직위번호는 필수입력값입니다.");
				return false;// submit 이벤트 발생시 <form/> 태그의 기본동작(폼입력값을 서버로 제출하는 동작)이 진행되지 않게한다.
			}
			
			// submit 이벤트 발생시 <form/> 태그의 기본동작(폼입력값을 서버로 제출하는 동작)이 진행되도록한다.
			return true;
		});
});
	
	
</script>
</body>
</html>