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
					<p>내가 작성한 게시글을 확인하세요</p>
					<form class="mb-3" method="get" action="">
						<div class="mb-2 d-flex justify-content-between">
							<div>
								<select class="form-select form-select-xs">
									<option value="10"> 10</option>
									<option value="10"> 15</option>
									<option value="10"> 20</option>
								</select>
							</div>
							<div>
								<select class="form-select form-select-xs">
									<option value="title"> 제목</option>
									<option value="content"> 내용</option>
								</select>
								<input type="text" class="form-control form-control-xs w-150">
								<button type="button" class="btn btn-outline-secondary btn-xs">검색</button>
							</div>
						</div>
						<table class="table table-sm border-top">
							<colgroup>
								<col width="9%">
								<col width="15%">
								<col width="*">
								<col width="18%">
								<col width="7%">
								<col width="7%">
								<col width="8%">
							</colgroup>
							<thead>
								<tr class="bg-light">
									<th>번호</th>
									<th>게시판명</th>
									<th>제목</th>
									<th>등록일</th>
									<th>조회</th>
									<th>추천</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>100000</td>
									<td>공지사항</td>
									<td><a href="" class="text-decoration-none text-dark">[중요] 공지사항 등록</a></td>
									<td>2022-12-01</td>
									<td>12</td>
									<td>10</td>
									<td>
										<a href="" class="btn btn-outline-secondary btn-xs">삭제</a>
									</td>
								</tr>
								<tr>
									<td>100000</td>
									<td>공지사항</td>
									<td><a href="" class="text-decoration-none text-dark">[중요] 공지사항 등록</a></td>
									<td>2022-12-01</td>
									<td>12</td>
									<td>10</td>
									<td>
										<a href="" class="btn btn-outline-secondary btn-xs">삭제</a>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
					<nav>
						<ul class="pagination pagination-sm justify-content-center">
							<li class="page-item disabled">
								<a class="page-link">이전</a>
							</li>
							<li class="page-item"><a class="page-link active" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item">
								<a class="page-link" href="#">다음</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</body>
</html>