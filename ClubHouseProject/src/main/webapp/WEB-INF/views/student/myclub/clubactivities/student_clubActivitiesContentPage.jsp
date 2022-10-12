<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
.aClick{
    display: inline-block;
    color: #03c;
    -webkit-transition: 0.5s;
    -moz-transition: 0.5s;
    -o-transition: 0.5s;
    -ms-transition: 0.5s;
    transition: 0.5s;
}

.aClick:hover {
    -webkit-transform: scale(1.1,1.1);
    -moz-transform: scale(1.1,1.1);
    -o-transform: scale(1.1,1.1);
    -ms-transform: scale(1.1,1.1);
    transform: scale(1.1,1.1);
}
</style>



<script type="text/javascript">
	var club_no = ${map.clubActData.club_no};
	var club_act_no = ${	map.clubActData.club_act_no};
	console.log(club_no);

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
		var name = "name"
		window.open(popUrl, name, popOption);
	}

	function activateUpdateAndDeleteButtonIfHeIsClubBoss() {

		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function() {

			if (xhr.readyState == 4 && xhr.status == 200) {
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				var sessionUserId = "${sessionUserInfo.stud_id}";

					var buttonBoxCol1 = document.querySelector('#buttonBox');

					var updateButton = document.createElement("button");
					updateButton.setAttribute("class", "btn btn-danger");
					buttonBoxCol1.appendChild(updateButton);

					var updateButtonAhref = document.createElement("a");
					updateButtonAhref.setAttribute("href",
							"./student_modifyClubActPage?club_no=" + club_no
									+ "&club_act_no=" + club_act_no);
					updateButtonAhref.setAttribute("style", "color:white");
					updateButtonAhref.innerText = "수정";
					updateButton.appendChild(updateButtonAhref);

					var deleteButton = document.createElement("button");
					deleteButton.setAttribute("class", "btn btn-primary");
					deleteButton.setAttribute("style", "margin-left:0.5em");
					buttonBoxCol1.appendChild(deleteButton);

					var deleteButtonAhref = document.createElement("a");
					deleteButtonAhref.setAttribute("href",
							"./student_deleteClubActProcess?club_no=" + club_no
									+ "&club_act_no=" + club_act_no);
					deleteButtonAhref.setAttribute("style", "color:white");
					deleteButtonAhref.innerText = "삭제";
					deleteButton.appendChild(deleteButtonAhref);
			}
		}

		xhr.open("get", "./restapi/getClubData?club_no=" + club_no); //리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send(); //AJAX로 리퀘스트함..

	}

	window.addEventListener("DOMContentLoaded", function() {
		//사실상 처음 실행하는 코드 모음...
		activateUpdateAndDeleteButtonIfHeIsClubBoss();

		//setInterval(refreshCommentList , 3000); //폴링 방식의 실시간... 화면 갱신...

	});
</script>


<title>Insert title here</title>
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
				style="box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075) !important;">MENU</small>
		</button>

		<div class="row card box"
			style="width: 100%; height: 45px; margin-left: 0.1em; margin-bottom: 1em;">
			<div class="dashboard-card-bottom">
				<div class="row">

					<div class="col-1"></div>

					<div class="col">

						<div class="row ps-1 p-2 mb-2">
							<div class="col text-center">
								<div class="row"
									style="justify-content: center; border-right: 2px solid #ededed">
									<a
										href="/cbh/student/myclub/clubactivities/student_indexPage?club_no=${map.clubActData.club_no }"
										class="col-auto px-3"
										style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none; background-color: #bfc9e3; color: white !important; padding-left: 0px; padding-right: 0px; width: 60%;">
										동아리 활동내역 </a>
								</div>
							</div>

							<div class="col text-center">
								<div class="row" style="justify-content: center">
									<a id="student_MemberShipFeeMgmtListPage"
										href="/cbh/student/myclub/clubactivities/student_writeClubActPage?club_no=${map.clubActData.club_no }"
										class="col-auto px-3"
										style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none;">
										활동내역 작성 </a>
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
					<div class="row">
						<div class="col">

							<!-- 여기다 작성하세요 -->
							<div class="row">
								<div class="col" id="content">
									<!-- 컨텐트 박스 -->
									<div class="row">
										<div class="col">
											<!-- 글 제목 공간 -->
											<div class="row"
												style="border-top: 1px solid #ddd; border-bottom: 1px solid #ddd; background-color: #f6f6f6">
												<div class="col" style="text-align: center;">
													<h2 style="margin-top: 1em;">${map.clubActData.club_act_title }</h2>
													<br>
												</div>
											</div>

											<!-- 글의 내용 공간 -->
											<div class="row">
												<div class="col">

													<!-- 조회수 및 날짜 공간 -->
													<div class="row">
														<div class="col"
															style="text-align: right; margin-top: 1em; padding: 1em 2em 0.2em 2em;">
															조회수 : ${map.clubActData.club_readcount } | 날짜 :
															<fmt:formatDate value="${map.clubActData.club_act_date }"
																pattern="yyyy-MM-dd" />
														</div>
													</div>

													<!-- 작성자 -->
													<div class="row">
														<div class="col"
															style="text-align: right; padding: 0 2em;">작성자 : 회장
														</div>
													</div>

													<!-- 진짜 글 내용 -->
													<div class="row">
														<div class="col mt-5" style="padding: 2em; margin: 2em 0;">
															${map.clubActData.club_act_content }</div>
													</div>

													<!-- 목록 버튼 칸  -->
													<div class="row">
														<div class="col" id="buttonBox"
															style="padding: 2em; border-top: 1px solid #ddd">
															<button class="btn btn-secondary" onclick="location.href='/cbh/student/myclub/clubactivities/student_indexPage'">목록</button>

														</div>
													</div>

													<!-- 다음 글 이전글 박스 -->
													<table class="table" style="margin-top: 8vh">
														<colgroup>
															<col width="25%">
															<col width>
														</colgroup>
														<thead>
														</thead>
														<tbody>
															<tr style="border-top: 1px solid #dee2e6">
																<th
																	style="border-right: 1px solid #dee2e6; text-align: center; padding: 2vh 0.5vh">다음
																	글</th>
																<td style="padding-left: 1em; padding: 2vh"><a
																	style="color:black; text-align:center;" href="./student_clubActivitiesContentPage?club_act_no=${map.NextPostActNo }&club_no=${map.clubActData.club_no}">${map.NextPostTitle }</a></td>
															</tr>
															<tr style="border-top: 1px solid #dee2e6">
																<th
																	style="border-right: 1px solid #dee2e6; text-align: center; padding: 2vh 0.5vh">이전
																	글</th>
																<td style="padding-left: 1em; padding: 2vh"><a
																	style="color:black; text-align:center;" href="./student_clubActivitiesContentPage?club_act_no=${map.PreviousPostActNo }&club_no=${map.clubActData.club_no}">${map.PreviousPostTitle }</a></td>
															</tr>
														</tbody>
													</table>

												</div>
											</div>

										</div>
									</div>
								</div>
								<input type="hidden" id="club_no"
									value="${map.clubActData.club_no }"> <input
									type="hidden" id="club_act_no"
									value="${map.clubActData.club_act_no }">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>