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
<jsp:include page="/WEB-INF/views/staff_common/staff_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/staff_common/staff_sidevar.jsp"></jsp:include>

<div style="position: absolute; left: 20%; width: 80%; top: 14vh; height:86vh;overflow-y: auto; word-break: break-all">
	<div class="container-fluid" style="">
		
		<div class="row" >
			<div class="col-2"></div>
			<div class="col">
				공지구분: <c:choose>
							<c:when test="${notiData.noticeVO.noti_div_no == 0 }">
								<td>일반공지</td>
							</c:when>
							<c:when test="${notiData.noticeVO.noti_div_no == 1 }">
								<td>긴급공지</td>
							</c:when>
						</c:choose>
			</div>
		</div>
		<br>
		<div class="row" >
			<div class="col-2"></div>
			<div class="col">
				공지제목: ${notiData.noticeVO.noti_title } 
			</div>
		</div>
		<br>
		<div class="row" >
			<div class="col-2"></div>
			<div class="col">
				공지사항: ${notiData.noticeVO.noti_content }
			</div>
		</div>
		<c:if test="${ !empty sessionUserInfo && sessionUserInfo.staff_id == data.staffVO.staff_id}">session이 안넘어가낭</c:if>
		<br>
		<div class="row">
			<div class="col-4"></div>
			<div class="col d-grid">
				 <a class = "btn btn-dark" onclick="location.href='/cbh/staff/studentNotice/staff_StudentNoticePage'">돌아가기</a>
			</div>
			<div class="col d-grid">
		       <a class = "btn btn-danger" href="./deleteNoticeProcess?notice_no=${notiData.noticeVO.noti_no }">삭제</a>
	        </div>
			<div class="col d-grid">
		        <a class = "btn btn-success" href="./updateContentPage?notice_no=${notiData.noticeVO.noti_no }">수정</a>
			</div>
			<div class="col-4"></div>
		</div>
		
		
		
	</div>
</div>

	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>