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

.text_align_center {
	text-align: center;
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

		<c:if test="${empty MainData.IsBoss}">
			<c:if test="${empty MainData.IsNormalMember}">
				<link rel="stylesheet" href="/cbh/resources/css/status02.css">

				<!-- Google font -->
				<link href="https://fonts.googleapis.com/css?family=Nunito:400,700"
					rel="stylesheet">

				<div class="row">
					<div class="col-1"></div>
					<div class="col">
						<div id="notfound">
							<div class="notfound">
								<div class="notfound-404"></div>
								<h1 style="font-size: 45px;">동아리 미가입/개설</h1>
								<h2 style="font-size: 20px;">동아리 미가입/개설 되어있지 않습니다.</h2>
								<p>죄송합니다. 현재 서비스를 이용하시려면 동아리 가입을 하거나 개설을 해주세요.</p>
							</div>
						</div>
					</div>
					<div class="col-1"></div>
				</div>

			</c:if>
		</c:if>


		<c:if test="${not empty MainData.IsBoss}">
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
										<a id="student_indexPage"
											href="/cbh/student/myclub/clubboard/student_indexPage"
											class="col-auto px-3 aClick"
											style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none; background-color: #bfc9e3; color: white !important; padding-left: 0px; padding-right: 0px; width: 60%;">
											자유게시판 </a>
									</div>
								</div>

								<div class="col text-center">
									<div class="row" style="justify-content: center">
										<a id="student_MemberJoinMgmtPage"
											href="/cbh/student/myclub/clubboard/student_writeClubBoardPage"
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
												<form action="./student_indexPage"
													method="post">
													<div class="row">
														<div class="col" style="text-align: right">
															<div style="margin-right: 1em; display: inline-block">
																<input type="text" placeholder="제목을 입력해주세요."
																	name="searchWord" style="width: 100%">
															</div>
															<div style="display: inline-block">
																<button type="submit">검색</button>
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
																<c:forEach var="clubBoard" items="${clubBoardList }">
																	<tr>
																		<th class="col-1 text_align_center">${clubBoard.boardData.club_board_no }</th>
																		<th class="col-5 text_align_center"><a
																			style="color: black"
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
														<button class="btn btn-danger"
															onclick="location.href='./student_writeClubBoardPage'">작성하기</button>
													</div>
												</div>

												<!-- 페이징 -->
												<!-- 나중에 컨트롤러에서 구현해야함. -->
												<div class="row my-5">
													<nav aria-label="Page navigation example">
														<ul
															class="pagination justify-content-center pagination-lg">
															<c:choose>
																<c:when test="${startPage <= 1}">
																	<li class="page-item disabled"><a
																		class="page-link"
																		style="text-decoration-line: none; color: red;">◀</a></li>
																</c:when>
																<c:otherwise>
																	<li class="page-item disabled"><a
																		class="page-link"
																		style="text-decoration-line: none; color: black;"
																		href="/cbh/student/myclub/membershipfeemgmt/student_MemberShipFeeMgmtListPage?pageNum=${startPage -1}">◀</a></li>
																</c:otherwise>
															</c:choose>

															<c:forEach begin="${startPage}" end="${endPage}" var="i">
																<c:choose>
																	<c:when test="${i == currentPageNum}">
																		<li class="page-item"><a class="page-link"
																			style="text-decoration-line: none; color: blue; font-weight: 600;"
																			href="/cbh/student/myclub/membershipfeemgmt/student_MemberShipFeeMgmtListPage?pageNum=${i}">${i}</a></li>
																	</c:when>
																	<c:otherwise>
																		<li class="page-item"><a class="page-link"
																			style="text-decoration-line: none; color: black;"
																			href="/cbh/student/myclub/membershipfeemgmt/student_MemberShipFeeMgmtListPage?pageNum=${i}">${i}</a></li>
																	</c:otherwise>
																</c:choose>
															</c:forEach>

															<c:choose>
																<c:when test="${endPage >= totalPageCount }">
																	<li class="page-item"><a class="page-link"
																		style="text-decoration-line: none; color: red;">▶</a></li>
																</c:when>
																<c:otherwise>
																	<li class="page-item"><a class="page-link"
																		style="text-decoration-line: none; color: black;"
																		href="/cbh/student/myclub/membershipfeemgmt/student_MemberShipFeeMgmtListPage?pageNum=${endPage +1}">▶</a></li>
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
		</c:if>
		
		<c:if test="${not empty MainData.IsNormalMember}">
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
										<a id="student_indexPage"
											href="/cbh/student/myclub/clubboard/student_indexPage"
											class="col-auto px-3 aClick"
											style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none; background-color: #bfc9e3; color: white !important; padding-left: 0px; padding-right: 0px; width: 60%;">
											자유게시판 </a>
									</div>
								</div>

								<div class="col text-center">
									<div class="row" style="justify-content: center">
										<a id="student_MemberJoinMgmtPage"
											href="/cbh/student/myclub/clubboard/student_writeClubBoardPage"
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
												<form action="./student_indexPage"
													method="post">
													<div class="row">
														<div class="col" style="text-align: right">
															<div style="margin-right: 1em; display: inline-block">
																<input type="text" placeholder="제목을 입력해주세요."
																	name="searchWord" style="width: 100%">
															</div>
															<div style="display: inline-block">
																<button type="submit">검색</button>
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
																<c:forEach var="clubBoard" items="${clubBoardList }">
																	<tr>
																		<th class="col-1 text_align_center">${clubBoard.boardData.club_board_no }</th>
																		<th class="col-5 text_align_center"><a
																			style="color: black"
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
														<button class="btn btn-danger"
															onclick="location.href='./student_writeClubBoardPage'">작성하기</button>
													</div>
												</div>

												<!-- 페이징 -->
												<!-- 나중에 컨트롤러에서 구현해야함. -->
												<div class="row my-5">
													<nav aria-label="Page navigation example">
														<ul
															class="pagination justify-content-center pagination-lg">
															<c:choose>
																<c:when test="${startPage <= 1}">
																	<li class="page-item disabled"><a
																		class="page-link"
																		style="text-decoration-line: none; color: red;">◀</a></li>
																</c:when>
																<c:otherwise>
																	<li class="page-item disabled"><a
																		class="page-link"
																		style="text-decoration-line: none; color: black;"
																		href="/cbh/student/myclub/membershipfeemgmt/student_MemberShipFeeMgmtListPage?pageNum=${startPage -1}">◀</a></li>
																</c:otherwise>
															</c:choose>

															<c:forEach begin="${startPage}" end="${endPage}" var="i">
																<c:choose>
																	<c:when test="${i == currentPageNum}">
																		<li class="page-item"><a class="page-link"
																			style="text-decoration-line: none; color: blue; font-weight: 600;"
																			href="/cbh/student/myclub/membershipfeemgmt/student_MemberShipFeeMgmtListPage?pageNum=${i}">${i}</a></li>
																	</c:when>
																	<c:otherwise>
																		<li class="page-item"><a class="page-link"
																			style="text-decoration-line: none; color: black;"
																			href="/cbh/student/myclub/membershipfeemgmt/student_MemberShipFeeMgmtListPage?pageNum=${i}">${i}</a></li>
																	</c:otherwise>
																</c:choose>
															</c:forEach>

															<c:choose>
																<c:when test="${endPage >= totalPageCount }">
																	<li class="page-item"><a class="page-link"
																		style="text-decoration-line: none; color: red;">▶</a></li>
																</c:when>
																<c:otherwise>
																	<li class="page-item"><a class="page-link"
																		style="text-decoration-line: none; color: black;"
																		href="/cbh/student/myclub/membershipfeemgmt/student_MemberShipFeeMgmtListPage?pageNum=${endPage +1}">▶</a></li>
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
		</c:if>	
		
	</div>
</body>
</html>