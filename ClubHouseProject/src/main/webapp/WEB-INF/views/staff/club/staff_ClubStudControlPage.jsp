<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 봉사시간관리</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
.selectTh{
	font-size: 15px;
	color: #FA5858;
	font-weight: bold;
}
.selectDiv{
color: #FA5858;
font-size: 1.2rem;
font-weight: bold;
}
.coloR{
color: #FA5858;
font-size: 1.2rem;
font-weight: bold;
}
</style>
<script type="text/javascript">
	function allClubData(e){
		if(e){
			$(".selectDiv").removeClass("selectDiv");
			e.classList.toggle('selectDiv');
			}
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var jsonObj = JSON.parse(xhr.responseText);
				
				refresh();
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
					var thBox5 = document.createElement("th");
					var buttonBox = document.createElement("button");
					var buttonBox2 = document.createElement("button");
					buttonBox.innerText = "수정하기";
					buttonBox.classList.add("btn");
					buttonBox.classList.add("py-0");
					buttonBox.setAttribute("style", "color: blue");
					buttonBox2.innerText = "삭제하기";
					buttonBox2.classList.add("btn");
					buttonBox2.classList.add("py-0");
					buttonBox2.setAttribute("style", "color: red");
					thBox5.appendChild(buttonBox);
					thBox5.appendChild(buttonBox2);
					trBox.appendChild(tdBox1);
					trBox.appendChild(thBox2);
					trBox.appendChild(tdBox2);
					trBox.appendChild(thBox3);
					trBox.appendChild(tdBox3);
					trBox.appendChild(thBox4);
					trBox.appendChild(tdBox4);
					trBox.appendChild(thBox5);
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
				var rowBox = document.getElementById("headingOne");
				
				var forIndex=0;
				var divBox = document.createElement("div");
				divBox.innerText = "전체";
				divBox.setAttribute("onClick" , "allClubData(this)");
				divBox.classList.add("thClick");
				divBox.classList.add("col");
				rowBox.appendChild(divBox);
				
				for(var list of jsonObj.data){
					forIndex++;
					
					var divBox = document.createElement("div");
					divBox.innerText = list.club_name;
					divBox.setAttribute("onclick" , "getStudData("+list.club_no+",this)");
					divBox.classList.add("thClick");
					divBox.classList.add("col");
					divBox.classList.add("mb-3");
					
					if(forIndex >= 5){
						document.getElementById("collapseText").appendChild(divBox);
						
						
					}else{
						rowBox.appendChild(divBox);
					}
				
				}
				
				
			}
		}
	
		xhr.open("post" , "/cbh/staff/club/clubData"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send();
	}
	
	function getStudData(club_no, e){
		if(e){
			$(".selectDiv").removeClass("selectDiv");
			e.classList.toggle('selectDiv');
			}
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
					var thBox5 = document.createElement("th");
					var buttonBox = document.createElement("button");
					var buttonBox2 = document.createElement("button");
					buttonBox.innerText = "수정하기";
					buttonBox.classList.add("btn");
					buttonBox.classList.add("py-0");
					buttonBox.setAttribute("style", "color: blue");
					buttonBox2.innerText = "삭제하기";
					buttonBox2.classList.add("btn");
					buttonBox2.classList.add("py-0");
					buttonBox2.setAttribute("style", "color: red");
					thBox5.appendChild(buttonBox);
					thBox5.appendChild(buttonBox2)
					
					trBox.appendChild(tdBox1);
					trBox.appendChild(thBox2);
					trBox.appendChild(tdBox2);
					trBox.appendChild(thBox3);
					trBox.appendChild(tdBox3);
					trBox.appendChild(thBox4);
					trBox.appendChild(tdBox4);
					trBox.appendChild(thBox5);
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
					var thBox5 = document.createElement("th");
					var buttonBox = document.createElement("button");
					var buttonBox2 = document.createElement("button");
					buttonBox.innerText = "수정하기";
					buttonBox.classList.add("btn");
					buttonBox.classList.add("py-0");
					buttonBox.setAttribute("style", "color: blue");
					buttonBox2.innerText = "삭제하기";
					buttonBox2.classList.add("btn");
					buttonBox2.classList.add("py-0");
					buttonBox2.setAttribute("style", "color: red");
					thBox5.appendChild(buttonBox);
					thBox5.appendChild(buttonBox2)
					trBox.appendChild(tdBox1);
					trBox.appendChild(thBox2);
					trBox.appendChild(tdBox2);
					trBox.appendChild(thBox3);
					trBox.appendChild(tdBox3);
					trBox.appendChild(thBox4);
					trBox.appendChild(tdBox4);
					trBox.appendChild(thBox5);
					tbodyBox.appendChild(trBox);
				}
				
			}
		}
	
		xhr.open("get", "/cbh/staff/club/search?stud_name="+ stud_name + "&stud_id="+ stud_id);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send();
	}
	
	
	window.addEventListener("DOMContentLoaded", function() {
		var navtab = document.getElementById("ClubStudControlPage")
		navtab.setAttribute("style", "border-right: 5px solid #FA5858");
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
         class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-3" style="color: #FA5858">
         <i class="fa fa-bars mr-2"></i><small
            class="text-uppercase font-weight-bold">MENU</small>
      </button>
      
		<div class="row box ps-3 ms-1" style="height: 45px;align-content: center;">
			 <div class="col-auto ps-3">
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
			  <div class="col-auto">
			  	<button class="btn btn-primary" onclick="search()">검색</button>
			  </div>
		</div>
			  
			 <div class="row mt-3 mb-2 ms-1 box p-2 text-center py-1"> 
			  	
			 	 <div class="accordion" id="accordionExample">
						  <div class="row">
							    <div class="col">
									<div class="row mt-2 row-cols-5 accordion-header" id="headingOne">
										
							    	</div>
								
									
								</div>
								<div class="col-1 text-center">
				 			    	<button class="collapsed btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
				 			    		<i class="bi bi-caret-down" style="size: 15px"></i>
				 			      	</button>
							    </div>
													    					      
							  
							</div>
				  </div> 
			  	<div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
				      <div class="accordion-body" >
				      			<div class="row">
				      				<div class="col">
				      					<div class="row row-cols-5" id="collapseText">
				      					
				      					</div>
				      				</div>
				      				<div class="col-1">
				      					
				      				</div>
				      			</div>
				      			
				      </div>
				    </div>
				  </div>
		  		<div class="row box ms-1 p-2 text-center">
				  	<div class="col" style="height: 67vh; overflow: auto;">
			  			<table class="table table-bordered table-sm">
						  <thead class="sticky-top">
						    <tr style="background-color: rgb(252, 243, 243)">
						      <th scope="col">학번</th>
						      <th scope="col">이름</th>
						      <th scope="col">소속학과</th>
						      <th scope="col">학년</th>
						      <th scope="col">학적</th>
						      <th scope="col">연락처</th>
						      <th scope="col">직책</th>
						      <th scope="col">관리</th>
						    </tr>
						  </thead>
						  <tbody id="tbody2">
						   
						  </tbody>
						</table>
			  		</div>
			  	</div>
			</div>
		
		
		
		
		
		
		
		
		
		
			
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>