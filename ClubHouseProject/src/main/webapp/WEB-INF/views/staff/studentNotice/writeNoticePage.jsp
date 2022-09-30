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
<jsp:include page="/WEB-INF/views/staff_common/staff_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/staff_common/staff_sidevar.jsp"></jsp:include>

<div style="position: absolute; left: 20%; width: 80%; top: 14vh; height:86vh;overflow-y: auto; word-break: break-all">
	<div class="container-fluid" style="background-color: ">
		
		<form action="./writeNoticeProcess" method="post">
		<div class="row" >
			<div class="col-2"></div>
			<div class="col-2">
				공지구분
			</div>
			<div class="col">
				<select name="noti_div_no" >
					<option selected value="0">일반공지</option>
					<option value="1">긴급공지</option>					
				</select>
			</div>
		</div>
		
		<div class="row" >
			<div class="col-2"></div>
			<div class="col-2">
				공지제목
			</div>
			<div class="col">
				<input type="text" name="noti_title">
			</div>
		</div>
		
		<div class="row" >
			<div class="col-2"></div>
			<div class="col-2">
				공지사항
			</div>
			<div class="col">
				<textarea name="noti_content" rows="10" cols="60"></textarea>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-4"></div>
			<div class="col d-grid">
		       <a class = "btn btn-danger" href="./staff_StudentNoticePage"> 취소 </a>
	        </div>
			<div class="col d-grid">
		       <button class = "btn btn-primary" type="submit"> 확인 </button>
			</div>
			<div class="col-4"></div>
		</div>
		</form>

		
	</div>
</div>

	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>