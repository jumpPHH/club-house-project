<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
<link rel="stylesheet" href="/cbh/resources/css/student_MainPage.css">


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href=" https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">

 
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
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

/*
*
* ==========================================
* CUSTOM UTIL CLASSES
* ==========================================
*
*/
.datepicker td, .datepicker th {
    width: 2.5rem;
    height: 2.5rem;
    font-size: 0.85rem;
}

.datepicker {
    margin-bottom: 3rem;
}

/*
*
* ==========================================
* FOR DEMO PURPOSES
* ==========================================
*
*/
body {
    min-height: 100vh;
    background-color: #fafafa;
}

.input-group {
    border-radius: 30rem;
}

input.form-control {
    border-radius: 30rem 0 0 30rem;
    border: none;
}

input.form-control:focus {
    box-shadow: none;
}

input.form-control::placeholder {
    font-style: italic;
}

.input-group-text {
    border-radius: 0 30rem 30rem 0;
    border: none;
}

.datepicker-dropdown {
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
}

</style>

<script>
	$(function () {
	
	    // INITIALIZE DATEPICKER PLUGIN
	    $('.datepicker').datepicker({
	        clearBtn: true,
	        format: "dd/mm/yyyy"
	    });
	
	
	    // FOR DEMO PURPOSE
	    $('#reservationDate').on('change', function () {
	        var pickedDate = $('input').val();
	        $('#pickedDate').html(pickedDate);
	    });
	});
</script>
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
							<i class="bi bi-cash-coin"
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
			
		<c:if test="${empty ClubBossInfo.IsBoss }">
			관리자만 이용가능한 페이지입니다.
		</c:if>
		
		<c:if test="${not empty ClubBossInfo.IsBoss }">
		
		<form action="/cbh/student/myclub/applicationexpenses/student_ApplicationExpensesRegistrationProcess" method="post">
			<div hidden="hidden">
				<input type="hidden" name="club_no" value="${ClubBossInfo.GetClubBossClubInfo.club_no}">
			</div>
			<div class="row">
				<div class="col-2"></div>
				<div class="col">
						<div class="row my-5">

						<div class="col" style="font-size: 23px; font-weight: bold; text-align: center;">동아리 경비 신청서</div>
					</div>
				
					<div class="row my-3" style="padding: 0px; margin: 0px;">
						
						<div class="row" style="padding: 0px; margin: 0px;">
							<div class="row">
								<div class="col-3 title">동아리 명</div>
								<div class="col blank-bottom">${ClubBossInfo.GetClubBossClubInfo.club_name}</div>
							</div>
							
							<div class="row">
								<div class="col-3 title" style="padding-top: 80px;">회 장</div>
								<div class="col-2">
									<div class="row title">전 공</div>
									<div class="row title">학 번</div>
									<div class="row title">연 락 처</div>
								</div>
								<div class="col">
									<div class="row blank">${ClubBossInfo.GetClubBoss.stud_dept}</div>
									<div class="row blank">${ClubBossInfo.GetClubBoss.stud_id}</div>
									<div class="row blank">${ClubBossInfo.GetClubBoss.stud_phone}</div>
								</div>
								<div class="col-2"
									style="border-bottom: 2px solid #AEA9A9; background-color: #F7F7F7;">
									<div class="row title" style="border-left: 2px solid #AEA9A9;">학 년</div>
									<div class="row title" style="border-left: 2px solid #AEA9A9;">성 명</div>
								</div>
								<div class="col" style="border-bottom: 2px solid #AEA9A9; background-color: #F7F7F7;">
									<div class="row blank">${ClubBossInfo.GetClubBoss.stud_grade}</div>
									<div class="row blank">${ClubBossInfo.GetClubBoss.stud_name}</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-3 title">회 원 수</div>
								<div class="col blank" style="background-color: white;">
								<input class="form-control" type="text" placeholder="회원수 입력" aria-label="default input example"
								name="">
								</div>
							</div>
								
							<div class="row">
								<div class="col-3 title">경비 요청액</div>
								<div class="col blank" style="background-color: white;">
								<input class="form-control" type="text" placeholder="경비 요청액 입력" aria-label="default input example"
								name="club_expns_apply_grants">
								</div>
							</div>
							
							<div class="row">
								<div class="col-3 title">사용 목적</div>
								<div class="col blank" style="background-color: white;">
								<input class="form-control" type="text" placeholder="사용 목적 입력" aria-label="default input example"
								name="club_expns_apply_purpose_use">
								</div>
							</div>

						<div class="row">
							<div class="col-3 title" style="padding-top: 40px;">경비 사용날짜</div>
							<div class="col blank" style="background-color: white; padding-bottom: 0px;">
									<!-- Date Picker Input -->
					            <div class="form-group">
					                <div class="datepicker date input-group shadow-sm">
					                    <input type="text" name="club_expns_apply_period_use" placeholder="날짜 설정" class="form-control" id="reservationDate">
					                    <div class="input-group-append"><span class="input-group-text"><i class="fa fa-clock-o"></i></span></div>
					                </div>
					            </div><!-- DEnd ate Picker Input -->
							</div>
						</div>

						<div class="row my-5">
							<div class="col" style="text-align: center; font-weight: bold; ">
							상기 동아리 활동에 필요한 경비지원을 요청합니다.
							</div>
						</div>				
						
						<div class="row">
							<div class="col" style="text-align: center; font-weight: bold;">
							 <%= sf.format(nowTime) %>
							</div> 							
						</div>
						
						<div class="row">
							<div class="col"></div>
							<div class="col"></div>
							<div class="col-4" style="font-weight: bold; text-align: right;">
								신 청 자 : 박한희 (인)
								<img style="width: 100px; transform: translate( 50%, -60% );" src="/cbh/resources/img/student/myclub/applicationexpenses/payment.png">
							</div>
						</div>
						
						<div class="row my-3">
							<div class="col" style="font-size: 25px; font-weight: bold;">
								중앙정보처리학원 총장 귀하
								<img style="width: 100px; transform: translate( -60%, -5% );" src="/cbh/resources/img/student/myclub/applicationexpenses/president.png">
							</div>
						</div>																													
						</div>

						<div class="row">
							<div class="col" style="text-align: right;">
								<button type="submit" class="btn btn-outline-danger btn-lg">신청하기</button>
							</div>
						</div>
					</div>
				</div>
				<div class="col-2"></div>
			</div>
			</form>
		</c:if>	
			
		
		</div>
	</div>	
	
	<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>