<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경비 신청내역 페이지</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="/cbh/resources/css/student_MainPage.css">
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
								style="font-size: 30px;">경비신청 내역 관리</span>
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
					
					

				</div>
				<div class="col-1"></div>
			</div>
		</div>
	</div>	
	
	<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>