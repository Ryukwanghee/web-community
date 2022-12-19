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
<jsp:include page="../common/logincheck.jsp">
	<jsp:param name="menu" value="login"/>
</jsp:include>
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
						<a href="home.jsp" class="list-group-item list-group-item-action">내 정보 보기</a>
						<a href="myposts.jsp" class="list-group-item list-group-item-action">내가 작성한 게시글</a>
						<a href="mycomments.jsp" class="list-group-item list-group-item-action">내가 작성한 댓글</a>
						<a href="mynotice.jsp" class="list-group-item list-group-item-action">나에게 온 알림</a>
					</div>
				</div>
				<div class="card-body">
					<div class="list-group">
						<a href="passwordform.jsp" class="list-group-item list-group-item-action active">비밀번호 변경하기</a>
					</div>
				</div>
			</div>
		</div>
		<div class="col-9">
			<div class="row mb-3">
				<div class="col-12">
					<p>비밀번호를 변경하세요.</p>
					<form id="form-change-pwd" class="border p-3 bg-light" method="post" action="passwordchange.jsp">
						<div class="mb-3">
							<label class="form-label">이전 비밀번호</label>
							<input type="password" class="form-control" name="prevPassword" />
						</div>
						<div class="mb-3">
							<label class="form-label">새 비밀번호</label>
							<input type="password" class="form-control" name="password" />
						</div>
						<div class="mb-3">
							<label class="form-label">새 비밀번호 확인</label>
							<input type="password" class="form-control" name="password2" />
						</div>
						<div class="text-end">
							<button type="submit" class="btn btn-primary btn-sm">비밀번호 변경</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
$(function () {
	// 비밀번호 일치여부를 저장하는 변수
	let isValidPassword = false;
	// 비밀번호 변경 버튼을 눌러 submit 이벤트 발생시 실행할 이벤트 핸들러 함수 등록
	$("#form-change-pwd").submit(function(){
		// 입력 받은 이전 비밀번호, 새 비밀번호, 새 비밀번호 확인 값 전달받기
		let prevPassword = $(":input[name=prevPassword]").val();
		let password = $(":input[name=password]").val();
		let password2 = $(":input[name=password2]").val();
		
		if (prevPassword === "") {
			alert("이전 비밀번호는 필수 입력값입니다.");
			return false;
		}

		if (password === "") {
			alert("새 비밀번호는 필수 입력값입니다.");
			return false;
		}
		
		if (password2 === "") {
			alert("새 비밀번호 확인은 필수 입력값입니다.");
			return false;
		}
		
		if (password !== password2) {
			alert("새 비밀번호가 동일하지 않습니다.");
			return false;
		}
		// 입력받은 이전 비밀번호가 현재 비밀번호와 일치하는지 유효성 체크하기
		$.post("password-check.jsp", {password:prevPassword}, function(responseData){
			if (responseData === "samePassword") {
				isValidPassword = true;
			} else if (responseData === "NotSamePassword") {
				isValidPassword = false;
			}
			if (!isValidPassword) {
				alert("이전 비밀번호가 일치하지 않습니다.");
				return false;
			}
		})
		
		return true;
	})
})
</script>
</body>
</html>