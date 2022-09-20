<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경비 신청 페이지</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="/cbh/resources/css/student_MainPage.css">
<style type="text/css">

.title {
	background-color: #EBEBEB;
	text-align: center;
	font-weight: bold;
	padding: 20px;
	border-bottom: 2px solid #AEA9A9;
	border-right: 2px solid #AEA9A9;
}

.blank{
	background-color: #F7F7F7;
	font-weight: bold;
	padding: 20px;
	border-bottom: 2px solid #AEA9A9;
}

.blank-bottom{
	background-color: #F7F7F7;
	font-weight: bold;
	padding: 20px;
	border-bottom: 2px solid #AEA9A9;
}


</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/student_common/student_header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/student_common/student_sidevar.jsp"></jsp:include>
	
	<div
		style="position: absolute; left: 13.5%; width: 86.5%; top: 14vh; height: 86vh; overflow-y: auto; word-break: break-all;">
		<div class="container-fluid">
			<div class="row">
				<div class="col-1"></div>
				<div class="col">
				
					<div class="row my-5">
						<div class="col">
							<i class="bi bi-chat-left-text-fill"
								style="font-size: 40px; color: #EF1B3F;"></i> <span
								style="font-size: 30px;">경비신청</span>
						</div>
					</div>

					<div class="row my-5">
						<div class="col-2" style="text-align: center;">
							<a href="/cbh/student/myclub/applicationexpenses/student_ApplicationExpensesPage"
								style="font-size: 19px;">신청서 작성</a>
						</div>
						<div class="col-1" style="text-align: center;">|</div>
						<div class="col-2" style="text-align: center;">
							<a
								href="/cbh/student/myclub/applicationexpenses/student_ApplicationExpensesListPage"
								style="font-size: 19px;">신청 내역</a>
						</div>
					</div>
					
					<div class="row my-2">
						<div class="col">
							<span style="color: red; font-weight: bold; font-size: 12px;">
							<i class="bi bi-star-fill" style="color: red;"></i>
								표시가 있는 항목은 필수 입력 항목입니다.
							</span>
						</div>
					</div>
					
				</div>
				<div class="col-1"></div>
			</div>
			
			<div class="row">
				<div class="col-2"></div>
				<div class="col">
						<div class="row my-3">

						<div class="col" style="font-size: 23px; font-weight: bold; text-align: center;">동아리 경비 신청서</div>
					</div>
				
					<div class="row my-3" style="padding: 0px; margin: 0px;">
						
						<div class="row" style="padding: 0px; margin: 0px;">
							<div class="row">
								<div class="col-3 title" style="border-left: 2px solid #302F2F; border-top: 2px solid #302F2F;">동아리 명</div>
								<div class="col blank-bottom" style="border-right: 2px solid #302F2F; border-top: 2px solid #302F2F;">공 백</div>
							</div>
							
							<div class="row">
								<div class="col-3 title" style="padding-top: 80px; border-left: 2px solid #302F2F;">회 장</div>
								<div class="col">
									<div class="row title">전 공</div>
									<div class="row title">학 번</div>
									<div class="row title">연 락 처</div>
								</div>
								<div class="col">
									<div class="row blank">공백</div>
									<div class="row blank">공백</div>
									<div class="row blank">공백</div>
								</div>
								<div class="col"
									style="border-bottom: 2px solid #AEA9A9; background-color: #F7F7F7;">
									<div class="row title" style="border-left: 2px solid #AEA9A9;">학 년</div>
									<div class="row title" style="border-left: 2px solid #AEA9A9;">성 명</div>
								</div>
								<div class="col" style="border-bottom: 2px solid #AEA9A9; background-color: #F7F7F7; border-right: 2px solid #302F2F;">
									<div class="row blank">공백</div>
									<div class="row blank">공백</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-3 title" style="border-left: 2px solid #302F2F;">회 원 수</div>
								<div class="col blank" style="border-right: 2px solid #302F2F;">공 백</div>
							</div>
							
							<div class="row">
								<div class="col-3 title" style="border-left: 2px solid #302F2F;">활동내용</div>
								<div class="col blank" style="border-right: 2px solid #302F2F;">공 백</div>
							</div>
							
							<div class="row">
								<div class="col-3 title" style="border-left: 2px solid #302F2F;">경비 요청액</div>
								<div class="col blank" style="border-right: 2px solid #302F2F;">공 백</div>
							</div>
							
							<div class="row">
								<div class="col-3 title" style="border-left: 2px solid #302F2F;">사용목적</div>
								<div class="col blank" style="border-right: 2px solid #302F2F;">공 백</div>
							</div>
							
							<div class="row">
								<div class="col-3 title" style="border-left: 2px solid #302F2F;">경비 사용기간</div>
								<div class="col blank" style="border-right: 2px solid #302F2F;">공 백</div>
							</div>
							
						<div class="row my-5">
							<div class="col" style="text-align: center; font-weight: bold; ">
							상기 동아리 활동에 필요한 경비지원을 요청합니다.
							</div>
						</div>				
						
						<div class="row">
							<div class="col" style="text-align: center; font-weight: bold;">
							2022년 08월 22일
							</div> 							
						</div>
						
						<div class="row">
							<div class="col"></div>
							<div class="col"></div>
							<div class="col-4" style="font-weight: bold; text-align: right;">신 청 자 : 박한희 (인)
								<img src="">
							</div>
						</div>
						
						<div class="row my-5">
							<div class="col" style="font-size: 25px; font-weight: bold;">
								중앙정보처리학원 총장 귀하
								<img src="">
							</div>
						</div>																													
						</div>

						<div class="row">
							<div class="col" style="text-align: right;">
								<button type="button" class="btn btn-outline-danger btn-lg">신청하기</button>
							</div>
						</div>
					</div>
				</div>
				<div class="col-2"></div>
			</div>
			

		</div>
	</div>	
	
	<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>