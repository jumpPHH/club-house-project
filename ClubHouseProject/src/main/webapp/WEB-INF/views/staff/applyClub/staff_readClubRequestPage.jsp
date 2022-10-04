<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동아리 상세페이지</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/cbh/resources/css/staff_MainPage.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<style type="text/css">


#title{
	font-weight: bold;
	font-size: 3vh;
	color: #bf1f51;
}

</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/staff_common/staff_sidevar.jsp"></jsp:include>

<div style="position: absolute; left: 20%; width: 80%; top: 14vh; height:86vh;overflow-y: auto; word-break: break-all">
	<div class="container-fluid" style="">
		
		<div class="row" >
			<div class="col-2"></div>
			<div class="col">
				동아리 이름: ${applData.applVO.club_name }
			</div>
		</div>
		<br>
		<div class="row" >
			<div class="col-2"></div>
			<div class="col">
				신청인: ${applData.applVO.stud_id }
			</div>
		</div>
		<br>
		<div class="row" >
			<div class="col-2"></div>
			<div class="col">
				신청인원: ${applData.applVO.club_appl_people_count }
			</div>
		</div>
		<br>
		<div class="row" >
			<div class="col-2"></div>
			<div class="col">
				동아리설명: ${applData.applVO.club_purpose }
			</div>
		</div>
		<div class="row">
			<div class="col-4"></div>
			<div class="col d-grid">
				 <a class = "btn btn-dark" onclick="location.href='/cbh/staff/applyClub/staff_applyClubPage'">돌아가기</a>
			</div>
			<div class="col d-grid">
		       <a class = "btn btn-danger" href="./deleteNoticeProcess?notice_no=">반려</a>
	        </div>
			<div class="col d-grid">
		        <a class = "btn btn-success" href="./updateContentPage?notice_no=">검수</a>
			</div>
			<div class="col-4"></div>
		</div>
		
		
		
	</div>
</div>

	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>