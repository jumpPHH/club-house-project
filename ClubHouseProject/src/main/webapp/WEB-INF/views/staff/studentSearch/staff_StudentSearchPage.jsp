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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">


#stud{
	overflow-x: auto;
}

thead{
	text-align: center;
}

#tbody{
	text-align: center;
}

.chkBtn{
	text-align: left;
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

	

	function studData() {
	
		var xhr = new XMLHttpRequest();
	
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var jsonObj = JSON.parse(xhr.responseText);
				
				console.log(jsonObj.studentData);
				
				for(var data of jsonObj.studentData){
				var tbodyBox = document.getElementById("tbody");
				var tr = document.createElement("tr");

				var check = document.createElement("td");
				check.classList.add("chkBtn");
				tr.appendChild(check);

	            var checkInput = document.createElement("input");
	            checkInput.classList.add("check");
	            checkInput.classList.add("form-check-input");
	            checkInput.setAttribute("onclick","deleteValue(this)")
	            checkInput.setAttribute("type","checkbox")
	            check.appendChild(checkInput);
				
				var td1 = document.createElement("td");
				td1.innerText = data.stud_id;
				tr.appendChild(td1);	
				
				var td2 = document.createElement("td");
				td2.innerText = data.stud_name;
				tr.appendChild(td2);
				
				var td3 = document.createElement("td");
				td3.innerText = data.stud_gender;
				tr.appendChild(td3);
				
				var td4 = document.createElement("td");
				td4.innerText = data.stud_dept;
				tr.appendChild(td4);
				
				var td5 = document.createElement("td");
				td5.innerText = data.stud_grade;
				tr.appendChild(td5);
				
				var td6 = document.createElement("td");
				td6.innerText = data.stud_state;
				tr.appendChild(td6);
				
				tbodyBox.appendChild(tr);
				
				}
			
			}
		}
	
		xhr.open("post" , "/cbh/staff/studentSearch/studData");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
	}
	
	
	
	function deleteData(stud_id){
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var jsonObj = JSON.parse(xhr.responseText);
				
				$(".checkedDelte").closest(".check").remove();
				
				//refreshStudDataList();
				
			}
		}
		xhr.open("get" , "/cbh/staff/studentSearch/deleteData?stud_id=" + stud_id);
		xhr.send();
	}
	
	function updateData(stud_id){
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var jsonObj = JSON.parse(xhr.responseText);
				
				
				
			}
		}
		xhr.open("post" , "/cbh/staff/studentSearch/updateData");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
	}
	
	
	function refreshStudDataList(stud_id){
		var xhr = new XMLHttpRequest();
		
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var jsonObj = JSON.parse(xhr.responseText);
			
					
					var tbodyBox = document.getElementById("tbody");
					tbodyBox.innerHTML = "";
					
					
					for(var data of jsonObj.studentData){
						var tbodyBox = document.getElementById("tbody");
						var tr = document.createElement("tr");							
							
// 						if($(".check").click && $("deleteData()").click()){
// 							$(".check").closest(".input").remove();
// 						}
						
						
						var check = document.createElement("td");
						tr.appendChild(check);

			            var checkInput = document.createElement("input");
			            checkInput.classList.add("check");
			            checkInput.classList.add("form-check-input");
			            checkInput.setAttribute("onclick","deleteValue(this)")
			            checkInput.setAttribute("type","checkbox")
			            check.appendChild(checkInput);
						
						var td1 = document.createElement("td");
						td1.innerText = data.stud_id;
						tr.appendChild(td1);							
						
						var td2 = document.createElement("td");
						td2.innerText = data.stud_name;
						tr.appendChild(td2);
						
						var td3 = document.createElement("td");
						td3.innerText = data.stud_gender;
						tr.appendChild(td3);
						
						var td4 = document.createElement("td");
						td4.innerText = data.stud_dept;
						tr.appendChild(td4);
						
						var td5 = document.createElement("td");
						td5.innerText = data.stud_grade;
						tr.appendChild(td5);
						
						var td6 = document.createElement("td");
						td6.innerText = data.stud_state;
						tr.appendChild(td6);
						
						tbodyBox.appendChild(tr);
						
						
						}
					
					
				}
			}
			xhr.open("get" , "/cbh/staff/studentSearch/studData?stud_id=");
			xhr.send();
	}
	
	function totalCheck(){
 		$(".check").click();
 		
 	}
	
	function deleteValue(e){
		e.classList.remove("checkedDelte")
	}
	
	
	window.addEventListener("DOMContentLoaded", function() {
	studData();
	//refreshStudDataList();
	
});
</script>
</head>
<body>

