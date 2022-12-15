<%@page import="com.community.vo.Employees"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<title>사내 커뮤니티</title>
</head>
<body>
<%
	// HttpSession객체에서 loginedUser라는 이름으로 저장된 객체를 조회한다.
	Employees employees = (Employees) session.getAttribute("loginedEmployees");
%>
<jsp:include page="common/header.jsp">
	<jsp:param name="menu" value="home"/>
</jsp:include>
<div class="container my-3">
	<div class="row mb-3">
		<div class="col">
			<div class="border p-3 bg-light">
				<h1 class="mb-4">사내 커뮤니티 애플리케이션</h1>
				<p class="mb-1">구성원들간의 효과적인 의사소통을 지원하는 게시판입니다.</p>
				<p class="">공지사항, 각종 News, 경조사, 생활정보 등의 다양한 내용을 게시판을 통해 공유, 전파할 수 있습니다.</p>
				<p><%=employees %></p>
				<div>
					<a href="/login" class="btn btn-primary">로그인</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>