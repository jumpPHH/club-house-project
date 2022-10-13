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
<script src="https://code.jquery.com/jquery-3.6.1.js"
        integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
        crossorigin="anonymous">
</script>




<style type="text/css">

</style>

<script type="text/javascript">
	
	

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
	
	
	
	
	window.addEventListener("DOMContentLoaded" , function (){
		//사실상 처음 실행하는 코드 모음...
		
		//setInterval(refreshCommentList , 3000); //폴링 방식의 실시간... 화면 갱신...
		
	});
	
	
</script>


<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/student_common/student_navigationvar.jsp"></jsp:include>

<div class="page-content p-5" id="content">
		<!-- 토글 버튼 -->
		<button id="sidebarCollapse" type="button"
			class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4">
			<i class="fa fa-bars mr-2"></i><small
				class="text-uppercase font-weight-bold"
				style="box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075) !important;">Toggle</small>
		</button>

		<div class="row card box" style="width: 100%; height: 45px; margin-left:0.1em; margin-bottom:1em;">
				<div class="dashboard-card-bottom">
					<div class="row">

						<div class="col-1"></div>

						<div class="col">

							<div class="row ps-1 p-2 mb-2">
								<div class="col text-center">
									<div class="row" style="justify-content: center; border-right: 2px solid #ededed">
										<a
											href="/cbh/student/myclub/clubactivities/student_indexPage?club_no=${clubNo }"
											class="col-auto px-3" onmouseover="clickMove(this)"
											style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none;">
											동아리 활동내역 </a>
									</div>
								</div>
								
								<div  class="col text-center">
									<div class="row" style="justify-content: center">
										<a id="student_MemberShipFeeMgmtListPage" 
										 href="/cbh/student/myclub/writeClubActPage?club_no=${clubNo}"
										 class="col-auto px-3" style="cursor: pointer; border-radius: 2rem;
										  color: #4140cb; font-weight: bold; text-decoration:none;">
										 활동내역 작성
										</a>
									</div>
								</div>
							</div>
							
						</div>
						<div class="col-1"></div>
					</div>
				</div>
			</div>



		<div class="card"
			style="width: 100%; height: auto; border-radius: 15px; box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075) !important; padding: 30px;">
			<div class="dashboard-card-bottom">
				<!-- 실제 내용 -->

				<div class="container-fluid">
		<div class="row" >
			<div class="col">
				
				<!-- 여기다 작성하세요 -->
				<div class="row">
					<div class="col" id="content">
						 	<!-- 컨텐트 박스 -->
							<form action="./student_modifyClubActProcess">
							<div class="row">
								<div class="col">
									<div class="row">
										<div class="col mt-4 mb-2" style="text-align:left;">
											<h2>동아리 활동내역 수정</h2>
										</div>
									</div>
									<!-- 글 제목 입력 칸 -->
									<div class="mt-5">제목</div>
									<div class="row mt-3">
										<div class="col">
											<input type="text" value="동아리 회비는 이 날 내주세요." class="form-control" name="club_act_title">
										</div>
									</div>
									<!-- 글 내용 입력 칸 -->
									<div class="mt-5">내용</div>
									<div class="row mt-3">
										<div class="col" style="text-align:center">
											<textarea class="form-control" name="club_act_content" placeholder="동아리 회비는 이 날 내주세요." style="width:100%; height:10em;"></textarea>
										</div>
										<input type="hidden" name="club_no" value="${clubNo }">
										<input type="hidden" name="club_act_no" value="${clubActNo }">
									</div>
									
									<div class="row mt-5 mb-5">
										<div class="col" style="text-align:right">
											<button class="btn btn-secondary mr-3">취소</button>
											<button class="btn btn-danger">제출</button>
										</div>
									</div>
								</div>
							</div>
							<input type="hidden" name="club_no" value="${clubNo }">
							</form>
						</div>
						</div>
				</div>
			</div>
		</div>
		</div>
	</div>
	</div>
					
</body>
</html>