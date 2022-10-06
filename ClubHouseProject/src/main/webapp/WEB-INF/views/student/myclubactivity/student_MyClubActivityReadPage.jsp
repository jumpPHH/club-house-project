<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동아리 활동내역</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
	
<link rel="stylesheet" href="/cbh/resources/css/student_MainPage.css">
	
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
				style="box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075) !important;">Toggle</small>
		</button>

		<div class="card"
			style="width: 100%; height: auto; border-radius: 2%; box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075) !important;">
			<div class="dashboard-card-bottom">
				<!-- 실제 내용 -->
				
				<div class="row">
			<div class="col-1"></div>
			<div class="col">
			
				
				<!-- 여기다 작성하세요 -->
		
		
		
		<div class="row border-bottom border-dark" style="font-size: 20px; font-weight: bold; margin-top: 30px; padding-top: 10px; padding-bottom: 10px;">
			<div class="col"> 동아리 활동내역 </div>
		</div>

		<div class="row border-bottom border-dark" style="padding-top: 10px; padding-bottom: 10px;">
			<div class="col-6">제목</div>
			<div class="col">등록일 </div>
			<div class="col">조회수 </div>
		</div>
		<span class="border-bottom"></span>
	
	<div class="row border-bottom border-dark" style="padding-top: 10px; padding-bottom: 10px; height: 360px;">
		<div class="col" >
		
		글 내용
		​

		</div>
	</div>
	
	<div class="row" style="padding-top: 10px; padding-bottom: 10px;">
		<div class="col-2 d-grid">
			<a href="/cbh/student/myclubactivity/student_MyClubActivityListPage" class="btn btn-primary"><i class="bi bi-list"></i> 목록</a>
		</div>
		
		<div class="col-2 d-grid">
			<a href="/cbh/student/myclubactivity/student_MyClubActivityListPage?club_act_no=${data.Club_ActVO.club_act_no }" class="btn btn-warning"><i class="bi bi-pencil-square"></i> 수정</a>
		</div>
		<div class="col-2 d-grid">
			<a href="" class="btn btn-danger"><i class="bi bi-trash"></i> 삭제</a>
		</div>
		
	</div>
		
		
				<!-- 여기다 작성하세요 -->
				
			</div>
			<div class="col-1"></div>
		</div>
				
				
				</div>
				</div>
				</div>


		
	

	
	
	
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>