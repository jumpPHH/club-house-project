<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지수정 페이지</title>
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
<div class="page-content p-5 pt-4" id="content">
	 <!-- 토글 버튼 -->
		<button id="sidebarCollapse" type="button"
			class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-3">
			<i class="fa fa-bars mr-2"></i><small
				class="text-uppercase font-weight-bold" style="color: #FA5858">MENU</small>
		</button>

<!-- <div style="position: absolute; left: 30%; width: 50%; top: 10vh; height:90vh; word-break: break-all"> -->
<!-- 	<div class="container-fluid" style="background-color: #FA8585; border-radius: 30px;"> -->
		<div class="row mt-4 ms-1 box"  style="height: 45px; align-items: center">
			<div class="col text-center" style="color: #FA5858; font-weight: bold; font-size: 1.5rem;">
				공지수정
			</div>
		</div>
		
		<div class="row mt-4 box ms-1 p-4">
			<div class="col">
		
		<form action="./updateContentProcess" method="post">
		<div class="row" style="padding: 2vh;">
			<div class="col-2">
				공지구분
			</div>
			<div class="col">
				<select name="noti_div_no" class=" form-select">
					<option selected value="1">일반공지</option>
					<option value="2">긴급공지</option>				
				</select>
			</div>
		</div>
		
		<div class="row" style="padding: 2vh;">
			<div class="col-2">
				공지제목</div>
			<div class="col">
				<input class="container-fluid form-control" type="text" name="noti_title" value="${data.noticeVO.noti_title }">
			</div>
		</div>
		
		<div class="row" style="padding: 2vh;">
			<div class="col-2">
				공지사항
			</div>
			<div class="col">
				<textarea class=" form-control" name="noti_content" rows="15" cols="100">${data.noticeVO.noti_content }</textarea>
				<input type="hidden" name="noti_no" value="${data.noticeVO.noti_no }">
			</div>
		</div>
		<br>
		<div class="row" style="padding: 1vh;">
			<div class="col-2"></div>
			<div class="col d-grid">
		       <a class = "btn btn-danger" href="./staff_StudentNoticePage"> 취소 </a>
	        </div>
			<div class="col d-grid">
		       <button class = "btn btn-primary" type="submit"> 확인 </button>
			</div>
			<div class="col-2"></div>
		</div>
		</form>
		
		</div>
	</div>
</div>

	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>