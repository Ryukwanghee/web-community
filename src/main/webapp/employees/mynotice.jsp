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
						<a href="" class="list-group-item list-group-item-action">내 정보 보기</a>
						<a href="" class="list-group-item list-group-item-action">내가 작성한 게시글</a>
						<a href="" class="list-group-item list-group-item-action">내가 작성한 댓글</a>
						<a href="" class="list-group-item list-group-item-action active">나에게 온 알림</a>
					</div>
				</div>
				<div class="card-body">
					<div class="list-group">
						<a href="" class="list-group-item list-group-item-action">비밀번호 변경하기</a>
					</div>
				</div>
			</div>
		</div>
		<div class="col-9">
			<div class="row mb-3">
				<div class="col-12">
					<p>나에게 온 알림을 확인하세요</p>
					<form class="mb-3" method="get" action="">
						<div class="mb-2 d-flex justify-content-between">
							<div>
								<select class="form-select form-select-xs">
									<option value="5"> 5</option>
									<option value="10"> 15</option>
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
								<col width="10%">
								<col width="20%">
								<col width="20%">
								<col width="15%">
								<col width="20%">
								<col width="15%">
							</colgroup>
							<thead>
								<tr class="bg-light">
									<th>번호</th>
									<th>보낸 사람</th>
									<th>보낸 날짜</th>
									<th>상태</th>
									<th>읽은 날짜</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="border-bottom-0">100000</td>
									<td class="border-bottom-0">홍길동</td>
									<td class="border-bottom-0">2022-12-01</td>
									<td class="border-bottom-0">읽음</td>
									<td class="border-bottom-0">2022-12-10</td>
									<td class="border-bottom-0 pt-2">
										<a href="" class="btn btn-outline-secondary btn-xs">확인</a>
										<a href="" class="btn btn-outline-secondary btn-xs">삭제</a>
									</td>
								</tr>
								<tr>
									<td colspan="6" class="small ps-5 py-2">
										<a href="">100번 게시글</a>에 <strong>홍길동</strong>님이 댓글을 달았습니다.
									</td>
								</tr>
								<tr>
									<td class="border-bottom-0">100000</td>
									<td class="border-bottom-0">홍길동</td>
									<td class="border-bottom-0">2022-12-01</td>
									<td class="border-bottom-0">읽음</td>
									<td class="border-bottom-0">2022-12-10</td>
									<td class="border-bottom-0 pt-2">
										<a href="" class="btn btn-outline-secondary btn-xs">확인</a>
										<a href="" class="btn btn-outline-secondary btn-xs">삭제</a>
									</td>
								</tr>
								<tr>
									<td colspan="6" class="small ps-5 py-2">
										<a href="">100번 게시글</a>에 <strong>홍길동</strong>님이 댓글을 달았습니다.
									</td>
								</tr>
								<tr>
									<td class="border-bottom-0">100000</td>
									<td class="border-bottom-0">홍길동</td>
									<td class="border-bottom-0">2022-12-01</td>
									<td class="border-bottom-0">읽음</td>
									<td class="border-bottom-0">2022-12-10</td>
									<td class="border-bottom-0 pt-2">
										<a href="" class="btn btn-outline-secondary btn-xs">확인</a>
										<a href="" class="btn btn-outline-secondary btn-xs">삭제</a>
									</td>
								</tr>
								<tr>
									<td colspan="6" class="small ps-5 py-2">
										<a href="">100번 게시글</a>에 <strong>홍길동</strong>님이 댓글을 달았습니다.
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