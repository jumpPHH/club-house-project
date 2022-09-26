<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동아리 신청 페이지</title>
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
<jsp:include page="/WEB-INF/views/staff_common/staff_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/staff_common/staff_sidevar.jsp"></jsp:include>

<div style="position: absolute; left: 13.5%; width: 86.5%; top: 14vh; height:86vh;overflow-y: auto; word-break: break-all">
	<div class="container-fluid" style="background-color: aqua">
		<div class="row" >
			<div class="col" id="title">
				동아리 신청 접수
			</div>
		</div>
		
		<br>
		
		<div class="row" >
			<div class="col">
				동아리구분
			</div>
			<div class="col">
				<select name="noti_div_no">
					<option selected value="0">자바동아리</option>
					<option value="1">파이썬동아리</option>					
				</select>
			</div>
			<div class="col">
				제목:<input name="searchWord" type="text">
			</div>
			<div class="col" style="">
				<button class="btn btn-primary" type="submit">조회</button>
			</div>
			<div class="col" style="">
				<button onclick="deleteNotice()" class="btn btn-danger" type="button">삭제</button>
			</div>			
		</div>

		<br>
		
		<div class="row">
				<div class="col">
					<div class="row">
						<div class="col"><input id="checkAll" onclick="checkAll()" type="checkbox" class="form-check-input" value="전체체크"></div>
						<div class="col">동아리</div>
						<div class="col">동아리구분</div>
						<div class="col">상태</div>
						<div class="col">선택일시</div>
					</div>																	
				</div>
			</div>
			
			<div class="row">
				<div class="col">
					<!-- paging UI -->

				</div>
			</div>
		
	</div>
</div>

	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>