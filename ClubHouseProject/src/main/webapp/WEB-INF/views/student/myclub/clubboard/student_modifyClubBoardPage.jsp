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
									<span><img
										src="/cbh/resources/img/student/clubboard/titleLogo.png"
										style="margin-left: 0.5em; width: 1.5em; height: 1.5em"></span>
									<span style="margin-left: 0.3em;">자유게시판</span>
								</div>
								<div class="col"></div>
							</div>
							<!-- 컨텐트 박스 -->
							<form action="./student_modifyClubBoardProcess">
							<div class="row">
								<div class="col">
									<!-- 글 제목 입력 칸 -->
									<div class="row mt-5">
										<div class="col">
											<input type="text" placeholder="제목을 입력해주세요" class="form-control" name="club_board_title" value="${clubBoardData.club_board_title }">
										</div>
									</div>
									<!-- 글 내용 입력 칸 -->
									<div class="row mt-3">
										<div class="col" style="text-align:center">
											<textarea name="club_board_content" placeholder="내용을 입력해주세요" style="width:100%">${clubBoardData.club_board_content }</textarea>
										</div>
										<input type="hidden" name="club_no" value="${clubNo }">
										<input type="hidden" name="club_board_no" value="${clubBoardNo }">
									</div>
									<div class="row mt-3">
										<div class="col" style="text-align:right">
											<button class="btn btn-secondary mr-3">취소</button>
											<button class="btn btn-danger">제출</button>
										</div>
									</div>
								</div>
							</div>
							</form>
						</div>
						<div class="col-2">
						</div>
						</div>
				</div>
			</div>
		</div>
	</div>
					
</body>
</html>