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
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">


#title{
	font-weight: bold;
	font-size: 3vh;
	color: #bf1f51;
}

.form-check-input:checked {
    border-color:#FA5858;
    background-color: #FA5858;
 }
.form-check-input{
  border-color:#FA5858;
 }

</style>
<script type="text/javascript">
	
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

	function deleteAppl(noticeNo){
		
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
	
	function refreshApplList(){
		
		var xhr = new XMLHttpRequest(); 
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);
				
// 				var tbodyBox = document.getElementById("tbody");
// 				tbodyBox.innerHTML = ""
				
				
			}
		}
		
	}
	
// 	function stateChange(){
					
// 				if($(".reject").click()){
// 				var tdState = document.getElementById("state");
// 				tdState.innerHTML = "";
// 				tdState.innerHTML = "반려";
// 				}
				
// 				if($(".accept").click()){
// 				var tdState = document.getElementById("state");
// 				tdState.innerHTML = "";
// 				tdState.innerHTML = "승인";
			
// 		}
		
// 	}
	
	function checkAll(){
		if($(".checkAll").check()){
			
		}
			
		
	}

	function updateState(NO,STATE){
		var jsonObj = {
				"NO" : NO,
				"STATE": STATE
			}
		
		var param = JSON.stringify(jsonObj);
		
		
		var xhr = new XMLHttpRequest(); 
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);
				//callback
			
				var applyListbar = document.getElementById("applyListbar")
				applyListbar.submit();
			
			}
		}
		xhr.open("post" ,"/cbh/staff/restApplyClub/updateClubApplyState");
		xhr.setRequestHeader("Content-type","application/json");
		xhr.send(param);
	}
	
	
	function modalOn(no){
		var myModal = new bootstrap.Modal(document.getElementById('exampleModal'))
		
		
		var xhr = new XMLHttpRequest(); 
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText);
				//callback
			
				var CLUB_NAME = document.getElementById("CLUB_NAME");
				var STUD_ID = document.getElementById("STUD_ID");
				var PEOPLE_COUNT = document.getElementById("PEOPLE_COUNT");
				var PURPOST = document.getElementById("PURPOST");
				
				var reject = document.getElementById("reject");
				var accept = document.getElementById("accept");
				
				CLUB_NAME.innerHTML = "";
				STUD_ID.innerHTML = "";
				PEOPLE_COUNT.innerHTML = "";
				PURPOST.innerHTML = "";
			
				CLUB_NAME.innerText = result.data.applVO.club_name;
				STUD_ID.innerText = result.data.applVO.stud_id;
				PEOPLE_COUNT.innerText = result.data.applVO.club_appl_people_count;
				PURPOST.innerText = result.data.applVO.club_purpose;
				
				
				reject.setAttribute("onclick","updateState("+result.data.applVO.club_appl_no+",2)")
				accept.setAttribute("onclick","updateState("+result.data.applVO.club_appl_no+",1)")
				
				
				
				myModal.show();
				
			}
		}
		xhr.open("get" , "/cbh/staff/restApplyClub/getClubApply?no=" + no);
		xhr.send();
		
	}


 	window.addEventListener('DOMContentLoaded' , function(){

 	});

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
            class="text-uppercase font-weight-bold" style="color: #FA5858">MENU</small>
      </button>
		
	<form id="applyListbar" action="./staff_applyClubPage" method="get">
		<div class="row mt-4 ms-1 ps-3 box" style="height: 45px; align-items: center">
			<div class="col-1">
				동아리명
			</div>
			<div class="col-3">
				<input class="container-fluid form-control" name="searchWord" type="text">
			</div>
			<div class="col-6" style=""></div>
			<div class="col d-grid" style="">
				<button class="btn btn-outline-primary py-1" type="submit"><i class="bi bi-search"></i>조회</button>
			</div>
			<div class="col d-grid" style="">
				<button onclick="deleteNotice()" class="btn btn-outline-danger py-1" type="button">삭제</button>
			</div>			
		</div>
	</form>
		
	<div class="row mt-4 box ms-1 p-4" style="height: 65vh;">
		<div class="col">
			<table class="table table hover caption-top table-sm" >
			  <thead style="background-color: rgb(252, 243, 243);">
			    <tr>
					<th><input id="checkAll" onclick="checkAll()" type="checkbox" class="form-check-input" value="전체체크"></th>
					<th class="col-4" style="text-align: center">동아리</th>
					<th class="col-2" style="text-align: center">신청인</th>
					<th class="col-5" style="text-align: center">선택일시</th>
					<th class="col-1" style="text-align: center">상태</th>
				<tr>
			</thead>
			<tbody id="tbody">
					<c:forEach items="${clubApplDataList}" var="clubApplData">
						<tr>
						  <th><input id="check" onclick="check()" type="checkbox" class="form-check-input" value="${clubApplData.club_appl_no }"></th>
						  <!-- <td><a href="./staff_readClubRequestPage?=${clubApplData.club_ApplVO.club_appl_no }">${clubApplData.club_ApplVO.club_name }</a></td> -->
					      <!-- Button trigger modal -->
					      <td style="text-align: center; color:#FA5858;"><a onclick="modalOn(${clubApplData.club_ApplVO.club_appl_no })">${clubApplData.club_ApplVO.club_name }</a></td>
					      <td style="text-align: center">${clubApplData.studVO.stud_name }</td>
					      <td style="text-align: center"><fmt:formatDate value ="${clubApplData.club_ApplVO.club_appl_date }" pattern="yyyy년 MM월 dd일"/></td>
					      <td id="state" style="text-align: center">
					      <c:choose>
					      	<c:when test="${clubApplData.club_ApplVO.club_appl_state eq 1}">
					      		임시승인
					      	</c:when>
					      	<c:when test="${clubApplData.club_ApplVO.club_appl_state eq 2}">
					      		반려
					      	</c:when>
					      	<c:when test="${clubApplData.club_ApplVO.club_appl_state eq 3}">
					      		심사중
					      	</c:when>
					      	<c:when test="${clubApplData.club_ApplVO.club_appl_state eq 4}">
					      		승인
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
	        <h5 class="modal-title" id="exampleModalLabel" style="font-weight: bold">신청 상세</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
			     <div class="row" >
				<div class="col-3" style="font-weight: bold">동아리 이름:</div>
				<div id="CLUB_NAME" class="col">
				</div>
			</div>
			<br>
			<div class="row" >
				<div class="col-3" style="font-weight: bold">학번:</div>
				<div id="STUD_ID" class="col">
				</div>
			</div>
			<br>
			<div class="row" >
				<div class="col-3" style="font-weight: bold">신청인원:</div>
				<div id="PEOPLE_COUNT" class="col">
				</div>
			</div>
			<br>
			<div class="row" >
				<div class="col-3" style="font-weight: bold">동아리설명:</div>
				<div id="PURPOST" class="col">
				</div>
			</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">돌아가기</button>
	        <button id="reject" type="button" class="btn btn-danger" data-bs-dismiss="modal">반려</button>
	        <button id="accept" type="button" class="btn btn-primary" data-bs-dismiss="modal">승인</button>
	      </div>
	    </div>
	  </div>
	</div>

				<div class="row mt-3">
					<div class="col"> <!-- 페이징 -->
						<nav aria-label="Page navigation example">
						  <ul class="pagination" style="justify-content: center">
						  <c:choose>
						  		<c:when test="${startPage <= 1 }">
							  		<li class="page-item disabled"><a class="page-link" 
							  			href="#" style="text-decoration-line: none; color: red;">◀</a></li>
						  		</c:when>
						  		<c:otherwise>
						  		    <li class="page-item"><a class="page-link" 
						  		    	style="text-decoration-line: none; color: black;"
						  		    	href="./staff_applyClubPage?pageNum=${startPage - 1 }${additionalParam}">◀</a></li>
						  		</c:otherwise>
						  </c:choose>
						    <c:forEach begin="${startPage }" end="${endPage }" var="i">
						    	<c:choose>
						    		<c:when test="${i == currentPageNum }">
										<li class="page-item active"><a class="page-link" 
											style="text-decoration-line: none; border-color:#FA5858; background-color: #FA5858; font-weight: 600;"
											href="./staff_applyClubPage?pageNum=${i}${additionalParam}">${i}</a></li>  		
						    		</c:when>
						    		<c:otherwise>
						    			<li class="page-item"><a class="page-link" 
						    				style="text-decoration-line"
						    				href="./staff_applyClubPage?pageNum=${i}${additionalParam}">${i}</a></li>
						    		</c:otherwise>
						    	</c:choose>
						    </c:forEach>
						    <c:choose>
						    	<c:when test="${endPage >= totalPageCount }">
							    	<li class="page-item disabled"><a class="page-link"
							    		style="text-decoration-line: none; color: red;"
							    		href="./staff_applyClubPage?pageNum=${endPage+1}${additionalParam}">▶</a></li>
						    	</c:when>
						    	<c:otherwise>
						    		<li class="page-item"><a class="page-link" 
						    			style="text-decoration-line: none; color: black;"
						    			href="./staff_applyClubPage?pageNum=${endPage+1}${additionalParam}">▶</a></li>
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