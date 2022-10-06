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
	<jsp:include page="/WEB-INF/views/student_common/student_sidevar.jsp"></jsp:include>

	<div class="page-content p-5" id="content">
  <!-- 토글 버튼 -->
		<button id="sidebarCollapse" type="button"
			class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4">
			<i class="fa fa-bars mr-2"></i><small
				class="text-uppercase font-weight-bold">Toggle</small>
		</button>
		
		<div style="position: absolute; left: 13.5%; width: 86.5%; top: 14vh; height:86vh;overflow-y: auto; word-break: break-all; ">
			<div class="container-fluid" style="background-color: aqua">
				<div class="row" >
					<div class="col">
					<!-- 여기다 작성하세요 -->
					<div class="row">
						<div class="col" id="content">
							<!-- 컨텐트 of 헤더 -->
							<div class="row page_title">
								<div class="col-4 page_title_text">
									<span><img
										src="/cbh/resources/img/student/clubboard/titleLogo.png"
										style="margin-left: 0.5em; width: 1.5em; height: 1.5em"></span>
									<span style="margin-left: 0.3em;">자유게시판</span>
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
													<c:forEach var="clubBoard" items="${clubBoardList }">
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
						
					</div>
		<!-- 실제 내용 -->
  	

	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>