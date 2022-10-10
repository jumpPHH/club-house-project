<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경비 신청 페이지</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href=" https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<style type="text/css">
.title {
	background-color: #EBEBEB;
	text-align: center;
	font-weight: bold;
	padding: 20px;
	border-bottom: 2px solid #AEA9A9;
	border-right: 2px solid #AEA9A9;
}
.title-left {
	background-color: #EBEBEB;
	text-align: center;
	font-weight: bold;
	padding: 20px;
	border-bottom: 2px solid #AEA9A9;
	border-right: 2px solid #AEA9A9;
	border-left: 2px solid #AEA9A9;
}

.blank {
	background-color: #F7F7F7;
	font-weight: bold;
	padding: 20px;
	border-bottom: 2px solid #AEA9A9;
}

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
		<button id="sidebarCollapse" type="button"
			class="btn btn-light bg-white rounded-pill box px-4 mb-4">
			<small class="text-uppercase font-weight-bold">MENU</small>
		</button>


		<c:if test="${empty ClubBossInfo.IsBoss }">
			<link
				href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
				rel="stylesheet">
			<link rel="stylesheet" href="/cbh/resources/css/status.css">
			<div class="row my-5"
				style="width: 100%; height: 100%; padding-top: 100px;">
				<div class="col-1"></div>
				<div class="col">
					<div class="page-404">
						<div class="outer">
							<div class="middle">
								<div class="inner">
									<!--BEGIN CONTENT-->
									<a href="/cbh/student/myclub/main/student_MainPage" style="text-decoration: none;" class="inner-circle"><i
										class="fa fa-home"></i><span> 권한제한</span></a> <span
										class="inner-status">페이지 권한이 없습니다.</span> <span
										class="inner-detail"> 접속을 원하시면 권한을 부여받으십시요. </span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-1"></div>
			</div>
		</c:if>
	

		<c:if test="${not empty ClubBossInfo.IsBoss }">
						<div class="row card box" style="width: 100%; height: 45px;">
							<div class="dashboard-card-bottom">
								<div class="row">

									<div class="col-1"></div>

									<div class="col">

										<div class="row ps-1 p-2 mb-2">
											<div class="col text-center"
												style="border-right: 2px solid #ededed;">
												<div class="row" style="justify-content: center">
													<a id="student_ApplicationExpensesPage"
														href="/cbh/student/myclub/applicationexpenses/student_ApplicationExpensesPage"
														class="col-auto px-3 aClick"
														style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none;">
														신청서 작성 </a>
												</div>
											</div>

											<div class="col text-center">
												<div class="row" style="justify-content: center">
													<a id="student_ApplicationExpensesListPage"
														href="/cbh/student/myclub/applicationexpenses/student_ApplicationExpensesListPage"
														class="col-auto px-3 aClick"
														style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none;">
														신청 내역 </a>
												</div>
											</div>

											<div class="col text-center">
												<div class="row" style="justify-content: center">
													<span
														style="color: red; font-weight: bold; font-size: 12px;">
														<i class="bi bi-star-fill" style="color: red;"></i> 표시가 있는
														항목은 필수 입력 항목입니다.
													</span>
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

									<form
										action="/cbh/student/myclub/applicationexpenses/student_ApplicationExpensesRegistrationProcess"
										method="post">
										<div hidden="hidden">
											<input type="hidden" name="club_no"
												value="${ClubBossInfo.GetClubBossClubInfo.club_no}">
										</div>
										<div class="row">
											<div class="col-2"></div>
											<div class="col">
												<div class="row my-5">

													<div class="col"
														style="font-size: 23px; font-weight: bold; text-align: center;">동아리
														경비 신청서</div>
												</div>

												<div class="row" style="padding: 0px; margin: 0px;">

													<div class="row">
														<div class="col-3 title">동아리 명</div>
														<div class="col blank">${ClubBossInfo.GetClubBossClubInfo.club_name}</div>
													</div>

													<div class="row">
														<div class="col-3 title" style="padding-top: 80px;">회
															장</div>
														<div class="col">
															<div class="row">
																<div class="col-3 title">전 공</div>
																<div class="col-3 blank">${ClubBossInfo.GetClubBoss.stud_dept}</div>
																<div class="col-3 title-left">학 년</div>
																<div class="col-3 blank">${ClubBossInfo.GetClubBoss.stud_grade}</div>
															</div>

															<div class="row">
																<div class="col-3 title">학 번</div>
																<div class="col-3 blank">${ClubBossInfo.GetClubBoss.stud_id}</div>
																<div class="col-3 title-left">성 명</div>
																<div class="col-3 blank">${ClubBossInfo.GetClubBoss.stud_name}</div>
															</div>

															<div class="row">
																<div class="col-3 title">연 락 처</div>
																<div class="col blank">${ClubBossInfo.GetClubBoss.stud_phone}</div>
															</div>
														</div>
													</div>

													<div class="row">
														<div class="col-3 title"><i class="bi bi-star-fill" style="color: red; padding-right: 5px;"></i>회 원 수</div>
														<div class="col blank" style="background-color: white;">
															<input class="form-control" type="text"
																placeholder="회원수 입력" aria-label="default input example"
																name="club_expns_number_use">
														</div>
													</div>

													<div class="row">
														<div class="col-3 title"><i class="bi bi-star-fill" style="color: red; padding-right: 5px;"></i>경비 요청액</div>
														<div class="col blank" style="background-color: white;">
															<input class="form-control" type="text"
																placeholder="경비 요청액 입력"
																aria-label="default input example"
																name="club_expns_apply_grants">
														</div>
													</div>

													<div class="row">
														<div class="col-3 title"><i class="bi bi-star-fill" style="color: red; padding-right: 5px;"></i>사용 목적</div>
														<div class="col blank" style="background-color: white;">
															<input class="form-control" type="text"
																placeholder="사용 목적 입력"
																aria-label="default input example"
																name="club_expns_apply_purpose_use">
														</div>
													</div>

													<div class="row">
														<div class="col-3 title" style="padding-top: 40px;"><i class="bi bi-star-fill" style="color: red; padding-right: 5px;"></i>경비
															사용날짜</div>
														<div class="col blank"
															style="background-color: white; padding-bottom: 0px;">
															<input type="date" name="club_expns_apply_period_use"
																class="form-control" placeholder="날짜 설정">
														</div>
													</div>

													<div class="row my-5">
														<div class="col"
															style="text-align: center; font-weight: bold;">상기
															동아리 활동에 필요한 경비지원을 요청합니다.</div>
													</div>

													<div class="row">
														<div class="col"
															style="text-align: center; font-weight: bold;">
															<%=sf.format(nowTime)%>
														</div>
													</div>

													<div class="row">
														<div class="col"></div>
														<div class="col"></div>
														<div class="col-4"
															style="font-weight: bold; text-align: right;">
															신 청 자 : ${ClubBossInfo.GetClubBoss.stud_name} (인) <img
																style="width: 100px; transform: translate(-40%, -10%);"
																src="/cbh/resources/img/student/myclub/applicationexpenses/donue_signature.png">
														</div>
													</div>

													<div class="row my-3">
														<div class="col-8"
															style="font-size: 25px; font-weight: bold;">
															중앙정보처리학원 총장 귀하</div>

														<div class="col" style="text-align: right;">
															<button type="submit"
																class="btn btn-outline-danger btn-lg">신청하기</button>
														</div>
													</div>


												</div>
											</div>

											<div class="col-2"></div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</c:if>
				</div>

				<script type="text/javascript"
					src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script></body>
</html>