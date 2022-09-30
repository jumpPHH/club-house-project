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
		
		<c:forEach begin="0"  end="${NoticeDataList.size()-1}" var="i">
			<div class="row border-bottom" style="padding-top: 10px; padding-bottom: 10px; text-align: center;">
			<div class="col-1">${NoticeDataList[i].club_NoticeVO.noti_no}</div>
			<div class="col"><a href="/cbh/student/notice/student_NoticeReadPage">${NoticeDataList[i].club_NoticeVO.noti_title}</a></div>
			<div class="col-1">${NoticeDataList[i].staffVO.staff_name }</div>
			<div class="col-1"><fmt:formatDate value="${NoticeDataList[i].club_NoticeVO.noti_date}" pattern="yy.MM.dd"/></div>
			<div class="col-1">${NoticeDataList[i].club_NoticeVO.noti_readcount}</div>
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

	
	
	
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>