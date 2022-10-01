<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동아리 신청페이지</title>
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
	
// 	function checkAll(){
// 		var chkTotal = document.getElementById("checkAll");
// 		chkTotal.addEventListener("change", function check1(){
// 			var chk = document.getElementsByName("check");
// 			for(var i = 0 ; i < chk.length ; i++){
// 				chkNo = chk[i].value;			
// 			}
// 			console.log(chkNo);
// 		});
// 		console.log(chkTotal.value);		
// 	}
	
	//chkTotal.addEventListener("click",
// 	function check1(){
// 		var chk = document.getElementsByName("check");
// 		for(var i = 0 ; i < chk.length ; i++){
// 			chkNo = chk[i].value;			
// 		}
// 		console.log(chkNo);
// 	}
	
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
	
	function checkAll(elm){
		elm.checked;
	}

 	window.addEventListener('DOMContentLoaded' , function checkAll(elm){
    var checkBox = document.getElementById('check');
    checkBox.checked;
 	}

</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/staff_common/staff_sidevar.jsp"></jsp:include>
     
     
   <!-- 페이지 내용 부분 시작 -->
   <div class="page-content p-5 pt-4" id="content">
     <!-- 토글 버튼 -->
      <button id="sidebarCollapse" type="button"
         class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-3">
         <i class="fa fa-bars mr-2"></i><small
            class="text-uppercase font-weight-bold">MENU</small>
      </button>
		
		<div class="row mt-4 box p-4"  style="border-color: grey" >
			<div class="col-1">
				동아리
			</div>
			<div class="col">
				<input name="searchWord" type="text">
			</div>
			<div class="col" style="">
				<button class="btn btn-primary" type="submit">조회</button>
			</div>
			<div class="col" style="">
				<button onclick="deleteNotice()" class="btn btn-danger" type="button">삭제</button>
			</div>			
		</div>

		
	<div class="row mt-4 box p-4">
		<div class="col">
			<table class="table table hover caption-top table-sm" >
			  <thead>
			    <tr>
					<th><input id="checkAll" onclick="checkAll()" type="checkbox" class="form-check-input" value="전체체크"></th>
					<th class="col">동아리</th>
					<th class="col">신청인</th>
					<th class="col">선택일시</th>
					<th class="col">상태</th>
				<tr>
			</thead>
			<tbody>
					<!-- paging UI -->
					<c:forEach items="${clubApplDataList}" var="clubApplData">
						<tr>
						  <th><input id="check" onclick="check()" type="checkbox" class="form-check-input" value="${clubApplData.club_appl_no }"></th>
						  <!-- <td><a href="./staff_readClubRequestPage?=${clubApplData.club_ApplVO.club_appl_no }">${clubApplData.club_ApplVO.club_name }</a></td> -->
					      <!-- Button trigger modal -->
					      <td><a data-bs-toggle="modal" data-bs-target="#exampleModal">${clubApplData.club_ApplVO.club_name }</a></td>
					      <td>${clubApplData.club_ApplVO.stud_id }</td>
					      <td><fmt:formatDate value ="${clubApplData.club_ApplVO.club_appl_date }" pattern="yyyy년 MM월 hh시 mm분"/></td>
					      <td>
					      <c:choose>
					      	<c:when test="${clubApplData.club_ApplVO.club_appl_state == 0}">
					      		승인
					      	</c:when>
					      	<c:when test="${clubApplData.club_ApplVO.club_appl_state == 1}">
					      		반려
					      	</c:when>
					      	<c:when test="${clubApplData.club_ApplVO.club_appl_state == 2}">
					      		심사중
					      	</c:when>
					      </c:choose>
					      </td>
					     <tr>
					</c:forEach>
			</tbody>
		</table>
		</div>
	</div>
	

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
			     <div class="row" >
				<div class="col-2"></div>
				<div class="col">
					동아리 이름: ${applData.applVO.club_name }
				</div>
			</div>
			<br>
			<div class="row" >
				<div class="col-2"></div>
				<div class="col">
					신청인: ${applData.applVO.stud_id }
				</div>
			</div>
			<br>
			<div class="row" >
				<div class="col-2"></div>
				<div class="col">
					신청인원: ${applData.applVO.club_appl_people_count }
				</div>
			</div>
			<br>
			<div class="row" >
				<div class="col-2"></div>
				<div class="col">
					동아리설명: ${applData.applVO.club_purpose }
				</div>
			</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">돌아가기</button>
	        <button type="button" class="btn btn-danger">반려</button>
	        <button type="button" class="btn btn-primary">검수</button>
	      </div>
	    </div>
	  </div>
	</div>

				<div class="row mt-3">
					<div class="col"> <!-- 페이징 -->
						<nav aria-label="Page navigation example">
						  <ul class="pagination">
						  <c:choose>
						  		<c:when test="${startPage <= 1 }">
							  		<li class="page-item disabled"><a class="page-link">&lt;</a></li>
						  		</c:when>
						  		<c:otherwise>
						  		    <li class="page-item"><a class="page-link" href="./mainPage?pageNum=${startPage - 1 }${additionalParam}">&lt;</a></li>
						  		</c:otherwise>
						  </c:choose>
						    <c:forEach begin="${startPage }" end="${endPage }" var="i">
						    	<c:choose>
						    		<c:when test="${i == currentPageNum }">
										<li class="page-item active"><a class="page-link" href="./mainPage?pageNum=${i}${additionalParam}">${i}</a></li>  		
						    		</c:when>
						    		<c:otherwise>
						    			<li class="page-item"><a class="page-link" href="./mainPage?pageNum=${i}${additionalParam}">${i}</a></li>
						    		</c:otherwise>
						    	</c:choose>
						    </c:forEach>
						    <c:choose>
						    	<c:when test="${endPage >= totalPageCount }">
							    	<li class="page-item disabled"><a class="page-link">&gt;</a></li>
						    	</c:when>
						    	<c:otherwise>
						    		<li class="page-item"><a class="page-link" href="./mainPage?pageNum=${endPage+1}${additionalParam}">&gt;</a></li>
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