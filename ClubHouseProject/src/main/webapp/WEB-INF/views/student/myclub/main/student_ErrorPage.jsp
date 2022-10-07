<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>권한 에러 페이지</title>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="/cbh/resources/css/status.css">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.6.1.js">
	
</script>
</head>
<body>
	<jsp:include
		page="/WEB-INF/views/student_common/student_navigationvar.jsp"></jsp:include>
		
			<div class="page-content p-5" id="content">
		<!-- 토글 버튼 -->
		<button id="sidebarCollapse" type="button"
			class="btn btn-light bg-white rounded-pill box px-4 mb-4">
			<small class="text-uppercase font-weight-bold">MENU</small>
		</button>
		
			<div class="row my-5"
				style="width: 100%; height: 100%; padding-top: 100px;">
				<div class="col-1"></div>
				<div class="col">
					<div class="page-404">
						<div class="outer">
							<div class="middle">
								<div class="inner">
									<!--BEGIN CONTENT-->
									<a href="/cbh/student/myclub/main/student_MainPage" style="text-decoration: none;" class="inner-circle"><i
										class="fa fa-home"></i><span> 권한제한</span></a> <span
										class="inner-status">페이지 권한이 없습니다.</span> <span
										class="inner-detail"> 접속을 원하시면 권한을 부여받으십시요. </span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-1"></div>
			</div>
			
		</div>	
</body>
</html>