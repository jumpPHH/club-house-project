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
<jsp:include page="../../student_common/student_header.jsp"></jsp:include>
<jsp:include page="../../student_common/student_sidevar.jsp"></jsp:include>

<div style="position: absolute; left: 13.5%; width: 86.5%; top: 14vh; height:86vh;overflow-y: auto">
	<div class="container-fluid" style="background-color: white">
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
		<div class="col">
			<a href="/cbh/student/myclubactivity/student_MyClubActivityListPage" class="btn btn-primary"><i class="bi bi-list"></i> 목록</a>
		</div>
	</div>
		
		
				<!-- 여기다 작성하세요 -->
				
			</div>
			<div class="col-1"></div>
		</div>
	</div>
</div>

	
	
	
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>