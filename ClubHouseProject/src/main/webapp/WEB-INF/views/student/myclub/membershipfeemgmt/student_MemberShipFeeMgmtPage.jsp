<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회비 관리 페이지</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="/cbh/resources/css/student_MainPage.css">

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<style type="text/css">
.title01 {
	border-right: 1px solid gray;
	border-left: 1px solid gray;
	background-color: #EBEBEB;
	padding: 20px;
	font-weight: bold;
	text-align: center;
}

.title01-right {
	border-right: 1px solid gray;
	background-color: #EBEBEB;
	padding: 20px;
	font-weight: bold;
	text-align: center;
}

.blank01 {
	background-color: #F7F7F7;
	font-weight: bold;
	padding: 20px;
	text-align: center;
}

.title02 {
	border-right: 1px solid gray;
	background-color: #EBEBEB;
	padding: 10px;
	font-weight: bold;
	text-align: center;
}

.title02-right {
	border-right: 1px solid gray;
	background-color: #EBEBEB;
	padding: 10px;
	font-weight: bold;
	text-align: center;
}

.title02-non {
	background-color: #EBEBEB;
	padding: 10px;
	font-weight: bold;
	text-align: center;
}

.blank02 {
	border-right: 1px solid gray;
	background-color: white;
	font-weight: bold;
	padding: 10px;
	text-align: center;
}

.blank02-non {
	background-color: white;
	font-weight: bold;
	padding: 10px;
	text-align: center;
}

.buttonClick {
	padding-left: 30px;
	padding-right: 30px;
	font-size: 15px;
	font-weight: bold;
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
	
	var data = new Array();
	
	function save(){
		
		var count = document.getElementsByClassName("newContentCol").length;
		var totalCount = document.getElementsByClassName("contentCol").length;
		var TABLE = $("#TABLE").val();
		
		
		
	}
/* 	<div class="col-1 blank02">${i}</div>
	<div class="col-2 blank02"></div>
	<div class="col-1 blank02"></div>
	<div class="col-1 blank02"></div>
	<div class="col-3 blank02"></div>
	<div class="col-2 blank02"></div>
	<div class="col blank02-non"></div> 
	
	
	<div class="col blank02">합 계 내 역</div>
	<div class="col-4 blank02">200,000원</div>
	
	*/
	
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
								style="font-size: 30px;">회비 내역 관리</span>
						</div>
					</div>

					<div class="row">
						<div class="col-2" style="text-align: center;">
							<div onclick="MemberShipFeeMgmtClick(this)"
								style="font-size: 19px;">회비 내역 작성</div>
						</div>
						<div class="col-1" style="text-align: center;">|</div>
						<div class="col-2" style="text-align: center;">
							<a
								href="/cbh/student/myclub/membershipfeemgmt/student_MemberShipFeeMgmtListPage"
								style="font-size: 19px;">회비 내역</a>
						</div>
					</div>

				</div>
				<div class="col-1"></div>
			</div>
				
			<c:if test="${empty ClubBossInfo.IsBoss }">
				관리자만 이용가능한 페이지입니다.
			</c:if>
			
			
			<c:if test="${not empty ClubBossInfo.IsBoss }">
			
			<div class="row">
			
				<div class="col-1"></div>
				
				<div class="col">
					<div class="row my-5">
						<div class="col" style="font-size: 23px; font-weight: bold; text-align: center;">회비 내역 작성</div>
					</div>
					
					<div class="row my-5">
						<div class="col-8"></div>
						<div class="col">
							<button onclick="plusCol()" type="button" class="btn btn-outline-primary buttonClick">추가</button>
						</div>
						
						<div class="col">
							<button onclick="deleteCol()" type="button" class="btn btn-outline-danger buttonClick">삭제</button>
						</div>
							
						<div class="col">
							<button onclick="save()" type="button" class="btn btn-outline-secondary buttonClick">저장</button>
						</div>
					</div>
					
					<div class="row" style="border: 1px solid black;">
						<div class="col title01-right">작성일</div>
						<div class="col-2 blank01"> <%= sf.format(nowTime) %></div>
						<div class="col title01">동아리명</div>
						<div class="col-2 blank01">${ClubBossInfo.GetClubBossClubInfo.club_name }</div>
						<div class="col title01">직책</div>
						<div class="col blank01">${ClubBossInfo.IsBoss.club_stud_grade }</div>						
						<div class="col title01">성명</div>
						<div class="col blank01">${ClubBossInfo.GetClubBoss.stud_name }</div>						
					</div>
				</div>
						
				<div class="col-1"></div>	
				
		   </div>
		   
		   	<div class="row my-2">
			
				<div class="col-1"></div>
				
				<div class="col">
					
					<div class="row" style="border: 1px solid black;">
						<div class="col-1 title02-right">#</div>
						<div class="col-2 title02">날 짜</div>
						<div class="col-1 title02">구 분</div>
						<div class="col-1 title02">성 명</div>
						<div class="col-3 title02">내 역</div>
						<div class="col-2 title02">금 액</div>
						<div class="col title02-non">비 고</div>
					</div>
				
							<input id="TABLE" type="hidden" value="회비내역관리">
						<div id="content" class="row" style="border: 1px solid black; border-top: 0px;">
							
									
						</div>
				
					
						<div id="total" class="row" style="border: 1px solid black; border-top: 0px;">

						</div>
					
				</div>
						
				<div class="col-1"></div>	
				
		   </div>
		   </c:if>
		   
		   <div class="row my-5"></div>

		</div>
	</div>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>