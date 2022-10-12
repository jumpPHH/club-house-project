<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 페이지</title>

<style type="text/css">
.selectDiv {
	background-color: #bfc9e3;
	color: white !important;
	padding-left: 0px;
	padding-right: 0px;
	width: 60%;
}

.aClick {
	display: inline-block;
	color: #03c;
	-webkit-transition: 0.5s;
	-moz-transition: 0.5s;
	-o-transition: 0.5s;
	-ms-transition: 0.5s;
	transition: 0.5s;
}

.aClick:hover {
	-webkit-transform: scale(1.1, 1.1);
	-moz-transform: scale(1.1, 1.1);
	-o-transform: scale(1.1, 1.1);
	-ms-transform: scale(1.1, 1.1);
	transform: scale(1.1, 1.1);
}
</style>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
</head>
<body>
	<jsp:include
		page="/WEB-INF/views/student_common/student_navigationvar.jsp"></jsp:include>

	<!-- 페이지 내용 부분 시작 (이 부분만 카피해서 사용할것. 카피 후 삭제) -->
	<div class="page-content p-5" id="content">
		<!-- 토글 버튼 -->
		<button id="sidebarCollapse" type="button"
			class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4">
			<small class="text-uppercase font-weight-bold">MENU</small>
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
									<a id="student_MemberMgmtPage"
										href="/cbh/student/volunteer/stud_VlntrApplPage"
										class="col-auto px-3 aClick"
										style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none;">
										봉사 공고 </a>
								</div>
							</div>						
							<div class="col text-center">
								<div class="row" style="justify-content: center">
									<a id="student_MemberMgmtPage"
										href="/cbh/student/volunteer/stud_DetailVlntrApplPage?vlntr_noti_no=${vlntrMap.vlntrNotiVo.vlntr_noti_no}"
										class="col-auto px-3 aClick"
										style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none; background-color: #bfc9e3; color: white !important; padding-left: 0px; padding-right: 0px; width: 30%;">
										공고 보기</a>
								</div>
							</div>
						</div>
					</div>	
					<div class="col-1"></div>
					
				 </div>	
			</div>
		</div>

			<div class="row my-3 card box" style="width: 100%; height: auto;">

				<div class="row mt-5" style="height: 100px">
					<div class="col-1"></div>
					<div class="col-7">
						<div class="row">
							<div class="col">
								<div class="row">
									<div class="col-auto text-start">
										<h1>${vlntrMap.vlntrNotiVo.vlntr_title }</h1>
									</div>
									<div class="col-auto mt-3">
										<c:choose>
											<c:when
												test="${vlntrMap.vlntrNotiVo.vlntr_noti_state eq 'N'}">
												<h4 style="color: orange">( 모집중 )</h4>
											</c:when>
											<c:when
												test="${vlntrMap.vlntrNotiVo.vlntr_noti_state eq 'Y'}">
												<h4 style="color: blue">( 마감 )</h4>
											</c:when>
										</c:choose>
									</div>

								</div>
							</div>
						</div>



					</div>
					<div class="col"></div>

				</div>
				<div class="row">
					<div class="col-9"></div>
					<div class="col-3">
						<c:choose>
							<c:when test="${vlntrMap.vlntrNotiVo.vlntr_noti_state eq 'N'}">
								<c:if test="${myApplExist.myVlntrAppleCount eq '1'}">
									<button type="button" class="btn" style="color: red"
										data-bs-toggle="modal" data-bs-target="#exampleModal">
										<i class="bi bi-hand-index-thumb"></i>신청철회
									</button>

									<!-- Button trigger modal -->
									<div class="modal fade" id="exampleModal" tabindex="-1"
										aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">${vlntrMap.vlntrNotiVo.vlntr_title}</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<form action="./stud_VlntrApplDeleteProcess" method="post">
													<div class="modal-body">
														<input type="hidden" name="vlntr_noti_no"
															value="${vlntrMap.vlntrNotiVo.vlntr_noti_no }">
														봉사신청을 철회하겠습니까?
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">취소</button>
														<button type="submit" class="btn btn-primary">철회</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${myApplExist.myVlntrAppleCount eq '0'}">
									<!-- Modal -->
									<button type="button" class="btn" style="color: purple"
										data-bs-toggle="modal" data-bs-target="#exampleModal">
										<i class="bi bi-hand-index-thumb"></i>신청하기
									</button>

									<!-- Button trigger modal -->
									<div class="modal fade" id="exampleModal" tabindex="-1"
										aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">${vlntrMap.vlntrNotiVo.vlntr_title}</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<form action="./stud_DetailVlntrApplProcess" method="post">
													<div class="modal-body">
														<input type="hidden" name="vlntr_noti_no"
															value="${vlntrMap.vlntrNotiVo.vlntr_noti_no }">
														신청하시겠습니까?
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">취소</button>
														<button type="submit" class="btn btn-primary">신청</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</c:if>

							</c:when>
							<c:when test="${vlntrMap.vlntrNotiVo.vlntr_noti_state eq 'Y'}">
								<c:if test="${myApplExist.myVlntrAppleCount eq '1'}">
									<button type="button" class="btn btn-outline-primary"
										data-bs-toggle="modal" data-bs-target="#exampleModal">
										신청철회</button>

									<!-- Button trigger modal -->
									<div class="modal fade" id="exampleModal" tabindex="-1"
										aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">${vlntrMap.vlntrNotiVo.vlntr_title}</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<form action="./stud_VlntrApplDeleteProcess" method="post">
													<div class="modal-body">
														<input type="hidden" name="vlntr_noti_no"
															value="${vlntrMap.vlntrNotiVo.vlntr_noti_no }">
														봉사신청을 철회하겠습니까?
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">취소</button>
														<button type="submit" class="btn btn-primary">철회</button>
													</div>
												</form>
											</div>
										</div>
									</div>
								</c:if>
								<c:if test="${myApplExist.myVlntrAppleCount eq '0'}">

								</c:if>
							</c:when>
						</c:choose>
						<button type="button" style="font-size: 22px" class="btn">
							<i class="bi bi-bookmark"></i>
						</button>
						<button type="button" style="font-size: 22px" class="btn">
							<i class="bi bi-share"></i>
						</button>
					</div>
				</div>
				<div class="row mt-4">
					<div class="col-1"></div>
					<div class="col-10">
						<div class="row">
							<table class="table">
								<%-- 							<colgroup> --%>
								<%-- 								<col width="20%"> --%>
								<%-- 								<col width="20%"> --%>
								<%-- 								<col width="20%"> --%>
								<%-- 								<col width="20%"> --%>
								<%-- 							</colgroup> --%>
								<tbody class="table-group-divider">
									<tr>
										<th scope="col"
											style="text-align: center; background-color: rgb(240, 233, 233); width: 100px">봉사구분</th>
										<td scope="col"
											style="width: 200px; font-size: 16px; color: grey;">${vlntrMap.vlntrDivVo.vlntr_div_name }</td>
										<th scope="col"
											style="text-align: center; background-color: rgb(240, 233, 233); width: 100px">봉사구분</th>
										<td scope="col"
											style="width: 200px; font-size: 16px; color: grey;">${vlntrMap.vlntrNotiVo.vlntr_title }</td>
										<th scope="col"
											style="text-align: center; background-color: rgb(240, 233, 233); width: 100px">봉사시간</th>
										<td scope="col"
											style="width: 200px; font-size: 16px; color: grey;">${vlntrMap.vlntrNotiVo.vlntr_srvc_time }시간</td>
									</tr>
									<tr>
										<th scope="col"
											style="text-align: center; background-color: rgb(240, 233, 233); width: 100px">모집시작일</th>
										<td scope="col"
											style="width: 200px; font-size: 16px; color: grey;"><fmt:formatDate
												value="${vlntrMap.vlntrNotiVo.vlntr_st_date }"
												pattern="yy.MM.dd" /></td>
										<th scope="col"
											style="text-align: center; background-color: rgb(240, 233, 233); width: 100px">모집종료일</th>
										<td scope="col"
											style="width: 200px; font-size: 16px; color: grey;"><fmt:formatDate
												value="${vlntrMap.vlntrNotiVo.vlntr_end_date }"
												pattern="yy.MM.dd" /></td>
										<th scope="col"
											style="text-align: center; background-color: rgb(240, 233, 233); width: 100px">모집인원수</th>
										<td scope="col"
											style="width: 200px; font-size: 16px; color: grey;">${vlntrMap.vlntrNotiVo.vlntr_fixed_people }명</td>
									</tr>
									<tr>
										<th scope="col"
											style="text-align: center; background-color: rgb(240, 233, 233); width: 100px">기관명</th>
										<td scope="col"
											style="width: 200px; font-size: 16px; color: grey;">${vlntrMap.vlntrNotiVo.vlntr_spot }</td>
										<th scope="col"
											style="text-align: center; background-color: rgb(240, 233, 233); width: 100px">공고자</th>
										<td scope="col"
											style="width: 200px; font-size: 16px; color: grey;">행정직원</td>
										<th scope="col"
											style="text-align: center; background-color: rgb(240, 233, 233); width: 100px">확인자</th>
										<td scope="col"
											style="width: 200px; font-size: 16px; color: grey;">${vlntrMap.vlntrNotiVo.vlntr_checker }</td>
									</tr>
									<tr>
										<th scope="col"
											style="text-align: center; background-color: rgb(240, 233, 233); width: 100px">봉사
											집합 시간</th>
										<td scope="col"
											style="width: 200px; font-size: 16px; color: grey;">${vlntrMap.vlntrNotiVo.vlntr_mtng_time }</td>
										<th scope="col"
											style="text-align: center; background-color: rgb(240, 233, 233); width: 100px">활동장소</th>
										<td scope="col"
											style="width: 200px; font-size: 16px; color: grey;">${vlntrMap.vlntrNotiVo.vlntr_spot }</td>
										<th scope="col" style="width: 100px"></th>
										<td scope="col" style="width: 200px;"></td>
									</tr>
									<tr>
										<th scope="col"
											style="text-align: center; background-color: rgb(240, 233, 233); width: 100px">활동내용</th>
										<td scope="col"
											style="width: 200px; font-size: 16px; color: grey;">${vlntrMap.vlntrNotiVo.vlntr_content }</td>
										<th scope="col" style="width: 100px"></th>
										<td scope="col" style="width: 200px;"></td>
										<th scope="col" style="width: 100px"></th>
										<td scope="col" style="width: 200px;"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="col-1"></div>




				</div>
				<div class="row mt-3">
					<div class="col-1"></div>
					<div class="col-10" style="padding: 0;">
						<div class="row">
							<img class="img-fluid"
								src="/uploadFiles/ClubHouseProject/student/2022/09/30/KakaoTalk_20221012_191339304.png"
								style="width: 100%; height: 100%;"><br>
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
