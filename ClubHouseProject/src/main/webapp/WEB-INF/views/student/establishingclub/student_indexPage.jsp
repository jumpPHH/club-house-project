<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="/cbh/resources/css/student_navbar.css">
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


<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/student_common/student_navigationvar.jsp"></jsp:include>

<!-- 페이지 내용 부분 시작 (이 부분만 카피해서 사용할것. 카피 후 삭제) -->
<div class="page-content p-5" id="content">
  <!-- 토글 버튼 -->
		<button id="sidebarCollapse" type="button"
			class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4">
			<i class="fa fa-bars mr-2"></i><small
				class="text-uppercase font-weight-bold">Toggle</small>
		</button>
		
		
		
			<div class="container-fluid" style="background-color: #F1F1F1">
				<div class="row" >
					<div class="col">
		<div class="row">
					<div class="col" id="content">
							<!-- 컨텐트 of 헤더 -->
							<div class="row page_title">
								<div class="col-4 page_title_text">
									<span><img src="../../resources/img/student/establishingclub/contentBox_header2.png"
									 style="margin-left:0.5em; width:1.1em; height:1.5em"></span> <span style="margin-left:0.3em;">신청서 작성</span>
								</div>
								<div class="col text_align_left pt-2" style="color:red">
									* 표시가 있는 항목들은 필수 입력항목입니다.
								</div>
							</div>
							
							
							<!-- 신청서 양식 시작 -->
							<form action="./student_requestEstablishClubProcess" method="post">
							<div class="row px-4 mt-2" style="border: 1px solid #e2dede; border-radius:5px;">
								<div class="col" >
									<!-- 동아리 이름 -->
									<div class="row p-3" >
										<div class="col-3 pt-2">
											<span style="color:red;">*</span> 동아리 이름
										</div>
										<div class="col">
											<input type="text" class="form-control" name="club_name" id="club_name" placeholder="동아리 이름을 입력해주세요" >
										</div>
									</div>
									<hr style="height:1px; color:#adb5bd">
									
									<!-- 동아리 신청 회원수 -->
									<div class="row p-3" >
										<div class="col-3 pt-2">
											<span style="color:red;">*</span> 동아리 신청 회원수
										</div>
										<div class="col mb-3">
											<input type="text" class="form-control" style="width:100%" name="club_appl_people_count" placeholder="동아리 인원을 입력해주세요" >
										</div>
									</div>
									
									<!-- 동아리 분류  -->
									
									<!-- 동아리 설립 및 목적 -->
									<hr style="height:1px; color:#adb5bd">
									<div class="row p-3">
										<div class="col-3 pt-2">
											<span style="color:red;">*</span> 동아리 설립 및 목적
										</div>
										<div class="col">
											<div class="row">
												<div class="col text_align_left mt-2">
													<textarea class="form-control" style="height:15vh" name="club_purpose"></textarea>
												</div>
											</div>
										</div>
									</div>
									<hr style="height:1px; color:#adb5bd">
								</div>
							</div>
							
							<div class="row mt-5">
								<div class="col text_align_right">
									<button class="btn" style="background-color:gray; color:white; width:15em; height:3em;">뻐튼</button>
								</div>
								<div class="col">
									<button type="submit" class="btn" style="background-color:#c4073d; color:white; width:15em; height:3em;">제출하기</button>
								</div>
							</div>
							</form>
							<hr class="mt-3 hrSetting">
							<div class="row">
								<div class="col text_align_right">
								
								</div>
							</div>							
						</div>
						<div class="col-2"></div>
						</div>
				</div>
			</div>
		</div>
						
					</div>
				</div>
			</div>
</div>
		<!-- 실제 내용 -->

				
				<!-- 여기다 작성하세요 -->
				




					
</body>
</html>