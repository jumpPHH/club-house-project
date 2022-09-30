<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경비 신청내역 페이지</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="/cbh/resources/css/student_MainPage.css">

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
			style="width: 100%; height: auto; border-radius: 2%; box-shadow: 0 .125rem .25rem rgba(0,0,0,.075)!important;">
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
										style="font-size: 30px;">경비신청 내역 관리</span>
								</div>
							</div>

							<div class="row my-5">
								<div class="col-2" style="text-align: center;">
									<a
										href="/cbh/student/myclub/applicationexpenses/student_ApplicationExpensesPage"
										style="font-size: 19px;">신청서 작성</a>
								</div>
								<div class="col-1" style="text-align: center;">|</div>
								<div class="col-2" style="text-align: center;">
									<a
										href="/cbh/student/myclub/applicationexpenses/student_ApplicationExpensesListPage"
										style="font-size: 19px;">신청 내역</a>
								</div>

								<div class="col" style="text-align: center;">[검색 결과 :
									${ExpnsApplySelectCount }명]</div>
							</div>

							<div class="row">
								<table class="table">
									<thead>
										<tr>
											<th scope="col">#</th>
											<th scope="col">사용 목적</th>
											<th scope="col">경비 요청액</th>
											<th scope="col">신청 일자</th>
											<th scope="col">상태</th>
											<th scope="col">기타</th>
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

									<c:if test="${ClubExpnsApplyVO.size() > 0}">
										<c:forEach begin="0" end="${ClubExpnsApplyVO.size() -1}"
											var="i">
											<tbody>
												<tr>
													<th scope="row">${ClubExpnsApplyVO[i].ClubExpnsApplyVO.club_expns_apply_no}</th>
													<td>${ClubExpnsApplyVO[i].ClubExpnsApplyVO.club_expns_apply_purpose_use}</td>
													<td>${ClubExpnsApplyVO[i].ExpnsApplyGrants}원</td>
													<td><fmt:formatDate
															value="${ClubExpnsApplyVO[i].ClubExpnsApplyVO.club_expns_apply_date}"
															pattern="yy.MM.dd" /></td>
													<td>${ClubExpnsApplyVO[i].ClubExpnsApplyVO.club_expns_apply_state }</td>
													<td><c:if
															test="${ClubExpnsApplyVO[i].ClubExpnsApplyVO.club_expns_apply_state == '반려'}">
															<!-- Button trigger modal -->
															<button type="button" class="btn btn-secondary btn-sm"
																data-bs-toggle="modal" data-bs-target="#exampleModal"
																style="-bs-btn-padding-y: .25rem; - -bs-btn-padding-x: .5rem; - -bs-btn-font-size: .75rem;">사유보기</button>

															<!-- Modal -->
															<div class="modal fade" id="exampleModal" tabindex="-1"
																aria-labelledby="exampleModalLabel" aria-hidden="true">
																<div class="modal-dialog">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h5 class="modal-title" id="exampleModalLabel">반려
																				사유</h5>
																			<button type="button" class="btn-close"
																				data-bs-dismiss="modal" aria-label="Close"></button>
																		</div>
																		<div class="modal-body">
																			${ClubExpnsApplyVO[i].ClubExpnsApplyVO.club_expns_apply_reject_reason }
																		</div>
																		<div class="modal-footer">
																			<button type="button" class="btn btn-secondary"
																				data-bs-dismiss="modal">Close</button>
																		</div>
																	</div>
																</div>
															</div>

														</c:if></td>
												</tr>
											</tbody>
										</c:forEach>
									</c:if>
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