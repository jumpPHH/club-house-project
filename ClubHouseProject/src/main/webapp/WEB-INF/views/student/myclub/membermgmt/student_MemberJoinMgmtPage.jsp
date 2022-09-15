<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 동아리 동아리원 관리 페이지</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="/cbh/resources/css/student_MainPage.css">
<style>
a {
	text-decoration: none;
	list-style-type: disc;
	list-style: none;
	margin-bottom: .5vh;
	color: #828282;
}

a:hover {
	font-weight: bold;
	color: #828282;
	letter-spacing: 0.05vw;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/student_common/student_header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/student_common/student_sidevar.jsp"></jsp:include>

	<div style="position: absolute; left: 13.5%; width: 86.5%; top: 14vh; height: 86vh; overflow-y: auto; word-break: break-all;">
		<div class="container-fluid">

			<div class="row">
				<div class="col-1"></div>
				
				<div class="col">
					<div class="row my-5">
						<div class="col">
							<i class="bi bi-person-video3"
								style="font-size: 40px; color: #EF1B3F;"></i> <span
								style="font-size: 30px;">동아리원 관리</span>
						</div>
					</div>

					<div class="row my-5">
						<div class="col-2" style="text-align: center;">
							<a href="/cbh/student/myclub/membermgmt/student_MemberMgmtPage" style="font-size: 19px;">전체 멤버 관리</a>
						</div>
						<div class="col-1" style="text-align: center;">|</div>
						<div class="col-2" style="text-align: center;">
							<a href="/cbh/student/myclub/membermgmt/student_MemberJoinMgmtPage" style="font-size: 19px;">가입 관리</a>
						</div>
						<div class="col"></div>
					</div>
					
				<div class="row">	
					<table class="table">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">아이디</th>
								<th scope="col">이름</th>
								<th scope="col">가입신청일</th>
								<th scope="col">성별</th>
								<th scope="col"></th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>stud01</td>
								<td>송성용</td>
								<td>2022-08-22</td>
								<td>남자</td>
								<td>
									<button type="button" class="btn btn-danger">가입 승인</button>
								</td>
								<td>
									<button type="button" class="btn btn-secondary">가입 거절</button>
								</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>stud02</td>
								<td>안요섭</td>
								<td>2022-08-22</td>
								<td>남자</td>
								<td>
									<button type="button" class="btn btn-danger">가입 승인</button>
								</td>
								<td>
									<button type="button" class="btn btn-secondary">가입 거절</button>
								</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td>stud03</td>
								<td>김찬우</td>
								<td>2022-08-22</td>
								<td>남자</td>
								<td>
									<button type="button" class="btn btn-danger">가입 승인</button>
								</td>
								<td>
									<button type="button" class="btn btn-secondary">가입 거절</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				
						<div class="row my-5">
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center pagination-lg">
									<li class="page-item disabled"><a class="page-link">Previous</a>
									</li>
									<li class="page-item"><a class="page-link" href="#">1</a></li>
									<li class="page-item"><a class="page-link" href="#">2</a></li>
									<li class="page-item"><a class="page-link" href="#">3</a></li>
									<li class="page-item"><a class="page-link" href="#">Next</a>
									</li>
								</ul>
							</nav>
						</div>
					</div>
					

					<div class="col-1"></div>

			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>