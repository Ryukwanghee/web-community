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
			<h1 class="heading">게시물 관리</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<div class="card">
				<div class="card-header">전체 게시판 목록</div>
				<div class="card-body">
					<div class="row p-3">
						<div class="col-3 border p-3">
							<p>전체 게시판목록을 확인하세요.</p>
							<jsp:include page="../common/tree.jsp"/>
						</div>
						<div class="col-9">
							<form class="border p-3" method="get" action="">
								<table class="table table-sm">
									<colgroup>
										<col width="5%">
										<col width="10%">
										<col width="*">
										<col width="10%">
										<col width="10%">
										<col width="15%">
									</colgroup>
									<thead>
										<tr>
											<th><input type="checkbox"></th>
											<th>번호</th>
											<th>제목</th>
											<th>상태</th>
											<th>작성자</th>
											<th>등록일</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input type="checkbox" name="" value=""/></td>
											<td>100000</td>
											<td>[중요] 공지사항 등록</td>
											<td>미삭제</td>
											<td>홍길동</td>
											<td>2022-12-01</td>
										</tr>
										<tr>
											<td><input type="checkbox" name="" value=""/></td>
											<td>100000</td>
											<td>[중요] 공지사항 등록</td>
											<td>미삭제</td>
											<td>홍길동</td>
											<td>2022-12-01</td>
										</tr>
										<tr>
											<td><input type="checkbox" name="" value=""/></td>
											<td>100000</td>
											<td>[중요] 공지사항 등록</td>
											<td>미삭제</td>
											<td>홍길동</td>
											<td>2022-12-01</td>
										</tr>
										<tr>
											<td><input type="checkbox" name="" value=""/></td>
											<td>100000</td>
											<td>[중요] 공지사항 등록</td>
											<td>미삭제</td>
											<td>홍길동</td>
											<td>2022-12-01</td>
										</tr>
										<tr>
											<td><input type="checkbox" name="" value=""/></td>
											<td>100000</td>
											<td>[중요] 공지사항 등록</td>
											<td>미삭제</td>
											<td>홍길동</td>
											<td>2022-12-01</td>
										</tr>
										<tr>
											<td><input type="checkbox" name="" value=""/></td>
											<td>100000</td>
											<td>[중요] 공지사항 등록</td>
											<td>미삭제</td>
											<td>홍길동</td>
											<td>2022-12-01</td>
										</tr>
										<tr>
											<td><input type="checkbox" name="" value=""/></td>
											<td>100000</td>
											<td>[중요] 공지사항 등록</td>
											<td>미삭제</td>
											<td>홍길동</td>
											<td>2022-12-01</td>
										</tr>
										<tr>
											<td><input type="checkbox" name="" value=""/></td>
											<td>100000</td>
											<td>[중요] 공지사항 등록</td>
											<td>미삭제</td>
											<td>홍길동</td>
											<td>2022-12-01</td>
										</tr>
										<tr>
											<td><input type="checkbox" name="" value=""/></td>
											<td>100000</td>
											<td>[중요] 공지사항 등록</td>
											<td>미삭제</td>
											<td>홍길동</td>
											<td>2022-12-01</td>
										</tr>
										<tr>
											<td><input type="checkbox" name="" value=""/></td>
											<td>100000</td>
											<td>[중요] 공지사항 등록</td>
											<td>미삭제</td>
											<td>홍길동</td>
											<td>2022-12-01</td>
										</tr>
										<tr>
											<td><input type="checkbox" name="" value=""/></td>
											<td>100000</td>
											<td>[중요] 공지사항 등록</td>
											<td>미삭제</td>
											<td>홍길동</td>
											<td>2022-12-01</td>
										</tr>
									</tbody>
								</table>
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
								<div class="text-end">
									<button type="button" class="btn btn-outline-dark btn-sm">복구</button>
									<button type="button" class="btn btn-outline-dark btn-sm">이동</button>
									<button type="button" class="btn btn-outline-dark btn-sm">삭제</button>
								</div>
							</form>
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