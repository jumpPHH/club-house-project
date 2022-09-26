<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회비관리 내역 페이지</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="/cbh/resources/css/student_MainPage.css">

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
</head>
<body>
	<jsp:include
		page="/WEB-INF/views/student_common/student_navigationvar.jsp"></jsp:include>
	<!-- 페이지 내용 부분 시작 (이 부분만 카피해서 사용할것. 카피 후 삭제) -->
	<div class="page-content p-5" id="content">
		<!-- 토글 버튼 -->
		<button id="sidebarCollapse" type="button"
			class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4">
			<i class="fa fa-bars mr-2"></i><small
				class="text-uppercase font-weight-bold" style="box-shadow: 0 .125rem .25rem rgba(0,0,0,.075)!important;">Toggle</small>
		</button>

		<div class="card"
			style="width: 100%; height: 60rem; border-radius: 2%; box-shadow: 0 .125rem .25rem rgba(0,0,0,.075)!important;">
			<div class="dashboard-card-bottom">
				<!-- 실제 내용 -->
				<div class="container-fluid">
					<div class="row">
						<div class="col-1"></div>

						<div class="col">
							<div class="row my-5">
								<div class="col">
									<i class="bi bi-cash-coin"
										style="font-size: 40px; color: #EF1B3F;"></i> <span
										style="font-size: 30px;">회비 내역</span>
								</div>
							</div>

							<div class="row my-5">
								<div class="col-2" style="text-align: center;">
									<a
										href="/cbh/student/myclub/membershipfeemgmt/student_MemberShipFeeMgmtPage"
										style="font-size: 19px;">회비 내역 작성</a>
								</div>
								<div class="col-1" style="text-align: center;">|</div>
								<div class="col-2" style="text-align: center;">
									<a
										href="/cbh/student/myclub/membershipfeemgmt/student_MemberShipFeeMgmtListPage"
										style="font-size: 19px;">회비 내역</a>
								</div>
							</div>

							<div class="row">
								<table class="table">
									<thead>
										<tr>
											<th scope="col">#</th>
											<th scope="col">구 분</th>
											<th scope="col">상세 내역</th>
											<th scope="col">수 입</th>
											<th scope="col">지 출</th>
											<th scope="col">사용 날짜</th>
											<th scope="col">작성일</th>
											<th scope="col">비고</th>
										</tr>
									</thead>

									<c:if test="${ClubExpnsApplyVO.size() == 0}">
										<tbody>
											<tr>
												<th scope="row"></th>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</c:if>


											<tbody>
												<tr>
													<th scope="row">1</th>
													<td>1</td>
													<td>1</td>
													<td>1</td>
													<td>1</td>
													<td>1</td>
													<td>1</td>
													<td>1</td>
												</tr>
											</tbody>
	
								</table>
							</div>


							<form
								action="/cbh/student/myclub/applicationexpenses/student_ApplicationExpensesListPage"
								method="get">
								<div class="row my-5">
									<div class="col">
										<h6
											style="font-size: 15px; color: #333; font-weight: bold; margin-top: 20px;">검색어</h6>
									</div>

									<div class="col">
										<div class="form-floating">
											<select name="searchType" class="form-select"
												id="floatingSelect"
												aria-label="Floating label select example"
												style="font-size: 15px; color: #333; font-weight: bold; padding: 10px;">
												<option selected value="content">내용</option>
											</select>
										</div>
									</div>

									<div class="col-6">
										<div class="form-floating">
											<textarea name="searchWord" class="form-control"
												placeholder="Leave a comment here" id="floatingTextarea"></textarea>
											<label for="floatingTextarea" style="font-size: 15px;">검색어를
												입력해주세요.</label>
										</div>
									</div>

									<div class="col">
										<button type="submit" class="btn btn-primary btn-lg"
											style="height: 60px; font-size: 15px;">
											<i class="bi bi-search">검색</i>
										</button>
									</div>
								</div>
							</form>


							<div class="row my-5">
								<nav aria-label="Page navigation example">
									<ul class="pagination justify-content-center pagination-lg">
										<c:choose>
											<c:when test="${startPage <= 1}">
												<li class="page-item disabled"><a class="page-link"
													style="text-decoration-line: none; color: red;">◀</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item disabled"><a class="page-link"
													style="text-decoration-line: none; color: black;"
													href="/cbh/student/myclub/applicationexpenses/student_ApplicationExpensesListPage?pageNum=${startPage -1}">◀</a></li>
											</c:otherwise>
										</c:choose>

										<c:forEach begin="${startPage}" end="${endPage}" var="i">
											<c:choose>
												<c:when test="${i == currentPageNum}">
													<li class="page-item"><a class="page-link"
														style="text-decoration-line: none; color: blue; font-weight: 600;"
														href="/cbh/student/myclub/applicationexpenses/student_ApplicationExpensesListPage?pageNum=${i}">${i}</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link"
														style="text-decoration-line: none; color: black;"
														href="/cbh/student/myclub/applicationexpenses/student_ApplicationExpensesListPage?pageNum=${i}">${i}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>

										<c:choose>
											<c:when test="${endPage >= totalPageCount }">
												<li class="page-item"><a class="page-link"
													style="text-decoration-line: none; color: red;">▶</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link"
													style="text-decoration-line: none; color: black;"
													href="/cbh/student/myclub/applicationexpenses/student_ApplicationExpensesListPage?pageNum=${endPage +1}">▶</a></li>
											</c:otherwise>
										</c:choose>

									</ul>
								</nav>
							</div>


						</div>
						<div class="col-1"></div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>