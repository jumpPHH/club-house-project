<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="/cbh/resources/css/student_navbar.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>

<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/student_common/student_navigationvar.jsp"></jsp:include>

	<!-- 페이지 내용 부분 시작 (이 부분만 카피해서 사용할것. 카피 후 삭제) -->
	<div class="page-content p-5" id="content">
		<!-- 토글 버튼 -->
		<button id="sidebarCollapse" type="button"
			class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4">
			<small class="text-uppercase font-weight-bold">MENU</small>
		</button>

		<div class="row my-3 card box" style="width: 100%; height: auto;">
			<div class="dashboard-card-bottom">
				<div class="row">
					<div class="col-1"></div>
					<div class="col">
							
				<!-- 여기다 작성하세요 -->
				
							<!-- 컨텐트 of 헤더 -->
							<div class="row my-5 py-5">
								<div class="col" style="font-weight:bold; text-align:center; padding-top:7em;">
									<h1>개설신청이 완료 되었습니다.<br>개설승인 후 동아리 페이지 이용이 가능합니다.</h1>
								</div>
							</div>
							<div class="row">
								<div class="col" style="text-align:center; margin-bottom:15em;">
									<button type="button" class="btn btn-danger" style="width:40em; height:3em;" onclick="location.href='./student_indexPage'">동아리 카테고리 페이지로 이동</button>
								</div>
							</div>
							

					</div>
					<div class="col-1"></div>
				</div>
			</div>
		</div>
</div>


</body>
</html>