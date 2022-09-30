<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생메인 페이지</title>
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
	
	
	<div class="row" >
			<div class="col-1"></div>
			<div class="col">
			
	<!-- 여기다 작성하세요 -->
	
	<div class="row border-bottom border-dark" style="font-size: 20px; font-weight: bold; margin-top: 30px; padding-top: 10px; padding-bottom: 10px;">
		<div class="col"> 공지사항 </div>
	</div>

	<div class="row border-bottom border-dark" style="padding-top: 10px; padding-bottom: 10px;">
		<div class="col-6">제목 불러오기</div>
		<div class="col">등록일 불러오기</div>
		<div class="col">조회수 불러오기</div>
	</div>
	<span 
	class="border-bottom"></span>
	
	<div class="row border-bottom border-dark" style="padding-top: 10px; padding-bottom: 10px; height: 360px;">
		<div class="col" >
		
		오늘은 제가 하고있는 업무에 대해 이야기 해볼까 합니다

		저는 현재 영업 및 영업관리 직무에 종사하고 있습니다.

		영업과 영업관리는 엄밀히 말하면 차이가 있습니다.
		
		제가 하는 일은 영업관리에 더 가깝습니다.
		
		간단히 말씀드리면 영업은 실질적으로 필드에서 영업을 통해 기업에 돈을 벌어오는 일을 한다면
		
		영업관리는 이미 계약이 성사되어있는 기업들과 소통하고 관리하며 서포트하는 일에 가깝습니다.
		
		참고로 영업관리에서도 하는 일이 회사 마다 조금씩 다릅니다.
		
		어떤회사의 영업관리는 사무직 느낌이 강합니다. 세금계산서 발행,매출관리 등 주로 오피스를 이용해 사무업무를 담당하는 영업관리가 있는 반면
		
		외근을 나가 거래처를 순회하는 업무가 주된 영업관리가 있습니다. 제가 하고 있는 일은 후자입니다.
		​

		</div>
		
	</div>
	
	<div class="row" style="padding-top: 10px; padding-bottom: 10px;">
		<div class="col">
			<a href="/cbh/student/notice/student_NoticeListPage" class="btn btn-primary"><i class="bi bi-list"></i> 목록</a>
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