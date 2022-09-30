<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생공지 페이지</title>
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
<script>
	
	function checkAll(){
		var chkTotal = document.getElementById("checkAll");
		chkTotal.addEventListener("change", function check1(){
			var chk = document.getElementsByName("check");
			for(var i = 0 ; i < chk.length ; i++){
				chkNo = chk[i].value;			
			}
			console.log(chkNo);
		});
		//console.log(chkTotal.value);		
	}
	
	//chkTotal.addEventListener("click",
	function check1(){
		var chk = document.getElementsByName("check");
		for(var i = 0 ; i < chk.length ; i++){
			chkNo = chk[i].value;			
		}
		console.log(chkNo);
	}
	
// 	document.querySelector("input[name=checkAll]").addEventListener("change",
// 		function (e) {
// 			e.preventDefault();
// 			var list = document.querySelectorAll("input[name=check]");
// 			 for (var i = 0; i < list.length; i++) {
// 			        list[i].checked = this.checked;
// 			    }		
// 		});
		

	function noticeList(){
		
		var xhr = new XMLHttpRequest(); 
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);
			}
		}
		
		xhr.open("get" , "./getNotiByChkBtn?notice_no=" + noticeNo); 
		xhr.send(); 
	}

	function deleteNotice(noticeNo){
		
		//var arr = new Array();

		var xhr = new XMLHttpRequest(); 
			xhr.onreadystatechange = function () {
				if(xhr.readyState == 4 && xhr.status == 200){
					var result = JSON.parse(xhr.responseText);
					//callback
				}
			}
			xhr.open("get" , "./deleteNotiByChkBtn?notice_no=" + noticeNo);
			xhr.send();
	}
	
	function refreshNoticeList(){
		
		var xhr = new XMLHttpRequest(); 
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);
			}
		}
	}
	
// 	function checkAll(){
// 		$(".check").click();
// 	}

</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/staff_common/staff_sidevar.jsp"></jsp:include>
	
		
	<!-- 페이지 내용 부분 시작 (이 부분만 카피해서 사용할것. 카피 후 삭제) -->
	<div class="page-content p-5 pt-4" id="content">
	  <!-- 토글 버튼 -->
		<button id="sidebarCollapse" type="button"
			class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-3">
			<i class="fa fa-bars mr-2"></i><small
				class="text-uppercase font-weight-bold">MENU</small>
		</button>
		
		<br>
		<form action="./staff_StudentNoticePage" method="get">
		<div class="row mt-4 box p-4"  style="border-color: grey" >
			<div class="col-1">
				공지구분
			</div>
			<div class="col">
				<select name="noti_div_no">
					<option selected value="0">일반공지</option>
					<option value="1">긴급공지</option>					
				</select>
			</div>
			<div class="col-1">
				제목
			</div>
			<div class="col">
				<input name="searchWord" type="text">
			</div>
			<div class="col" style="">
				<button class="btn btn-primary" type="submit">조회</button>
			</div>
		
			<div class="col" style="">
				<button class="btn btn-success" type="button" onclick="location.href='/cbh/staff/studentNotice/writeNoticePage'">작성</button>
			</div>
			<div class="col" style="">
				<button onclick="deleteNotice()" class="btn btn-danger" type="button">삭제</button>
			</div>			
		</div>
		</form>

		<div class="row mt-4 box p-4">
				<div class="col">
					<table class="table table hover caption-top table-sm" >
						<thead>
							<tr>
								<th class="col-1"><input id="checkAll" onclick="checkAll()" type="checkbox" class="form-check-input" value="전체체크"></th>
								<th class="col-1">번호</th>
								<th class="col-1">작성자</th>
								<th class="col-4">제목</th>
								<th class="col-2">공지구분</th>
								<th class="col-2">작성일</th>
								<th class="col-1">조회수</th>								
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${noticeDataList }" var="noticeData">
								<tr>
									<td><input name="check" onclick="check1()" type="checkbox"  class="check form-check-input" value="${noticeData.noticeVO.noti_no }"></td>
									<td>${noticeData.noticeVO.noti_no }</td>
									<td>${noticeData.noticeVO.staff_id}</td>
									<td><a href="./readNoticePage?noticeNo=${noticeData.noticeVO.noti_no }">${noticeData.noticeVO.noti_title }</a></td>
									<c:choose>
										<c:when test="${noticeData.noticeVO.noti_div_no == 0 }">
											<td>일반공지</td>
										</c:when>
										<c:when test="${noticeData.noticeVO.noti_div_no == 1 }">
											<td>긴급공지</td>
										</c:when>
									</c:choose>
									<td><fmt:formatDate value ="${noticeData.noticeVO.noti_date }" pattern="yyyy년 MM월 hh시 mm분"/></td>
									<td>${noticeData.noticeVO.noti_readcount }</td>									
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<!-- paging UI -->
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<c:choose>
								<c:when test="${startPage <=1}">
									<li class="page-item disabled"><a class="page-link"
										href="#">&lt;</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="./staff_StudentNoticePage?pageNum=${startPage-1}${additionalParam}">&lt;</a></li>
								</c:otherwise>
							</c:choose>

							<c:forEach begin="${startPage}" end="${endPage}" var="i">
								<c:choose>
									<c:when test="${i == currentPageNum}">
										<li class="page-item active"><a class="page-link"
											href="./staff_StudentNoticePage?pageNum=${i}${additionalParam}">${i}</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="./staff_StudentNoticePage?pageNum=${i}${additionalParam}">${i}</a></li>
									</c:otherwise>
								</c:choose>

							</c:forEach>

							<c:choose>
								<c:when test="${endPage >= totalPageCount }">
									<li class="page-item disabled"><a class="page-link"
										href="./staff_StudentNoticePage?pageNum=${endPage+1}${additionalParam}">&gt;</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="./staff_StudentNoticePage?pageNum=${endPage+1}${additionalParam}">&gt;</a></li>
								</c:otherwise>
							</c:choose>

						</ul>
					</nav>
				</div>
			</div>
		
</div>

	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>