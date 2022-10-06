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
		<div class="row"
			style="font-size: 20px; font-weight: bold; margin-top: 30px; padding-top: 10px; padding-bottom: 10px; border-bottom: 2px solid">
			<div class="col">공지사항</div>
		</div>
		
		<div class="row" style="padding-top: 10px; padding-bottom: 10px; border-bottom: 2px solid; text-align: center; ">
			<div class="col-1"><i class="bi bi-list-ol"></i></div>
			<div class="col"></div>
			<div class="col-1"><i class="bi bi-people-fill"></i></div>
			<div class="col-1"><i class="bi bi-calendar-check"></i></div>
			<div class="col-1"><i class="bi bi-eye"></i></div>
		</div>
		
		<c:forEach  items="${NoticeDataList}" var="i">
			<div class="row border-bottom" style="padding-top: 10px; padding-bottom: 10px; text-align: center;">
			<div class="col-1">${i.club_NoticeVO.noti_no}</div>
			<div class="col"><a href="/cbh/student/notice/student_NoticeReadPage?noti_no=${i.club_NoticeVO.noti_no}">${i.club_NoticeVO.noti_title}</a></div>
			<div class="col-1">${i.staffVO.staff_name }</div>
			<div class="col-1"><fmt:formatDate value="${i.club_NoticeVO.noti_date}" pattern="yy.MM.dd"/></div>
			<div class="col-1">${i.club_NoticeVO.noti_readcount}</div>
		</div>
		</c:forEach>
		

		<!-- 페이징 -->
		<div style="padding-top: 10px; padding-bottom: 10px;">
		<nav aria-label="Page navigation example">
		  <ul class="pagination">
		    <li class="page-item"><a class="page-link" href="#">&lt;&lt;</a></li>
		    <li class="page-item"><a class="page-link" href="./student_NoticeListPage?pageNum=1">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item"><a class="page-link" href="#">4</a></li>
		    <li class="page-item"><a class="page-link" href="#">5</a></li>
		    <li class="page-item"><a class="page-link" href="#">&gt;&gt;</a></li>
		  </ul>
		</nav>
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