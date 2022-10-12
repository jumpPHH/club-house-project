<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous">
	
</script>

<style type="text/css">
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
    -webkit-transform: scale(1.1,1.1);
    -moz-transform: scale(1.1,1.1);
    -o-transform: scale(1.1,1.1);
    -ms-transform: scale(1.1,1.1);
    transform: scale(1.1,1.1);
}
</style>


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
		
		
	
		<div class="row card box"
			style="width: 100%; height: 45px; margin-left: 0.1em; margin-bottom: 1em;">
			<div class="dashboard-card-bottom">
				<div class="row">

					<div class="col-1"></div>

					<div class="col">

						<div class="row ps-1 p-2 mb-2">
							<div class="col text-center">
								<div class="row"
									style="justify-content: center; border-right: 2px solid #ededed">
									<a
										href="/cbh/student/myclub/clubactivities/student_indexPage"
										class="col-auto px-3" 
										style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none;">
										동아리 활동내역 </a>
								</div>
							</div>

							<div class="col text-center">
								<div class="row" style="justify-content: center">
									<a id="student_MemberShipFeeMgmtListPage"
										href="/cbh/student/myclub/clubactivities/student_writeClubActPage"
										class="col-auto px-3"
										style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none; background-color: #bfc9e3; color: white !important; padding-left: 0px; padding-right: 0px; width: 60%;">
										활동내역 작성 </a>
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
									<!-- 컨텐트 of 헤더 -->
									<div class="row page_title">
										<div class="col text_align_left pt-2" style="color: red">
											* 표시가 있는 항목들은 필수 입력항목입니다.</div>
									</div>


									<!-- 신청서 양식 시작 -->
									<form action="./student_writeClubActProcess" method="post">
										<div class="row px-4 mt-2"
											style="border: 1px solid #e2dede; border-radius: 5px;">
											<div class="col">
												<!-- 작성자 -->
												<div class="row p-3 mt-2">
													<div class="col-3 pt-2">
														<span style="color: red;">*</span> 작성자
													</div>
													<div class="col pt-2">동아리 회장</div>
												</div>
												<hr style="height: 1px; color: #adb5bd">
												<!-- 활동내역 제목. -->
												<div class="row p-3 mt-2">
													<div class="col-3 pt-2">
														<span style="color: red;">*</span> 제목
													</div>
													<div class="col">
														<input type="text" class="form-control"
															name="club_act_title">
													</div>
												</div>
												<hr style="height: 1px; color: #adb5bd">

												<!-- 동아리 설명 -->
												<div class="row p-3">
													<div class="col-3">
														<span style="color: red;">*</span> 내용
													</div>
													<div class="col">
														<div class="row">
															<div class="col">
																<textarea class="form-control" style="height: 15vh"
																	name="club_act_content"></textarea>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>

										<div class="row mt-5">
											<div class="col text_align_right" style="text-align:right;">
												<button class="btn"
													style="background-color: gray; color: white; width: 15em; height: 3em;"><a href="/cbh/student/myclub/clubactivities/student_indexPage" style="color:white; text-decoration:none">취소</a></button>
											</div>
											<div class="col" style="text-align:left;">
												<button type="submit" class="btn"
													style="background-color: #c4073d; color: white; width: 15em; height: 3em;">제출하기</button>
											</div>
										</div>
									</form>
									<hr class="mt-3 hrSetting">
									<div class="row">
										<div class="col text_align_right"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>