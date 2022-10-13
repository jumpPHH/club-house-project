<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous">
	
</script>
<style type="text/css">
	.selectDiv {
	background-color: #bfc9e3;
	color: white !important;
	padding-left: 0px;
    padding-right: 0px;
    width: 60%;
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

	<!-- 페이지 내용 부분 시작 (이 부분만 카피해서 사용할것. 카피 후 삭제) -->
	<div class="page-content p-5" id="content">
		<!-- 토글 버튼 -->
		<button id="sidebarCollapse" type="button"
			class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4">
			<i class="fa fa-bars mr-2"></i><small
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
									<a href="/cbh/student/establishingclub/student_indexPage"
										class="col-auto px-3" 
										style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none;">
										신청서 작성 </a>
								</div>
							</div>

							<div class="col text-center">
								<div class="row" style="justify-content: center">
									<a
										href="/cbh/student/establishingclub/student_establishingClubResultPage?stud_id=${sessionUserInfo.stud_id }"
										class="col-auto px-3"
										style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none; background-color: #bfc9e3; color: white !important; padding-left: 0px; padding-right: 0px; width: 60%;">
										동아리 신청 상태 </a>
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
					<div class="row">
						<div class="col">

							<!-- 여기다 작성하세요 -->
							<div class="row">
								<div class="col" id="content">
									<!-- 컨텐트 of 헤더 -->
									<div class="row page_title px-4">
										<div class="col text_align_left pt-2" style="color: red">
											* 표시가 있는 항목들은 필수 입력항목입니다.</div>
										<div class="col-4 page_title_text"></div>
									</div>


									<!-- 신청서 양식 시작 -->
									<form action="./student_writeClubInfoProcess"
										enctype="multipart/form-data" method="post">
										<div class="row px-4 mt-2">
											<div class="col">
												<!-- 동아리 타이틀 이미지. -->
												<div class="row p-3">
													<div class="col-3 pt-2">
														<span style="color: red;">*</span> 동아리 타이틀 이미지
													</div>
													<div class="col">
														우리 동아리를 표현할 이미지를 선택해주세요
														<div class="row">
															<div class="col text_align_left mt-2">
																<input type="file" name="title_image">
															</div>
														</div>
													</div>
												</div>
												<hr style="height: 1px; color: #adb5bd">

												<!-- 동아리 설명 -->
												<div class="row p-3">
													<div class="col-3 pt-2">
														<span style="color: red;">*</span> 동아리 설명
													</div>
													<div class="col">
														<div class="row">
															<div class="col text_align_left mt-2">
																<textarea class="form-control" style="height: 15vh"
																	name="club_description"></textarea>
															</div>
														</div>
													</div>
												</div>
												<hr style="height: 1px; color: #adb5bd">

												<!-- 동아리 설명 이미지 -->
												<div class="row p-3">
													<div class="col-3 pt-2">
														<span style="color: red;">*</span> 동아리 설명 이미지
													</div>
													<div class="col">
														<div class="row">
															<div class="col text_align_right mt-2">
																<span style="color: red">이미지는 하나만 첨부 가능합니다</span> <input
																	type="file" name="dscrp_image">
															</div>
														</div>
													</div>
												</div>
												<hr style="height: 1px; color: #adb5bd">
											</div>
										</div>

										<div class="row mt-5">
	
											<div class="col" style="text-align: center">

											<div class="col" style="text-align: right">
												<button class="btn" 
													 style="background-color: gray; color: white; width: 15em; height: 3em;"><a href="/cbh/student/establishingclub/student_establishingClubResultPage" style="color:white; text-decoration:none">취소</a></button>
											</div>
											<div class="col" style="text-align: left">

												<button type="submit" class="btn"
													style="background-color: #c4073d; color: white; width: 15em; height: 3em;">제출하기</button>
											</div>
										</div>
									</form>
									<div class="row mb-3">
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