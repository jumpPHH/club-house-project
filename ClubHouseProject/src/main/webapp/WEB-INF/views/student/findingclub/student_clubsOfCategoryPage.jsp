<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생메인 페이지</title>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous">
	
</script>

<style type="text/css">
.club_box {
	display: inline-block;
}

img {
	vertical-align: top;
}

.banner_img, .banner_bg {
	display: inline-block;
	position: relative;
}

.banner_img:hover:after, .banner_img:hover>.hover_text, .banner_bg:hover:after,
	.banner_bg:hover>.hover_text {
	display: block;
}

.banner_img:after, .banner_bg:after, .hover_text {
	display: none;
}

.banner_img:after, .banner_bg:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.3);
	z-index: 10;
}

.banner_img {
	overflow: hidden;
}

.banner_img img {
	height: 340px;
}

.banner_img:hover img {
	transform: scale(1.2);
	transition: 1s;
}

.hover_text {
	position: absolute;
	top: 140px;
	left: 25px;
	color: #fff;
	z-index: 20;
	font-weight: 600;
	font-size: 20px;
}
</style>

<script type="text/javascript">
	// 홈페이지 로드시 클럽리스트 불러오기
	function getCategoryOfClubList() {
		clubCategoryNo = document.querySelector("#clubCategoryNo").value;

		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function() {

			if (xhr.readyState == 4 && xhr.status == 200) {
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)

				var rowNum = Math.floor(jsonObj.data.length / 4 + 1);
				var Array = 0;
				var ArrayLength = jsonObj.data.length;
				var clubListBox = document.querySelector("#clubListBox");

				for (let e = 0; e < rowNum; e++) {

					for (let r = 0; r < 4; r++) {
						if (Array === ArrayLength)
							break;
						console.log(jsonObj.data[Array].club_name);

						var col1 = document.createElement("div");
						col1.classList.add("club_box", "mx-1", "my-2");
						col1.setAttribute("style", "position:relative");
						clubListBox.appendChild(col1);

						var col1_a1 = document.createElement("a");
						col1_a1.setAttribute("href",
								"./student_clubIntroducingPage?club_no="
										+ jsonObj.data[Array].club_no);
						col1_a1.setAttribute("class", "banner_img");
						col1.appendChild(col1_a1);

						var col1_img = document.createElement("img");
						col1_img.setAttribute("src",
								jsonObj.data[Array].club_title_image);
						col1_img.setAttribute("style",
								"width:15em; height:13em; cursor:pointer;");
						col1_a1.appendChild(col1_img);
						Array++;

						var col1_text = document.createElement("p");
						col1_text.setAttribute("class", "hover_text");
						col1_text.innerText = "이것이다.";
						col1_a1.appendChild(col1_text);
					}
				}
			}
		}
		xhr.open("get", "./getCategoryOfClubsAll?club_category_no="
				+ clubCategoryNo); //리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send(); //AJAX로 리퀘스트함..
	}

	function searchClub() {
		var clubListBox = document.querySelector("#clubListBox");
		clubListBox.innerHTML = "";
		var searchWord = $('.searchWord').val();
		console.log(searchWord);

		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function() {

			if (xhr.readyState == 4 && xhr.status == 200) {
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				var rowNum = Math.floor(jsonObj.data.length / 5 + 1);
				var Array = 0;
				var ArrayLength = jsonObj.data.length;
				var clubListBox = document.querySelector("#clubListBox");

				for (let e = 0; e < rowNum; e++) {
					var row1 = clubListBox.createElement('div');
					row1.setAttribute("class", "row");

					for (let r = 0; r < 5; r++) {
						if (Array === ArrayLength)
							break;
						console.log(jsonObj.data[Array].club_name);

						var col1 = document.createElement("div");
						col1.classList.add("club_box", "mx-1", "my-2");
						row1.appendChild(col1);

						var col1_img = document.createElement("img");
						col1_img.setAttribute("src",
								jsonObj.data[Array].club_title_image);
						col1_img.setAttribute("style",
								"width:15em; height:13em; cursor:pointer;");
						col1_img.setAttribute("onclick",
								"location.href='./student_clubIntroducingPage?club_no="
										+ jsonObj.data[Array].club_no + "'");
						col1.appendChild(col1_img);
						Array++;
					}
				}
			}
		}
		xhr.open("get", "./getCategoryOfClubsAll?club_category_no="
				+ clubCategoryNo + "&searchWord=" + searchWord); //리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send(); //AJAX로 리퀘스트함..		

	}

	window.addEventListener("DOMContentLoaded", function() {
		getCategoryOfClubList()
	});
</script>

</head>
<body>
	<jsp:include
		page="/WEB-INF/views/student_common/student_navigationvar.jsp"></jsp:include>

	<div class="page-content p-5" id="content">
		<!-- 토글 버튼 -->
		<button id="sidebarCollapse" type="button"
			class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4">
			<i class="fa fa-bars mr-2"></i><small
				class="text-uppercase font-weight-bold"
				style="box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075) !important;">Toggle</small>
		</button>

		<div class="card"
			style="width: 100%; height: auto; border-radius: 15px; box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075) !important; padding: 30px;">
			<div class="dashboard-card-bottom">
				<!-- 실제 내용 -->

				<div class="container-fluid">
					<div class="row">
						<div class="col">

							<!-- 여기다 작성하세요 -->
							<!-- 컨텐트 부분 -->
							<div class="row">
								<div class="col" id="content">
									<!-- 컨텐트 of 헤더 -->
									<div class="row page_title">
										<div class="col page_title_text">
											<i class="fa bi bi-search mr-3 text-primary fa-fw"
												style="font-size: 1.3em;"></i> <span
												style="font-size: 1.4em; font-weight: bold">동아리 찾기</span>
										</div>
										<div class="col-3 text_align_right">
											<button class="btn btn-primary"
												onclick="location.href='/cbh/student/findingclub/student_indexPage'"
												style="border-radius: 5px; border: none; width: 9em; height: 5vh">
												카테고리로 이동</button>
										</div>
									</div>
									<!-- 카테고리 제목 -->
									<div class="row">
										<div class="col text_align_center"
											style="margin-top: 7vh; text-align: center;">
											<h2 style="font-weight: bold;">공연예술분과</h2>
										</div>
									</div>
									<!-- 동아리 검색 -->
									<div class="row">
										<div class="col" style="margin-top: 6vh; text-align: right;">
											<input type="text" placeholder="동아리검색" class="searchWord">
											<button type="submit" onclick="searchClub()">검색</button>

										</div>
									</div>

									<!-- 진짜 컨텐트 -->
									<div class="row"
										style="border-top: 1px solid #adb5bd; margin-top: 2em">
										<div class="col" id="clubListBox"
											style="margin-top: 2em; margin-left: 2em;"></div>
									</div>
									<hr class="mt-3" style="height: 1px;">
									<div class="row">
										<div class="col text_align_right"></div>
									</div>
								</div>
								<input type="hidden" id="clubCategoryNo" name="clubCategoryNo"
									value="${clubCategoryNo }">
							</div>
						</div>
						<!-- 여기다 작성하세요 -->
					</div>
				</div>
			</div>

		</div>
	</div>





</body>
</html>