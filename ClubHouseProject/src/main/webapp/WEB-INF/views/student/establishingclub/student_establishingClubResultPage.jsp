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
	.selectDiv {
	background-color: #bfc9e3;
	color: white !important;
	padding-left: 0px;
    padding-right: 0px;
    width: 60%;
}

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

		var popUrl = "./student_establishingClubRejectReasonPage";
		var name = "popup";
		var popOption = "top=10, left=10, width=600, height=600, status=no, menubar=no, toolbar=no, resizable=no, scrollbars=no";
		window.open(popUrl,name, popOption);
	}
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
				class="text-uppercase font-weight-bold">MENU</small>
		</button>
		
		<div class="row card box" style="width: 100%; height: 45px;">
				<div class="dashboard-card-bottom">
					<div class="row">

						<div class="col-1"></div>

						<div class="col">

							<div class="row ps-1 p-2 mb-2">
								<div class="col text-center"
									style="border-right: 2px solid #ededed;">
									<div class="row" style="justify-content: center">
										<a
											href="/cbh/student/establishingclub/student_indexPage"
											class="col-auto px-3" 
											style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none;">
											신청서 작성 </a>
									</div>
								</div>

								<div class="col text-center">
									<div class="row" style="justify-content: center">
									<a
										href="/cbh/student/establishingclub/student_establishingClubResultPage?stud_id=${sessionUserInfo.stud_id }"
										class="col-auto px-3"
										style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none; background-color: #bfc9e3; color: white !important; padding-left: 0px; padding-right: 0px; width: 60%;">
										동아리 신청 상태 </a>
								</div>
								</div>
							</div>

						</div>

						<div class="col-1"></div>

					</div>

				</div>
			</div>

		<div class="row my-3 card box" style="width: 100%; height: auto;">
				<div class="dashboard-card-bottom">
					<!-- 실제 내용 -->
					<div class="container-fluid">
			<div class="row">
				<div class="col">

					<!-- 여기다 작성하세요 -->
					<div class="row">
						<div class="col" id="content">
							<!-- 컨텐트 of 헤더 -->
							<div class="row mt-4" >
								<div class="col">
									<table class="table">
										<thead>
											<tr class="table-secondary">
												<th scope="col" style="text-align:center;">번호</th>
												<th scope="col" style="text-align:center;">동아리 이름</th>
												<th scope="col" style="text-align:center;">개설 목적</th>
												<th scope="col" style="text-align:center;">개설 신청 현황</th>
												<th scope="col" style="text-align:center;">신청 일시</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="data" items="${clubApplDataList }">
												<tr>
													<td class="text_align_center" style="text-align:center; padding-top:1em;">${data.club_appl_no }</td>
													<td style="padding-top:1em; text-align:center;">${data.club_name }</td>
													<td style="padding-top:1em; text-align:center;">${data.club_purpose }</td>
													<td style="text-align:center;"><c:if test="${data.club_appl_state eq '1' }">
															<c:out value="임시 승인"></c:out><span style="margin-left: 2em"><button
																	class="btn btn-danger"
																	onclick="location.href='./student_writeClubInfoPage'">동아리
																	정보 입력하기</button></span>
														</c:if> 
														<c:if test="${data.club_appl_state eq '2' }">
															<c:out value="반려"></c:out>
															
														</c:if> 
														<c:if test="${data.club_appl_state eq '3' }">
															<c:out value="심사중"></c:out>
														</c:if>
														<c:if test="${data.club_appl_state eq '4' }">
															<c:out value="승인"></c:out>
														</c:if>
														</td>
													<td class="text_align_center" style="padding-top:1em; text-align:center;"><fmt:formatDate
															value="${data.club_appl_date }" pattern="yyyy.MM.dd" /></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>

								</div>
							</div>
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