<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 봉사시간관리</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="/cbh/resources/css/staff_MainPage.css">	
<style type="text/css">
.tab {
	border: 1px solid white;
	border-bottom: 0px;
	background-color: black;
	color: white;
	width: auto;
	align-self: end;
	flex: 0 0 auto;
	border-radius: 0.3rem 0.3rem 0% 0%;
}

.scroll-container {
	display: flex;
	flex-wrap: no-wrap;
	overflow-x: hidden;
	overflow-y: hidden;
	align-items: end;
}

.MP {
	padding-left: 2.2rem;
}

#bigMenuText{
	font-size: 2.5vh;
}
#sideBar>ul>li{
	font-size: 2vh;
	padding-left: 1.0vw;
}
#sideBar>ul>li>div{
	background:linear-gradient( to right, #d6d6d6 , #ededed );
	margin-right: 1.0vw;
	padding-left:1vw;
	border-radius: 5vh;
	color:#969696;
	font-weight: bold;
}
#sideBar>ul>li>div{
	margin-bottom: .2vh;
	margin-right: 1.0vw;
	padding-left:1vw;
	border-radius: 5vh;
}
#sideBar li ul li{
	font-size: 1.8vh;
	list-style-type: disc;
	list-style: none;
	margin-bottom: .5vh;
	color: #828282;
}
#sideBar li ul li:hover{
	font-weight: bold;
	color: #bf1f51;
	letter-spacing: 0.05vw;
}
#sideBar ul{
	margin-bottom: 1.5vh;
	padding-left: 0;
}
#sideBar li ul{
	padding-left: 1vw;
	margin-bottom: 2.2vh;
}
.bi-chevron-right{
	
}
</style>
<script type="text/javascript">
	function allClubData(){
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var jsonObj = JSON.parse(xhr.responseText);
				
				for(var list of jsonObj.allStudList){
					var tbodyBox = document.getElementById("tbody2");
					var trBox = document.createElement("tr");
					var tdBox1 = document.createElement("td");
					tdBox1.innerText = list.studVo.stud_id;
					var thBox2 = document.createElement("th");
					thBox2.innerText = list.studVo.stud_name;
					var tdBox2 = document.createElement("td");
					tdBox2.innerText = list.studVo.stud_dept;
					var thBox3 = document.createElement("th");
					thBox3.innerText = list.studVo.stud_grade;
					var tdBox3 = document.createElement("td");
					tdBox3.innerText = list.studVo.stud_state;
					var thBox4 = document.createElement("th");
					thBox4.innerText = list.studVo.stud_phone;
					var tdBox4 = document.createElement("td");
					tdBox4.innerText = list.clubStudVo.club_stud_grade;
					trBox.appendChild(tdBox1);
					trBox.appendChild(thBox2);
					trBox.appendChild(tdBox2);
					trBox.appendChild(thBox3);
					trBox.appendChild(tdBox3);
					trBox.appendChild(thBox4);
					trBox.appendChild(tdBox4);
					tbodyBox.appendChild(trBox);
				}
				
			
			}
		}
	
		xhr.open("post" , "/cbh/staff/club/allClubData"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send();
		
	}

	function refresh(){
		var tbodyBox = document.getElementById("tbody2");
		tbodyBox.innerHTML = "";
	}

	function clubData() {
	
		var xhr = new XMLHttpRequest();
	
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var jsonObj = JSON.parse(xhr.responseText);
				
				for(var dd of jsonObj.data){
				var tbodyBox = document.getElementById("tbody");
				var trBox = document.createElement("tr");
				var tdBox1 = document.createElement("td");
				tdBox1.innerText = dd.club_no;
				var tdBox2 = document.createElement("td");
				tdBox2.innerText = dd.club_name;
				tdBox2.setAttribute("onclick" , "getStudData("+dd.club_no+")");
				trBox.appendChild(tdBox1);
				trBox.appendChild(tdBox2);
				tbodyBox.appendChild(trBox);
				
				}
			
			}
		}
	
		xhr.open("post" , "/cbh/staff/club/clubData"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send();
	}
	
	function getStudData(club_no){
		
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var jsonObj = JSON.parse(xhr.responseText);
				
				refresh();
				for(var list of jsonObj.studList){
					var tbodyBox = document.getElementById("tbody2");
					var trBox = document.createElement("tr");
					var tdBox1 = document.createElement("td");
					tdBox1.innerText = list.studVo.stud_id;
					var thBox2 = document.createElement("th");
					thBox2.innerText = list.studVo.stud_name;
					var tdBox2 = document.createElement("td");
					tdBox2.innerText = list.studVo.stud_dept;
					var thBox3 = document.createElement("th");
					thBox3.innerText = list.studVo.stud_grade;
					var tdBox3 = document.createElement("td");
					tdBox3.innerText = list.studVo.stud_state;
					var thBox4 = document.createElement("th");
					thBox4.innerText = list.studVo.stud_phone;
					var tdBox4 = document.createElement("td");
					tdBox4.innerText = list.clubStudVo.club_stud_grade;
					trBox.appendChild(tdBox1);
					trBox.appendChild(thBox2);
					trBox.appendChild(tdBox2);
					trBox.appendChild(thBox3);
					trBox.appendChild(tdBox3);
					trBox.appendChild(thBox4);
					trBox.appendChild(tdBox4);
					tbodyBox.appendChild(trBox);
				}
				
			}
		}
	
		xhr.open("get" , "/cbh/staff/club/getStudData?club_no=" + club_no); //리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send();
		
	}
	
	function search(){
	
		var stud_name = document.getElementById("nameSearchInput").value;
		var stud_id = document.getElementById("idSearchInput").value;
				
		var xhr = new XMLHttpRequest();

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var jsonObj = JSON.parse(xhr.responseText);
				
				refresh();
				
				for(var e of jsonObj.searchStudList){
					var tbodyBox = document.getElementById("tbody2");
					var trBox = document.createElement("tr");
					var tdBox1 = document.createElement("td");
					tdBox1.innerText = e.STUD_ID;
					var thBox2 = document.createElement("th");
					thBox2.innerText = e.STUD_NAME;
					var tdBox2 = document.createElement("td");
					tdBox2.innerText = e.STUD_DEPT;
					var thBox3 = document.createElement("th");
					thBox3.innerText = e.STUD_GRADE;
					var tdBox3 = document.createElement("td");
					tdBox3.innerText = e.STUD_STATE;
					var thBox4 = document.createElement("th");
					thBox4.innerText = e.STUD_PHONE;
					var tdBox4 = document.createElement("td");
					tdBox4.innerText = e.CLUB_STUD_GRADE;
					trBox.appendChild(tdBox1);
					trBox.appendChild(thBox2);
					trBox.appendChild(tdBox2);
					trBox.appendChild(thBox3);
					trBox.appendChild(tdBox3);
					trBox.appendChild(thBox4);
					trBox.appendChild(tdBox4);
					tbodyBox.appendChild(trBox);
				}
				
			}
		}
	
		xhr.open("get", "/cbh/staff/club/search?stud_name="+ stud_name + "&stud_id="+ stud_id);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
	}
	
	
	window.addEventListener("DOMContentLoaded", function() {
	clubData();
	allClubData();
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
      
		<div class="row mt-5 box p-2">
			 <div class="col-auto">
			    <label class="col-form-label">학생이름</label>
			  </div>
			  <div class="col-auto">
			    <input id="nameSearchInput" type="text" class="form-control" placeholder="학생이름을 입력해주세요">
			  </div>
			  <div class="col-auto">
			    <label class="col-form-label">학생아이디</label>
			  </div>
			  <div class="col-auto">
			    <input id="idSearchInput" type="text" class="form-control" placeholder="학생아이디를 입력해주세요">
			  </div>
			  <div class="col">
			  	<button class="btn btn-primary" onclick="search()">검색</button>
			  </div>
		</div>
			  
			  <div class="row mt-4 box p-3 text-center" style="height: 550px; overflow: auto;">
			  	<div class="col-3">
			  		<div class="row mt-2">
			  			<table class="table table-bordered">
						  <thead>
						    <tr style="background-color: lightgrey">
						      <th scope="col">구분코드</th>
						      <th scope="col">동아리이름</th>
						    </tr>
						  </thead>
						  <tbody id="tbody">
						   
						  </tbody>
						</table>
			  		</div>
			  		
			  	</div>
			  	
			  	<div class="col-9">
			  		<div class="row mt-2">
			  			<table class="table table-bordered table-striped">
						  <thead>
						    <tr style="background-color: lightgrey">
						      <th scope="col">학번</th>
						      <th scope="col">이름</th>
						      <th scope="col">소속학과</th>
						      <th scope="col">학년</th>
						      <th scope="col">학적</th>
						      <th scope="col">연락처</th>
						      <th scope="col">직책</th>
						    </tr>
						  </thead>
						  <tbody id="tbody2">
						   
						  </tbody>
						</table>
			  		</div>
			  	</div>
			  </div>
		
		
		
		
		
		
		
		
		
		
			
	</div>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>