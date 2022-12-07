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
			<h1 class="heading">게시판 관리</h1>
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
							<ul class="tree border py-3">
				  				<li>
				  					<span class="caret">공지사항</span>
								</li>
				  				<li>
				  					<span class="caret">파일게시판</span>
				  				</li>
				  				<li>
				  					<span class="caret">갤러리</span>
				  				</li>
				  				<li>
				  					<span class="caret caret-down">자유게시판</span>
				    				<ul class="nested active">
										<li>묻고 답하기</li>
										<li>벼룩시장</li>
										<li>사는 얘기</li>
									</ul>
				  				</li>
				  				<li>
				  					<span class="caret">임시게시판</span>
				  				</li>
							</ul>
						</div>
						<div class="col-9">
							<form class="p-3" method="post" action="">
								<table class="table table-sm">
									<colgroup>
										<col width="25%">
										<col width="75%">
									</colgroup>
									<tbody>
										<tr class="align-middle">
											<th>상위 게시판</th>
											<td>
												<select class="form-select form-select-sm" name="">
													<option value=""> 선택안함</option>
													<option value="100"> 공지사항</option>
													<option value="100"> 공지사항</option>
													<option value="100"> 공지사항</option>
													<option value="100"> 공지사항</option>
												</select>
											</td>
										</tr>
										<tr class="align-middle">
											<th>게시판 이름</th>
											<td>
												<input type="text" class="form-control form-control-sm" name="" />
											</td>
										</tr>
										<tr class="align-middle">
											<th>게시판 설명</th>
											<td>
												<textarea class="form-control" rows="3" name=""></textarea>
											</td>
										</tr>
										<tr class="align-middle">
											<th>게시판 사용</th>
											<td>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" name="" value="Y" checked>
													<label class="form-check-label">사용</label>
												</div>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" name="" value="N">
													<label class="form-check-label">미사용</label>
												</div>
											</td>
										</tr>
										<tr class="align-middle">
											<th>읽기 권한</th>
											<td>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" name="" value="Y" checked>
													<label class="form-check-label">전체 허용</label>
												</div>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" name="" value="N">
													<label class="form-check-label">개별 설정</label>
												</div>
											</td>
										</tr>
										<tr class="align-middle">
											<th>쓰기 권한</th>
											<td>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" name="" value="Y" checked>
													<label class="form-check-label">전체 허용</label>
												</div>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" name="" value="N">
													<label class="form-check-label">개별 설정</label>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
								<div class="text-end">
									<button class="btn btn-dark btn-xs">수정</button>
									<button class="btn btn-secondary btn-xs">취소</button>
									<button class="btn btn-primary btn-xs">신규 등록</button>
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