<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="/cbh/resources/css/student_navbar.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous">
	
</script>
<script>

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
										style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none; background-color: #bfc9e3; color: white !important; padding-left: 0px; padding-right: 0px; width: 60%;">
										신청서 작성 </a>
								</div>
								</div>

								<div class="col text-center">
									<div class="row" style="justify-content: center">
										<a
											href="/cbh/student/establishingclub/student_establishingClubResultPage?stud_id=${sessionUserInfo.stud_id }"
											class="col-auto px-3" 
											style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none;">
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
					<div class="row">
						<div class="col" id="content">
							<!-- 컨텐트 of 헤더 -->
							<div class="row page_title">
								
								<div class="col text_align_left pt-2" style="color: red; margin-left:2.4em;">
									* 표시가 있는 항목들은 필수 입력항목입니다.</div>
							</div>


							<!-- 신청서 양식 시작 -->
							<form action="./student_requestEstablishClubProcess"
								method="post">
								<div class="row px-4 mt-4">
									<div class="col">
										<!-- 동아리 카테고리 -->
										<div class="row p-3">
											<div class="col-3 pt-2">
												<span style="color: red;">*</span> 동아리 카테고리
											</div>
											<div class="col">
												<select class="form-control" aria-label="Default select example" name="club_category_no">
												  <option selected>카테고리를 선택해주세요</option>
												  <option value="1">공연예술분과</option>
												  <option value="2">종교분과</option>
												  <option value="3">체육분과</option>
												  <option value="4">사회활동분과</option>
												  <option value="5">창작예술분과</option>
												  <option value="6">기타분과</option>
												  <option value="7">학술교양분과</option>
												</select>
											</div>
										</div>
										<hr style="size: 1px; color: #adb5bd">
										
										<!-- 동아리 이름 -->
										<div class="row p-3">
											<div class="col-3 pt-2">
												<span style="color: red;">*</span> 동아리 이름
											</div>
											<div class="col">
												<input type="text" class="form-control" name="club_name"
													id="club_name" placeholder="동아리 이름을 입력해주세요">
											</div>
										</div>
										<hr style="size: 1px; color: #adb5bd">

										<!-- 동아리 신청 회원수 -->
										<div class="row p-3">
											<div class="col-3 pt-2">
												<span style="color: red;">*</span> 동아리 신청 회원수
											</div>
											<div class="col mb-3">
												<input type="text" class="form-control" style="width: 100%"
													name="club_appl_people_count" placeholder="동아리 인원을 입력해주세요">
											</div>
										</div>

										<!-- 동아리 분류  -->

										<!-- 동아리 설립 및 목적 -->
										<hr style="height: 1px; color: #adb5bd">
										<div class="row p-3">
											<div class="col-3 pt-2">
												<span style="color: red;">*</span> 동아리 설립 및 목적
											</div>
											<div class="col">
												<div class="row">
													<div class="col text_align_left mt-2">
														<textarea class="form-control" style="height: 15vh"
															name="club_purpose"></textarea>
													</div>
												</div>
											</div>
										</div>
										<hr style="height: 1px; color: #adb5bd">
									</div>
								</div>

								<div class="row mt-5">
									<div class="col text_align_right" style="text-align:right;">
										<button class="btn"
											style="background-color: gray; color: white; width: 15em; height: 3em;" onclick="location.href='/cbh/student/index/student_IndexPage'">취소</button>
									</div>
									<div class="col" style="text-align:left;">
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
	<!-- 실제 내용 -->


	<!-- 여기다 작성하세요 -->






</body>
</html>