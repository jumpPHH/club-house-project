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
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">


.body{
	background-color: #adb5bd12;
}

#title{
	color: #FA5858;
	text-decoration-line: none;
}

#search{
	float: left;
}

th{
	text-align: center;
}

td{
	text-align: center;
	 
}

.title{
  width: 400px;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 1;
  -webkit-box-orient: vertical;
}

.form-check-input:checked {
    border-color:#FA5858;
    background-color: #FA5858;
 }
.form-check-input{
  border-color:#FA5858;
 }

.check{
  border-color:#FA5858;
 }


</style>
<script type="text/javascript">
	
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
	
	function checkAll(){
		$(".check").click();
	}

</script>
</head>
<body id="body">
	<jsp:include page="/WEB-INF/views/staff_common/staff_sidevar.jsp"></jsp:include>
	
		
	<!-- 페이지 내용 부분 시작 (이 부분만 카피해서 사용할것. 카피 후 삭제) -->
	<div class="page-content p-5 pt-4" id="content">
	  <!-- 토글 버튼 -->
		<button id="sidebarCollapse" type="button"
			class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-3">
			<i class="fa fa-bars mr-2"></i><small
				class="text-uppercase font-weight-bold" style="color: #FA5858">MENU</small>
		</button>
		
		<br>
		<form action="./staff_StudentNoticePage" method="get">
		<div class="row ps-3 mt-4 ms-1 box" style="height: 45px; align-items: center">
			<div class="col-1">
				공지구분
			</div>
			<div class="col-2">
				<select name="noti_div_no" class=" form-select">
					<option selected value="1">일반공지</option>
					<option value="2">긴급공지</option>					
				</select>
			</div>
			<div class="col-1">
				제목
			</div>
			<div class="col">
				<input class="container-fluid form-control" name="searchWord" id="search" type="text">
			</div>
			<div class="col-1" style="">
				<button class="btn btn-outline-primary py-1" type="submit"><i class="bi bi-search"></i>조회</button>
			</div>
		
			<div class="col-1" style="">
				<button class="btn btn-outline-success py-1" type="button" onclick="location.href='/cbh/staff/studentNotice/writeNoticePage'"><i class="bi bi-pencil-square"></i>작성</button>
			</div>
			<div class="col-1" style="float: right;">
				<button onclick="deleteNotice()" class="btn btn-outline-danger py-1" type="button">삭제</button>
			</div>			
		</div>
		</form>

		<div class="row mt-4 ms-1 box p-4" style="height: 65vh;">
				<div class="col">
					<table class="table table hover caption-top table-sm">
						<thead style="background-color: rgb(252, 243, 243);">
							<tr>
								<th class="col-1" style="text-align: left;"><input id="checkAll" onclick="checkAll()" type="checkbox" class="form-check-input" value="전체체크"></th>
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
									<td style="text-align: left;"><input name="check" onclick="check()" type="checkbox"  class="check form-check-input" value="${noticeData.noticeVO.noti_no }"></td>
									<td>${noticeData.noticeVO.noti_no }</td>
									<td>${noticeData.staffVO.staff_name}</td>
									<td><a id="title" class="title" href="./readNoticePage?noticeNo=${noticeData.noticeVO.noti_no }">${noticeData.noticeVO.noti_title }</a></td>
									<c:choose>
										<c:when test="${noticeData.noticeVO.noti_div_no == 1 }">
											<td>일반공지</td>
										</c:when>
										<c:when test="${noticeData.noticeVO.noti_div_no == 2 }">
											<td>긴급공지</td>
										</c:when>
									</c:choose>
									<td><fmt:formatDate value ="${noticeData.noticeVO.noti_date }" pattern="yyyy년 MM월 dd일"/></td>
									<td>${noticeData.noticeVO.noti_readcount }</td>									
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row mt-3" >
				<div class="col">
					<!-- paging UI -->
					<nav aria-label="Page navigation example" >
						<ul class="pagination" style="justify-content: center;">
							<c:choose>
								<c:when test="${startPage <=1}">
									<li class="page-item disabled"><a class="page-link"
										href="#" style="text-decoration-line: none; color: red;">◀</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										style="text-decoration-line: none; color: black;"
										href="./staff_StudentNoticePage?pageNum=${startPage-1}${additionalParam}">◀</a></li>
								</c:otherwise>
							</c:choose>
							<c:forEach begin="${startPage}" end="${endPage}" var="i">
								<c:choose>
									<c:when test="${i == currentPageNum}">
										<li class="page-item active"><a class="page-link"
											style="text-decoration-line: none; border-color:#FA5858; background-color: #FA5858; font-weight: 600;"
											href="./staff_StudentNoticePage?pageNum=${i}${additionalParam}">${i}</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											style="text-decoration-line: none; color: black;"
											href="./staff_StudentNoticePage?pageNum=${i}${additionalParam}">${i}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${endPage >= totalPageCount }">
									<li class="page-item disabled"><a class="page-link"
										style="text-decoration-line: none; color: red;"
										href="./staff_StudentNoticePage?pageNum=${endPage+1}${additionalParam}">▶</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										style="text-decoration-line: none; color: black;"
										href="./staff_StudentNoticePage?pageNum=${endPage+1}${additionalParam}">▶</a></li>
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