<jsp:include page="/WEB-INF/views/staff_common/staff_sidevar.jsp"></jsp:include>

	 <!-- 페이지 내용 부분 시작 (이 부분만 카피해서 사용할것. 카피 후 삭제) -->
   <div class="page-content p-5 pt-4" id="content" style="">
     <!-- 토글 버튼 -->
      <button id="sidebarCollapse" type="button"
         class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-3">
         <i class="fa fa-bars mr-2"></i><small
            class="text-uppercase font-weight-bold" style="color: #FA5858">MENU</small>
      </button>

		<!-- 버튼 form으로 조회하고 신규삭제 ajax써야할듯-->
		<div class="row ps-3 ms-1 mt-4 box" style="height: 45px; align-items: center;">
			<div class="col-1">
				학번(이름)
			</div>
			<div class="col-3">
				<input class="container-fluid form-control" type="text">
			</div>
			<div class="col-1">
				학적상태
			</div>
			<div class="col-1">
				<select class=" form-select" name="searchType" >
					<option value="attending">재학</option>
					<option value="absence">휴학</option>
					<option value="drop">제적</option>
					<option value="graduate">졸업</option>					
				</select>
			</div>
			<div class="col-1">
				소속학과
			</div>
			<div class="col-3">
				<input class="container-fluid form-control" type="text">
			</div>
		
			<div class="col d-grid" style="">
				<button class="btn btn-outline-primary py-1" type="button"><i class="bi bi-search"></i>조회</button>
			</div>
<!-- 			<div class="col" style=""> -->
<!-- 				<button class="btn btn" type="button">신규</button> -->
<!-- 			</div> -->
			<div class="col d-grid" style="">
				<button onclick="deleteData()" class="btn btn-outline-danger py-1" type="button">삭제</button>
			</div>
<!-- 			<div class="col" style=""> -->
<!-- 				<button class="btn btn" type="button">저장</button> -->
<!-- 			</div> -->
		</div>
<!-- 		<div class="row"> -->
<!-- 			<div class="col"> -->
<!-- 				학생정보 건이 조회되었습니다 -->
<!-- 			</div> -->
<!-- 		</div> -->
		<!-- 학생정보 -->
			<div class="row mt-4 ms-1 box p-4" id="stud" style="height: 70vh; overflow: auto;">
				<div class="col">
					<table class="table table-sm table-hover">
						<thead style="background-color: rgb(252, 243, 243);">
							<tr>
								<th scope="col" style="text-align: left;"><input id="totalCheck" onclick="totalCheck()" type="checkbox" class="form-check-input"></th>
								<th scope="col">학번</th>
								<th scope="col">이름</th>
								<th scope="col">성별</th>
								<th scope="col">소속학과</th>
								<th scope="col">학년</th>
								<th scope="col">학적상태</th>
							</tr>
						</thead>
						<tbody id="tbody">
<!-- 								<tr> -->
<!-- 									<td><input id="chkBtn" onclick="" type="checkbox"  class="form-check-input"></td> -->
<!-- 									<td></td> -->
<!-- 									<td></td> -->
<!-- 									<td></td> -->
<!-- 									<td></td> -->
<!-- 									<td></td> -->
<!-- 									<td></td> -->
<!-- 								</tr> -->
						</tbody>
					</table>
				</div>
			</div>

		</div>


	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>