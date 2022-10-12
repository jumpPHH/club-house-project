<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<style type="text/css">
.selectDiv {
	background-color: #bfc9e3;
	color: white !important;
	text-decoration: underline;
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
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function () {
	
	var nowPage = "${pageContext.request.requestURI}".split('/')["${pageContext.request.requestURI}".split('/').length-1];

	var url1 = document.getElementById("student_indexPage");
	var url2 = document.getElementById("student_MemberJoinMgmtPage");
	
		if((url1.getAttribute("href").split('/'))[5]+".jsp" == nowPage){
			$("#student_indexPage").attr('class','selectDiv');
		
		}else if ((url2.getAttribute("href").split('/'))[5]+".jsp" == nowPage) {
			$("#student_MemberJoinMgmtPage").attr('class','selectDiv');
		}
});
</script>

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
				class="text-uppercase font-weight-bold"
				style="box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075) !important;">MENU</small>
		</button>

		<div class="row card box"
			style="width: 100%; height: 45px; margin-left: 0.1em; margin-bottom: 0.7em;">
			<div class="dashboard-card-bottom">
				<div class="row">

					<div class="col-1"></div>

					<div class="col">

						<div class="row ps-1 p-2 mb-2">
							<div class="col text-center">
								<div class="row"
									style="justify-content: center; border-right: 2px solid #ededed">
									<a id="student_indexPage"
										href="/cbh/student/findingclub/student_indexPage"
										class="col-auto px-3 aClick"
										style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none;">
										자유게시판 </a>
								</div>
							</div>

							<div class="col text-center">
								<div class="row" style="justify-content: center">
									<a id="student_MemberJoinMgmtPage" href="#"
										class="col-auto px-3 aClick"
										style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none; background-color: #bfc9e3; color: white !important; padding-left: 0px; padding-right: 0px; width: 60%;">
										자유게시판 작성 </a>
								</div>
							</div>
						</div>

					</div>
					<div class="col-1"></div>
				</div>
			</div>
		</div>


		<div class="card"
			style="width: 100%; height: auto; border-radius: 2%; box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075) !important; padding: 0px 15px;">
			<div class="dashboard-card-bottom">
				<!-- 실제 내용 -->

				<!-- 카테고리 박스 -->
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
									<form action="./student_writeClubBoardProcess" method="post"
										enctype="multipart/form-data">
										<div class="row px-4 mt-2">
											<div class="col">
												<!-- 작성자 -->
												<div class="row p-3 mt-2">
													<div class="col-3 pt-2">
														<span style="color: red;">*</span> 작성자
													</div>
													<div class="col pt-2">${writerName }</div>
												</div>
												<hr style="height: 1px; color: #adb5bd">
												<!-- 활동내역 제목. -->
												<div class="row p-3 mt-2">
													<div class="col-3 pt-2">
														<span style="color: red;">*</span> 제목
													</div>
													<div class="col">
														<input type="text" class="form-control"
															name="club_board_title">
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
															<div class="col text_align_left">
																<textarea class="form-control" style="height: 15vh"
																	name="club_board_content"></textarea>
															</div>
														</div>
													</div>
												</div>
												<!-- 파일 입력 박스 -->
												<div class="row p-3">
													<div class="col-3">
														<span>이미지 파일</span>
													</div>
													<div class="col">
														<div class="row">
															<div class="col text_align_left">
																<input type="file" name="club_board_image">
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<hr class="mt-3 hrSetting">
										<div class="row mt-5 mb-5">
											<div class="col" style="text-align: right;">
												<button class="btn"
													style="background-color: gray; color: white; width: 15em; height: 3em;">취소</button>
											</div>
											<div class="col" style="text-align: left;">
												<button type="submit" class="btn"
													style="background-color: #c4073d; color: white; width: 15em; height: 3em;">제출하기</button>
											</div>
										</div>
									</form>

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