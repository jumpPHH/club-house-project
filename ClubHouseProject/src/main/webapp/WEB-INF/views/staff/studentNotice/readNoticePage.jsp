<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지작성 페이지</title>
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
		
		<div class="row mt-4 box ms-1"  style="height: 45px; align-items: center">
			<div class="col text-center" style="color: #FA5858; font-weight: bold; font-size: 1.5rem;">
				공지상세
			</div>
		</div>
		
		
<div class="row mt-4 box ms-1 p-4" style="height: 70vh; overflow: auto;">
	<div class="col">
	
		<div class="row" style="padding: 2vh;">
			<div class="col-2">공지구분</div>
			<div class="col">
				<c:choose>
					<c:when test="${notiData.noticeVO.noti_div_no == 1 }">
						<td>일반공지</td>
					</c:when>
					<c:when test="${notiData.noticeVO.noti_div_no == 2 }">
						<td>긴급공지</td>
					</c:when>
				</c:choose>
			</div>
		</div>
		<div class="row" style="padding: 2vh;">
			<div class="col-2">공지제목</div>
			<div class="col">
				 ${notiData.noticeVO.noti_title } 
			</div>
		</div>
		<div class="row" style="padding: 2vh;">
			<div class="col-2">공지사항</div>
			<div class="col">
				 ${notiData.noticeVO.noti_content }
			</div>
		</div>
		<c:if test="${ !empty sessionUserInfo && sessionUserInfo.staff_id == data.staffVO.staff_id}">session이 안넘어가낭</c:if>
		<div class="row" style="padding: 1vh;">
			<div class="col-2">
				 <a class = "btn btn-dark" onclick="location.href='/cbh/staff/studentNotice/staff_StudentNoticePage'">돌아가기</a>
			</div>
			<div class="col-7"></div>
			<div class="col d-grid">
				<a class = "btn btn-danger" href="./deleteNoticeProcess?notice_no=${notiData.noticeVO.noti_no }">삭제</a>
			</div>
			<div class="col d-grid">
		        <a class = "btn btn-success" href="./updateContentPage?notice_no=${notiData.noticeVO.noti_no }"><i class="bi bi-pencil-square"></i>수정</a>
			</div>
		</div>
		
		
	</div>
</div>

</div>

	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>