<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생메인 페이지</title>
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="/cbh/resources/css/NewFile.css">
<link rel="stylesheet" href="/cbh/resources/css/findingclub.css">

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
	
	
	
	// 홈페이지 로드시 클럽리스트 불러오기
	function getCategoryOfClubList() {
		clubCategoryNo = document.querySelector("#clubCategoryNo").innerText;
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
			
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				
				var rowNum = Math.floor(jsonObj.data.length/5 + 1);
				var Array = 0;
				var ArrayLength = jsonObj.data.length;
								
				for(let e = 0; e < rowNum; e++){
					
					for(let r = 0; r < 5; r++){
						if(Array === ArrayLength) break;
						console.log(jsonObj.data[Array].club_name);
						var clubListBox = document.querySelector("#clubListBox");
						var col1 = document.createElement("div");
						col1.classList.add("club_box", "mx-1", "my-2");
						
						var col1Img = document.createElement("img",data[Array].club_name);
						col1.innerText = jsonObj.data[Array].club_description;
						clubListBox.appendChild(col1);
						Array++;
					}
				}
			}
		}
		xhr.open("get" , "./getCategoryOfClubsAll?club_category_no=" + clubCategoryNo); //리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send(); //AJAX로 리퀘스트함..
	}
	
	window.addEventListener("DOMContentLoaded", function(){
		getCategoryOfClubList()
	});
</script>

</head>
<body>

<jsp:include page="/WEB-INF/views/student_common/student_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/student_common/student_sidevar.jsp"></jsp:include>


<div style="position: absolute; left: 13.5%; width: 86.5%; top: 14vh; height:86vh;overflow-y: auto">
	<div class="container-fluid">
		<div class="row" >
			<div class="col">
				
				<!-- 여기다 작성하세요 -->
					<!-- 컨텐트 부분 -->
					<div class="row">
						<div class="col" id="content">
							<!-- 컨텐트 of 헤더 -->
							<div class="row page_title">
								<div class="col page_title_text">
									<span><img
										src="../../resources/img/student/findingclub/pageTitle.png"
										class="page_title_image"></span> <span>동아리 찾기</span>
								</div>
								<div class="col-3 text_align_right">
									<button type="button" onclick="location.href='/cbh/student/findingclub/student_indexPage'" style="background-color: #C4073D; color: white; border-radius: 5px; border: none; width:9em; height:4vh">
										카테고리로 이동
									</button>
								</div>
							</div>
							<!-- 카테고리 제목 -->
							<div class="row">
								<div class="col text_align_center" style="margin-top:7vh">
									<h2 class="font_bold">공연예술분과</h2>
								</div>
							</div>
							<!-- 동아리 검색 -->
							<div class="row">
								<div class="col text_align_right" style="margin-top:6vh;">
									<form action="./searchProcess" method="post"></form>
									<input type="text" placeholder="동아리검색">
									<button type="submit" style="">검색</button>
								</div>
							</div>
							<div><hr style="height:1px; color:gray;" class="mx-4"></div>
							
							<!-- 진짜 컨텐트 -->
							<div class="row px-4">
								<div class="col">
									<div class="row" id="clubListBox">
									</div>
									
								</div>
							</div>
						</div>
						<div class="col-2"><div id="clubCategoryNo">${clubCategoryNo }</div></div>
					</div>				
				<!-- 여기다 작성하세요 -->
				
			</div>
		</div>
	</div>
</div>

	
	
	
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>