<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원메인 페이지</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<jsp:include page="../../staff_common/staff_sidevar.jsp"></jsp:include>
<div class="page-content p-5 pt-4" id="content">
		<!-- 토글 버튼 -->
		<button id="sidebarCollapse" type="button" style="color: #FA5858"
			class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4">
			<small class="text-uppercase font-weight-bold">MENU</small>
		</button>
				
				<!-- 여기다 작성하세요 -->
				<div class="row mb-4 ps-2" style="height: 25vh">
					<div class="col-5 box me-4" style="width: 40vw">결재진행</div>
					<div class="col-5 box " style="width: 40vw">결재함</div>
				</div>
				<div class="row mb-4 ps-2" style="height: 25vh">
				<div class="col-5 box me-4" style="width: 40vw">동아리신청</div>
				<div class="col-5 box " style="width: 40vw">동아리경비신청</div>
				</div>
				<div class="row ps-2" style="height: 25vh">
				<div class="col-5 box me-4" style="width: 40vw">학생공지사항</div>
				<div class="col-5 box " style="width: 40vw">알람내역</div>
				</div>
				
				
				
				
				
				
				
				
				
				<!-- 여기다 작성하세요 -->
				
</div>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>