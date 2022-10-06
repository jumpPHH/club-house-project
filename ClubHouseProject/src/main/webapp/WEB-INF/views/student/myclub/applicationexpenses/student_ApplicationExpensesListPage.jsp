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
<style type="text/css">
.selectDiv {
	background-color: #bfc9e3;
	color: white !important;
	text-decoration: underline;
	padding-left: 0px;
    padding-right: 0px;
    width: 50%;
}

.aClick{
    display: inline-block;
    color: #03c;
    -webkit-transition: 0.5s;
    -moz-transition: 0.5s;
    -o-transition: 0.5s;
    -ms-transition: 0.5s;
    transition: 0.5s;
}

.aClick:hover {
    -webkit-transform: scale(1.15,1.15);
    -moz-transform: scale(1.15,1.15);
    -o-transform: scale(1.15,1.15);
    -ms-transform: scale(1.15,1.15);
    transform: scale(1.15,1.15);
}
</style>

<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function () {
	
	var nowPage = "${pageContext.request.requestURI}".split('/')["${pageContext.request.requestURI}".split('/').length-1];

	var url1 = document.getElementById("student_ApplicationExpensesPage");
	var url2 = document.getElementById("student_ApplicationExpensesListPage");
		
		if((url1.getAttribute("href").split('/'))[5]+".jsp" == nowPage){
			$("#student_ApplicationExpensesPage").attr('class','selectDiv');
		
		}else if ((url2.getAttribute("href").split('/'))[5]+".jsp" == nowPage) {
			$("#student_ApplicationExpensesListPage").attr('class','selectDiv');
		}
});
</script>
</head>
<body>
	<jsp:include
		page="/WEB-INF/views/student_common/student_navigationvar.jsp"></jsp:include>
		
	<!-- 페이지 내용 부분 시작 (이 부분만 카피해서 사용할것. 카피 후 삭제) -->
	<div class="page-content p-5" id="content">
		<!-- 토글 버튼 -->
		<button id="sidebarCollapse box" type="button"
			class="btn btn-light bg-white rounded-pill box px-4 mb-4">
			<small
				class="text-uppercase font-weight-bold">MENU</small>
		</button>
		
			<div class="row card box" style="width: 100%; height: 45px;">
				<div class="dashboard-card-bottom">
					<div class="row">

						<div class="col-1"></div>

						<div class="col">

							<div class="row ps-1 p-2 mb-2">
								<div class="col text-center"
									style="border-right: 2px solid #ededed;">
									<div class="row" style="justify-content: center">
										<a  id="student_ApplicationExpensesPage"
											href="/cbh/student/myclub/applicationexpenses/student_ApplicationExpensesPage"
											class="col-auto px-3 aClick"
											style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none;">
											신청서 작성 </a>
									</div>
								</div>

								<div class="col text-center" style="border-right: 2px solid #ededed;">
									<div class="row" style="justify-content: center">
										<a  id="student_ApplicationExpensesListPage"
											href="/cbh/student/myclub/applicationexpenses/student_ApplicationExpensesListPage"
											class="col-auto px-3 aClick" 
											style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none;">
											신청 내용 </a>
									</div>
								</div>

							<div class="col text-center">
								<div class="row" style="justify-content: center">
									<div class="col" style="text-align: center;">[검색 결과 :
										${ExpnsApplySelectCount }명]</div>
								</div>
							</div>

						</div>

						</div>

						<div class="col-1"></div>

					</div>

				</div>
			</div>
			
		<div class="row my-3 card box" style="width: 100%; height: auto;">
			<div class="dashboard-card-bottom">
				<!-- 실제 내용 -->
				<div class="container-fluid">
				
					<div class="row my-5">					
						<div class="col-1"></div>
						
						<div class="col">
						
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