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

#bigMenuText {
	font-size: 2.5vh;
}

#sideBar>ul>li {
	font-size: 2vh;
	padding-left: 1.0vw;
}

#sideBar>ul>li>div {
	background: linear-gradient(to right, #d6d6d6, #ededed);
	margin-right: 1.0vw;
	padding-left: 1vw;
	border-radius: 5vh;
	color: #969696;
	font-weight: bold;
}

#sideBar>ul>li>div {
	margin-bottom: .2vh;
	margin-right: 1.0vw;
	padding-left: 1vw;
	border-radius: 5vh;
}

#sideBar li ul li {
	font-size: 1.8vh;
	list-style-type: disc;
	list-style: none;
	margin-bottom: .5vh;
	color: #828282;
}

#sideBar li ul li:hover {
	font-weight: bold;
	color: #bf1f51;
	letter-spacing: 0.05vw;
}

#sideBar ul {
	margin-bottom: 1.5vh;
	padding-left: 0;
}

#sideBar li ul {
	padding-left: 1vw;
	margin-bottom: 2.2vh;
}

.bi-chevron-right {
	
}

.form-control {
	display: inline-block !important;
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

		var popUrl = "./establishingClubRejectReasonPage";
		var popOption = "top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no, scrollbars=no";
		window.open(popUrl, popOption);
	}
</script>


<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/student_common/student_header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/student_common/student_sidevar.jsp"></jsp:include>


	<div
		style="position: absolute; left: 13.5%; width: 86.5%; top: 14vh; height: 86vh; overflow-y: auto">
		<div class="container-fluid">
			<div class="row">
				<div class="col">

					<!-- 여기다 작성하세요 -->
					<div class="row">
						<div class="col" id="content">
							<!-- 컨텐트 of 헤더 -->
							<div class="row page_title">
								<div class="col-4 page_title_text">
									<span><img
										src="/cbh/resources/img/student/myclub/clubactivities/contentTitleLogo.png"
										style="margin-left: 0.5em; width: 2.1em; height: 1.5em"></span>
									<span style="margin-left: 0.3em;">동아리 활동내역</span>
								</div>
								<div class="col"></div>
							</div>
							<!-- 검색 박스 -->
							<form action="./student_indexPage?club_no=${clubNo }" method="post">
							<div class="row my-3">
								<div class="col" style="text-align: right">
									<input type="text" name="searchWord" class="form-control" style="width:30%">
								</div>
								<div class="col-1">
									<button class="btn btn-primary">검색</button>
								</div>
							</div>
							</form>

							<!-- 컨텐트 박스 -->
							<div class="row">
								<div class="col">
									<!-- 데이터 테이블 자리 -->
									<div class="row">
										<div class="col">
											<table class="table align-middle">
												<thead>
													<tr class="table-secondary">
														<th class="col-1 text_align_center">번호</th>
														<th class="col-5 text_align_center">제목</th>
														<th class="col-2 text_align_center">작성자</th>
														<th class="col-2 text_align_center">날짜</th>
														<th class="col-2 text_align_center">조회수</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="clubActivity"
														items="${clubActivitiesList }">
														<tr>
															<th class="col-1 text_align_center">${clubActivity.club_act_no }</th>
															<th class="col-5 text_align_center"><a
																href="./student_clubActivitiesContentPage?club_act_no=${clubActivity.club_act_no }&club_no=${clubActivity.club_no}">${clubActivity.club_act_title }</a></th>
															<th class="col-2 text_align_center">동아리 회장</th>
															<th class="col-2 text_align_center"><fmt:formatDate
																	value="${clubActivity.club_act_date }"
																	pattern="yyyy-MM-dd"></fmt:formatDate></th>
															<th class="col-2 text_align_center">${clubActivity.club_readcount }</th>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>

									<!-- 작성하기 버튼 -->
									<div class="row mt-3">
										<div class="col" style="text-align: right;">
											<button class="btn btn-danger" onclick="location.href='./student_writeClubActPage?club_no=${clubNo}'">작성하기</button>
										</div>
									</div>

									<!-- 페이징 -->
									<!-- 나중에 컨트롤러에서 구현해야함. -->
									<div class="row mt-5">
										<div class="col">
											<nav aria-label="Page navigation example">
												<ul class="pagination justify-content-center">
													<c:choose>
												  		<c:when test="${startPage <= 1}">
															<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>							  		
												  		</c:when>
												  		<c:otherwise>
															<li class="page-item"><a class="page-link" href="./student_indexPage?pageNum=${startPage - 1}${additionalParam}&club_no=${clubNo}">&lt;</a></li>							  		
												  		</c:otherwise>
												  	</c:choose>
												    
												    <c:forEach begin="${startPage }" end="${endPage }" var="i">
												    	<c:choose>
												    		<c:when test="${i == currentPageNum }">
																<li class="page-item active"><a class="page-link" href="./student_indexPage?pageNum=${i}${additionalParam}&club_no=${clubNo}">${i}</a></li>							    						
												    		</c:when>
												    		<c:otherwise>
																<li class="page-item"><a class="page-link" href="./student_indexPage?pageNum=${i}${additionalParam}&club_no=${clubNo}">${i}</a></li>							    		
												    		</c:otherwise>							    	
												    	</c:choose>
												    </c:forEach>
												    <c:choose>
												    	<c:when test="${endPage >= totalPageCount}">
															<li class="page-item disabled"><a class="page-link">&gt;</a></li>							    	
												    	</c:when>
												    	<c:otherwise>
															<li class="page-item"><a class="page-link" href="./student_indexPage?pageNum=${endPage+1}${additionalParam}&club_no=${clubNo}">&gt;</a></li>							    	
												    	</c:otherwise>
												    </c:choose>
												</ul>
											</nav>
										</div>
									</div>

								</div>
							</div>
						</div>
						<div class="col-2"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>