<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="/cbh/resources/css/NewFile.css">
<link rel="stylesheet" href="/cbh/resources/css/establishingclub.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"
        integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
        crossorigin="anonymous">
</script>




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
	
	var club_no = ${map.clubActData.club_no};
	var club_act_no = ${map.clubActData.club_act_no};
	console.log(club_no);
	

	function seeTheReason(){
// 		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
// 		xhr.onreadystatechange = function () {
			
// 			if(xhr.readyState == 4 && xhr.status == 200){
// 				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				
				
// 			}
// 		}
		
// 		xhr.open("get" , "./getReject); //리퀘스트 세팅..
// 		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
// 		xhr.send(); //AJAX로 리퀘스트함..

		var popUrl = "./establishingClubRejectReasonPage";
	    var popOption = "top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no, scrollbars=no";
	    window.open(popUrl, popOption);
	}
	
	
	function activateUpdateAndDeleteButtonIfHeIsClubBoss(){
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
			
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				var club_bossId = jsonObj.data.club_boss;
				var sessionUserId = "${sessionUserInfo.stud_id}";
				
				if(club_bossId == sessionUserId){
					var buttonBoxCol1 = document.querySelector('#buttonBox');
					
					var updateButton = document.createElement("button");
					updateButton.setAttribute("class","btn btn-danger");
					buttonBoxCol1.appendChild(updateButton);
					
					var updateButtonAhref = document.createElement("a");
					updateButtonAhref.setAttribute("href","./student_modifyClubActPage?club_no="+club_no+"&club_act_no="+club_act_no);
					updateButtonAhref.setAttribute("style","color:white");
					updateButtonAhref.innerText = "수정";
					updateButton.appendChild(updateButtonAhref);
					
					var deleteButton = document.createElement("button");
					deleteButton.setAttribute("class","btn btn-primary");
					deleteButton.setAttribute("style","margin-left:0.5em");
					buttonBoxCol1.appendChild(deleteButton);
					
					var deleteButtonAhref = document.createElement("a");
					deleteButtonAhref.setAttribute("href","./student_deleteClubActProcess?club_no="+club_no+"&club_act_no="+club_act_no);
					deleteButtonAhref.setAttribute("style","color:white");
					deleteButtonAhref.innerText = "삭제";
					deleteButton.appendChild(deleteButtonAhref);
				}
			}
		}
		
		xhr.open("get" , "./restapi/getClubData?club_no="+club_no); //리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send(); //AJAX로 리퀘스트함..

	}
	
	window.addEventListener("DOMContentLoaded" , function (){
		//사실상 처음 실행하는 코드 모음...
		activateUpdateAndDeleteButtonIfHeIsClubBoss();
		
		//setInterval(refreshCommentList , 3000); //폴링 방식의 실시간... 화면 갱신...
		
	});
	
	
</script>


<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/student_common/student_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/student_common/student_sidevar.jsp"></jsp:include>


<div style="position: absolute; left: 13.5%; width: 86.5%; top: 14vh; height:86vh;overflow-y: auto">
	<div class="container-fluid">
		<div class="row" >
			<div class="col">
				
				<!-- 여기다 작성하세요 -->
				<div class="row">
					<div class="col" id="content">
							<!-- 컨텐트 위에 헤더 -->
							<div class="row page_title">
								<div class="col-4 page_title_text">
									<span><img src="/cbh/resources/img/student/myclub/clubactivities/contentTitleLogo.png"
									 style="margin-left:0.5em; width:2.1em; height:1.5em"></span> <span style="margin-left:0.3em;">동아리 활동내역</span>
								</div>
								<div class="col"></div>
							</div>
							<!-- 컨텐트 박스 -->
							<div class="row">
								<div class="col">
									<!-- 글 제목 공간 -->	
									<div class="row">
										<div class="col" style="text-align:center;">
											<hr style="height:1px; color:gray;" class="py-3"><br>
											<h2>${map.clubActData.club_act_title }</h2><br>
											<hr style="height:1px; color:gray;" class="py-3">
										</div>
									</div>
									
									<!-- 글의 내용 공간 -->	
									<div class="row">
										<div class="col">
										
											<!-- 조회수 및 날짜 공간 -->
											<div class="row">
												<div class="col" style="text-align:right">
													조회수 : ${map.clubActData.club_readcount } |  날짜 : <fmt:formatDate value="${map.clubActData.club_act_date }" pattern="yyyy-MM-dd"/>
												</div>
											</div>
											
											<!-- 진짜 글 내용 -->
											<div class="row">
												<div class="col mt-5">
													${map.clubActData.club_act_content }
												</div>
											</div>
											<hr style="height:1px; color:gray;" class="mt-3">
											
											<!-- 목록 버튼 칸  -->
											<div class="row">
												<div class="col" id="buttonBox">
													<button class="btn btn-secondary">목록</button>
													
												</div>
											</div>
											
											<!-- 다음 글 이전글 박스 -->
											<table class="table" style="margin-top:8vh">
												<colgroup>
													<col width="25%">
													<col width>
												</colgroup>
												<thead>
												</thead>
												<tbody>
													<tr style="border-top: 1px solid #dee2e6">
														<th style="border-right: 1px solid #dee2e6; text-align:center; padding:2vh 0.5vh">다음 글</th>
														<td style="padding-left:1em; padding:2vh"><a href="./student_clubActivitiesContentPage?club_act_no=${map.NextPostActNo }">${map.NextPostTitle }</a></td>
													</tr>
													<tr style="border-top: 1px solid #dee2e6">
														<th style="border-right: 1px solid #dee2e6; text-align:center; padding:2vh 0.5vh">이전 글</th>
														<td style="padding-left:1em; padding:2vh"><a href="./student_clubActivitiesContentPage?club_act_no=${map.PreviousPostActNo }">${map.PreviousPostTitle }</a></td>
													</tr>
												</tbody>
											</table>
												
										</div>	
									</div>
								
								</div>
							</div>
						</div>
						<div class="col-2">
							<input type="hidden" id="club_no" value="${map.clubActData.club_no }">
							<input type="hidden" id="club_act_no" value="${map.clubActData.club_act_no }">
						</div>
						</div>
				</div>
			</div>
		</div>
	</div>
					
</body>
</html>