<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">





<style type="text/css">
.selectDiv {
	background-color: #bfc9e3;
	color: white !important;
	text-decoration: underline;
	padding-left: 0px;
	padding-right: 0px;
	width: 60%;
}

.aClick {
	display: inline-block;
	color: #03c;
	-webkit-transition: 0.5s;
	-moz-transition: 0.5s;
	-o-transition: 0.5s;
	-ms-transition: 0.5s;
	transition: 0.5s;
}

.aClick:hover {
	-webkit-transform: scale(1.1, 1.1);
	-moz-transform: scale(1.1, 1.1);
	-o-transform: scale(1.1, 1.1);
	-ms-transform: scale(1.1, 1.1);
	transform: scale(1.1, 1.1);
}
</style>

<script type="text/javascript">
	document
			.addEventListener(
					"DOMContentLoaded",
					function() {

						var nowPage = "${pageContext.request.requestURI}"
								.split('/')["${pageContext.request.requestURI}"
								.split('/').length - 1];

						var url1 = document.getElementById("student_indexPage");
						var url2 = document
								.getElementById("student_MemberJoinMgmtPage");

						if ((url1.getAttribute("href").split('/'))[5] + ".jsp" == nowPage) {
							$("#student_indexPage").attr('class', 'selectDiv');

						} else if ((url2.getAttribute("href").split('/'))[5]
								+ ".jsp" == nowPage) {
							$("#student_MemberJoinMgmtPage").attr('class',
									'selectDiv');
						}
					});

	function seeTheReason() {
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

	window.addEventListener("DOMContentLoaded", function() {
		//사실상 처음 실행하는 코드 모음...

		//setInterval(refreshCommentList , 3000); //폴링 방식의 실시간... 화면 갱신...

	});
</script>


<title>Insert title here</title>
</head>
<body>


	<jsp:include
		page="/WEB-INF/views/student_common/student_navigationvar.jsp"></jsp:include>
	<!-- 페이지 내용 부분 시작 (이 부분만 카피해서 사용할것. 카피 후 삭제) -->
	<div class="page-content p-5" id="content">
		<!-- 토글 버튼 -->
		<button id="sidebarCollapse" type="button"
			class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4">
			<i class="fa fa-bars mr-2"></i><small
				class="text-uppercase font-weight-bold"
				style="box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075) !important;">MENU</small>
		</button>

		<div class="row card box"
			style="width: 100%; height: 45px; margin-left: 0.1em; margin-bottom: 0.7em;">
			<div class="dashboard-card-bottom">
				<div class="row">

					<div class="col-1"></div>

					<div class="col">

						<div class="row ps-1 p-2 mb-2">
							<div class="col text-center">
								<div class="row"
									style="justify-content: center; border-right: 2px solid #ededed">
									<a id="student_indexPage"
										href="/cbh/student/findingclub/student_indexPage"
										class="col-auto px-3 aClick"
										style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none;">
										자유게시판 </a>
								</div>
							</div>

							<div class="col text-center">
								<div class="row" style="justify-content: center">
									<a id="student_MemberJoinMgmtPage" href="#"
										class="col-auto px-3 aClick"
										style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none;">
										자유게시판 작성 </a>
								</div>
							</div>
						</div>

					</div>
					<div class="col-1"></div>
				</div>
			</div>
		</div>


		<div class="card"
			style="width: 100%; height: auto; border-radius: 2%; box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075) !important; padding: 0px 15px;">
			<div class="dashboard-card-bottom">
				<!-- 실제 내용 -->

				<!-- 카테고리 박스 -->
				<div class="container-fluid">
					<div class="row">
						<div class="col">

							<!-- 여기다 작성하세요 -->
							<div class="row">
								<div class="col" id="content">
									<!-- 컨텐트 박스 -->
									<!-- 컨텐트 박스 -->
							<form action="./student_modifyClubBoardProcess">
							<div class="row">
								<div class="col">
									<div class="row">
										<div class="col mt-4 mb-2" style="text-align:left;">
											<h2 style="font-weight:bold">자유게시판 수정</h2>
										</div>
									</div>
									<!-- 글 제목 입력 칸 -->
									<div class="mt-5">제목</div>
									<div class="row mt-1">
										<div class="col">
											<input type="text" value="${clubBoardData.club_board_title }" class="form-control" name="club_board_title">
										</div>
									</div>
									<!-- 글 내용 입력 칸 -->
									<div class="mt-5">내용</div>
									<div class="row mt-1">
										<div class="col" style="text-align:center">
											<textarea class="form-control" name="club_board_content" placeholder="${clubBoardData.club_board_content }" style="width:100%; height:10em;"></textarea>
										</div>
										<input type="hidden" name="club_no" value="${clubNo }">
										<input type="hidden" name="club_board_no" value="${clubBoardNo }">
									</div>
									<div class="row mt-5">
										<div class="col">
											<input type="file">
										</div>
									</div>
									
									<div class="row mt-5 mb-5">
										<div class="col" style="text-align:right">
											<button class="btn btn-secondary mr-3">취소</button>
											<button class="btn btn-danger">제출</button>
										</div>
									</div>
								</div>
							</div>
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