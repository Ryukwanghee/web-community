<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<title>익명 게시판</title>
</head>
<body>
<jsp:include page="../common/header.jsp">
	<jsp:param name="menu" value="register"/>
</jsp:include>
<div class="container my-3">
	<div class="row mb-3">
        <div class="col">
            <div class="border p-3 bg-light">
                <h1 class="mb-4">회원가입이 완료되었습니다.</h1>
                <p class="">로그인 후 다양한 서비스를 이용해보세요.</p>
            </div>
        </div>
    </div>
</div>
</body>
</html>