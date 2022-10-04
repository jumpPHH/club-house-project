<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생조회 페이지</title>
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
<script type="text/javascript">
	function clubData() {
	
		var xhr = new XMLHttpRequest();
	
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var jsonObj = JSON.parse(xhr.responseText);
				
				for(var dd of jsonObj.data){
				var tbodyBox = document.getElementById("tbody");
				var tr = document.createElement("tr");
				var td1 = document.createElement("td");
				var td2 = document.createElement("td");
				td1.innerText = dd.club_no;
				td2.innerText = dd.club_name;
				tr.appendChild(td1);
				tr.appendChild(td2);
				tbodyBox.appendChild(tr);
				
				}
			
			}
		}
	
		xhr.open("post" , "/cbh/staff/club/clubData"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send();
	}
	
	function clubStudData(){
		
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var jsonObj = JSON.parse(xhr.responseText);
				
				
			}
		}
	
		xhr.open("post" , "/cbh/staff/club/clubData"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send();
		
	}
	
	window.addEventListener("DOMContentLoaded", function() {
	clubData();
});
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

		<!-- 버튼 form으로 조회하고 신규삭제 ajax써야할듯-->
		<div class="row mt-4 box p-4"  style="border-color: grey">
			<div class="col">
				학번(이름)
			</div>
			<div class="col">
				<input type="text">
			</div>
			<div class="col">
				학적상태
			</div>
			<div class="col">
				<select name="searchType" >
					<option value="attending">재학</option>
					<option value="absence">휴학</option>
					<option value="drop">제적</option>
					<option value="graduate">졸업</option>					
				</select>
			</div>
			<div class="col">
				소속학과
			</div>
			<div class="col">
				<input type="text">
			</div>
		
			<div class="col" style="">
				<button class="btn btn" type="button">조회</button>
			</div>
			<div class="col" style="">
				<button class="btn btn" type="button">신규</button>
			</div>
			<div class="col" style="">
				<button class="btn btn" type="button">삭제</button>
			</div>
			<div class="col" style="">
				<button class="btn btn" type="button">저장</button>
			</div>
		</div>
<!-- 		<div class="row"> -->
<!-- 			<div class="col"> -->
<!-- 				학생정보 건이 조회되었습니다 -->
<!-- 			</div> -->
<!-- 		</div> -->
		<!-- 학생정보 -->
			<div class="row mt-4 box p-4">
				<div class="col">
					<table class="table">
						<thead>
							<tr>
								<th scope="col"><input onclick="totalCheck()" type="checkbox" class="form-check-input"></th>
								<th scope="col">학번</th>
								<th scope="col">이름</th>
								<th scope="col">성별</th>
								<th scope="col">소속학과</th>
								<th scope="col">학년</th>
								<th scope="col">학적상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="" var="list">
								<tr>
									<td><input onclick="" type="checkbox"  class="form-check-input"></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

		</div>


	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>