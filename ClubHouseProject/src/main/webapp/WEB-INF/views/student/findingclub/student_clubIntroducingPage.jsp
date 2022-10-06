<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="/cbh/resources/css/student_navbar.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous">
	
</script>

<style type="text/css">
.selectDiv {
	background-color: #bfc9e3;
	color: white;
}

a:hover {
	color: white !important;
	text-decoration: underline;
}
</style>

<script type="text/javascript">
	function clickMove(target) {
		$(".selectDiv").removeClass("selectDiv");
		target.classList.toggle('selectDiv');
	}
</script>

<title>Insert title here</title>
</head>
<body>
	<jsp:include
		page="/WEB-INF/views/student_common/student_navigationvar.jsp"></jsp:include>

	<div class="page-content p-5" id="content">
		<!-- 토글 버튼 -->
		<button id="sidebarCollapse" type="button"
			class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4">
			<i class="fa fa-bars mr-2"></i><small
				class="text-uppercase font-weight-bold"
				style="box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075) !important;">Toggle</small>
		</button>

		<div class="row card box" style="width: 100%; height: 45px; margin-left:0.1em; margin-bottom:1em;">
				<div class="dashboard-card-bottom">
					<div class="row">

						<div class="col-1"></div>

						<div class="col">

							<div class="row ps-1 p-2 mb-2">
								<div class="col text-center">
									<div class="row" style="justify-content: center">
										<a
											href="/cbh/student/myclub/membermgmt/student_MemberMgmtPage"
											class="col-auto px-3" onmouseover="clickMove(this)"
											style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none;">
											동아리 찾기 </a>
									</div>
								</div>
							</div>
						</div>
						<div class="col-1"></div>
					</div>
				</div>
			</div>
		
		

		<div class="card"
			style="width: 100%; height: auto; border-radius: 15px; box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075) !important; padding: 30px;">
			<div class="dashboard-card-bottom">
				<!-- 실제 내용 -->

				<div class="container-fluid">
					<div class="row">
						<div class="col">

							<!-- 여기다 작성하세요 -->
							<div class="row">
								<div class="col" id="content">
									<!-- 카테고리 제목 -->
									<div class="row">
										<div class="col text_align_center"
											style="margin-top: 7vh; text-align: center">
											<c:choose>
												<c:when test="${clubData.club_category_no eq 1 }">
													<h2 style="font-weight: bold;">공연예술분과</h2>
												</c:when>
												<c:when test="${clubData.club_category_no eq 2 }">
													<h2 style="font-weight: bold;">종교분과</h2>
												</c:when>
												<c:when test="${clubData.club_category_no eq 3 }">
													<h2 style="font-weight: bold;">체육분과</h2>
												</c:when>
												<c:when test="${clubData.club_category_no eq 4 }">
													<h2 style="font-weight: bold;">사회활동분과</h2>
												</c:when>
												<c:when test="${clubData.club_category_no eq 5 }">
													<h2 style="font-weight: bold;">창작예술분과</h2>
												</c:when>
												<c:when test="${clubData.club_category_no eq 6 }">
													<h2 style="font-weight: bold;">학술교양분과</h2>
												</c:when>
												<c:when test="${clubData.club_category_no eq 7 }">
													<h2 style="font-weight: bold;">기타분과</h2>
												</c:when>
											</c:choose>
											<h2 style="font-weight: bold;"></h2>
										</div>
									</div>


									<!-- 진짜 컨텐트 -->
									<div class="row px-4 mt-5">
										<!-- 타이틀 이미지 부분 -->
										<div class="col-4 mt-5">
											<img src="${clubData.club_title_image }"
												style="width: 16em; height: 20em;">
										</div>
										<!-- 동아리 발행연도, 연락처, 대표자명 등 정보 박스 -->
										<div class="col mt-5">
											<div class="row">
												<div class="col">
													<span style="font-weight: bold; font-size: 2.5em">${clubData.club_name }</span>
													<!-- ${clubData.club_name } -->
												</div>
											</div>
											<hr style="size: 1px; color: black; border: 1px solid gray;">
											<div class="row">
												<div class="col">
													<div class="row" style="margin-top: 1em; font-size: 1.3em;">
														<div class="col">
															<span style="font-weight: bold; margin-right: 2em;">동아리
																설립일자</span> <span style="color: gray;"><fmt:formatDate
																	value="${clubData.club_estbl_dt }" pattern="yyyy-MM-dd" /></span>
														</div>
														<div class="col">
															<span style="font-weight: bold; margin-right: 2em;">동아리
																회장</span> <span style="color: gray;">${clubData.club_boss }</span>
														</div>
													</div>
													<div class="row" style="margin-top: 1em; font-size: 1.3em">
														<div class="col">
															<span style="font-weight: bold; margin-right: 2em;"><span>연</span><span
																style="margin-left: 1.9em;">락</span><span
																style="margin-left: 1.9em;">처</span></span> <span
																style="color: gray; margin-left: 3px">${clubBossData.stud_phone}</span>
														</div>
														<div class="col"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- 동아리 설명 -->
									<div class="row px-4 mt-5"
										style="border-top: 1px solid #adb5bd">
										<!--  style="border-top: 1px solid #adb5bd; -->
										<div class="col mt-5">
											<span>${clubData.club_description }</span>
										</div>
									</div>
									<!-- 동아리 설명 이미지 -->
									<div class="row px-4 mt-5">
										<div class="col">
											<img src="/uploadFiles/${clubData.club_dscrp_image }">
										</div>
									</div>
									<!-- 동아리 가입신청 및 목록 돌아가기 버튼 -->
									<div class="row px-4 mt-5">
										<div class="col text_align_right">
											<button type="button" class="btn btn-danger"
												style="color: white"
												onclick="location.href='./student_clubRequestJoinProcess?club_no=${clubData.club_no}'">가입신청</button>
											<button type="button" class="btn btn-primary"
												style="color: white"
												onclick="location.href='./student_clubsOfCategoryPage?club_category_no=${clubData.club_category_no}'">목록</button>
										</div>
									</div>

									<hr class="mt-3 px-4 mt-5" style="height: 1px;">
									<div class="row">
										<div class="col text_align_right"></div>
									</div>
								</div>
								<input id="clubCategoryNo" type="hidden"
									value="${clubCategoryNo }">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>