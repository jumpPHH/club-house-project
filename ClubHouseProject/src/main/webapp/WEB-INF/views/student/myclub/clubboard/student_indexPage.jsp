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
	text-decoration: underline;
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
document.addEventListener("DOMContentLoaded", function () {
	
	var nowPage = "${pageContext.request.requestURI}".split('/')["${pageContext.request.requestURI}".split('/').length-1];

	var url1 = document.getElementById("student_indexPage");
	var url2 = document.getElementById("student_MemberJoinMgmtPage");
	
		if((url1.getAttribute("href").split('/'))[5]+".jsp" == nowPage){
			$("#student_indexPage").attr('class','selectDiv');
		
		}else if ((url2.getAttribute("href").split('/'))[5]+".jsp" == nowPage) {
			$("#student_MemberJoinMgmtPage").attr('class','selectDiv');
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
				style="box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075) !important;">Menu</small>
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
									<a  id="student_indexPage"
										href="/cbh/student/myclub/clubboard/student_indexPage?club_no=${clubNo }"
										class="col-auto px-3 aClick"
										style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none;">
										자유게시판 </a>
								</div>
							</div>

							<div class="col text-center">
								<div class="row" style="justify-content: center">
									<a id="student_MemberJoinMgmtPage"
										href="/cbh/student/myclub/clubboard/writeClubBoardPage?club_no=${clubNo }"
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
			style="width: 100%; height: auto; border-radius: 15px; box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075) !important; padding: 30px;">
			<div class="dashboard-card-bottom">
				<!-- 실제 내용 -->

				<div class="container-fluid">
					<div class="row">
						<div class="col">

							<!-- 여기다 작성하세요 -->
							<div class="row">
								<div class="col" id="content">
									<div class="row my-3">
										<div class="col">
											<form action="./student_indexPage?club_no=${clubNo }"
												method="post">
												<div class="row">
													<div class="col" style="text-align: right">
														<div style="margin-right: 1em; display: inline-block">
															<input type="text" name="searchWord"  style="width: 100%">
														</div>
														<div style="display: inline-block">
															<button class="btn btn-primary">검색</button>
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>

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
															<c:forEach var="clubBoard"
																items="${clubBoardList }">
																<tr>
																	<th class="col-1 text_align_center">${clubBoard.boardData.club_board_no }</th>
															<th class="col-5 text_align_center"><a
																href="./student_clubBoardContentPage?club_board_no=${clubBoard.boardData.club_board_no }&club_no=${clubBoard.boardData.club_no}">${clubBoard.boardData.club_board_title }</a></th>
															<th class="col-2 text_align_center">${clubBoard.writerName}</th>
															<th class="col-2 text_align_center"><fmt:formatDate
																	value="${clubBoard.boardData.club_board_writedate }"
																	pattern="yyyy-MM-dd"></fmt:formatDate></th>
															<th class="col-2 text_align_center">${clubBoard.boardData.club_board_readcount }</th>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>

											<!-- 작성하기 버튼 -->
											<div class="row mt-3">
												<div class="col" style="text-align: right;">
													<button class="btn btn-danger" onclick="location.href='./student_writeClubBoardPage?club_no=${clubNo}'">작성하기</button>
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
																	<li class="page-item disabled"><a
																		class="page-link" href="#">&lt;</a></li>
																</c:when>
																<c:otherwise>
																	<li class="page-item"><a class="page-link"
																		href="./student_indexPage?pageNum=${startPage - 1}${additionalParam}&club_no=${clubNo}">&lt;</a></li>
																</c:otherwise>
															</c:choose>

															<c:forEach begin="${startPage }" end="${endPage }"
																var="i">
																<c:choose>
																	<c:when test="${i == currentPageNum }">
																		<li class="page-item active"><a class="page-link"
																			href="./student_indexPage?pageNum=${i}${additionalParam}&club_no=${clubNo}">${i}</a></li>
																	</c:when>
																	<c:otherwise>
																		<li class="page-item"><a class="page-link"
																			href="./student_indexPage?pageNum=${i}${additionalParam}&club_no=${clubNo}">${i}</a></li>
																	</c:otherwise>
																</c:choose>
															</c:forEach>
															<c:choose>
																<c:when test="${endPage >= totalPageCount}">
																	<li class="page-item disabled"><a
																		class="page-link">&gt;</a></li>
																</c:when>
																<c:otherwise>
																	<li class="page-item"><a class="page-link"
																		href="./student_indexPage?pageNum=${endPage+1}${additionalParam}&club_no=${clubNo}">&gt;</a></li>
																</c:otherwise>
															</c:choose>
														</ul>
													</nav>
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
		</div>
	</div>
</body>
</html>