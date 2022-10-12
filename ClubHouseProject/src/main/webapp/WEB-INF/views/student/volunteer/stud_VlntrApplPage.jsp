<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 페이지</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<style type="text/css">
.selectDiv {
	background-color: #bfc9e3;
	color: white !important;
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
</head>
<body>
	<jsp:include
		page="/WEB-INF/views/student_common/student_navigationvar.jsp"></jsp:include>

	<!-- 페이지 내용 부분 시작 (이 부분만 카피해서 사용할것. 카피 후 삭제) -->
	<div class="page-content p-5" id="content">
		<!-- 토글 버튼 -->
		<button id="sidebarCollapse" type="button"
			class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4">
			<small class="text-uppercase font-weight-bold">MENU</small>
		</button>

		<c:if test="${empty MainData.IsBoss}">
			<c:if test="${empty MainData.IsNormalMember}">
					<link rel="stylesheet" href="/cbh/resources/css/status02.css">

				<!-- Google font -->
				<link href="https://fonts.googleapis.com/css?family=Nunito:400,700" rel="stylesheet">
				
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
			<div class="row card box" style="width: 100%; height: 45px;">
					<div class="dashboard-card-bottom">
						<div class="row">

							<div class="col-1"></div>

							<div class="col">

								<div class="row ps-1 p-2 mb-2">
									<div class="col text-center">
										<div class="row" style="justify-content: center">
											<a id="student_MemberMgmtPage"
												href="/cbh/student/volunteer/stud_VlntrApplPage"
												class="col-auto px-3 aClick"
												style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none; background-color: #bfc9e3; color: white !important; padding-left: 0px; padding-right: 0px; width: 30%;">
												봉사 공고 </a>
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
						<div class="container-fluid">

							<div class="row">

								<div class="col-1"></div>

								<div class="col">

									<div class="row my-5">
										<table class="table text-center">
											<thead style="background-color: rgb(252, 243, 243);">
												<tr>
													<th class="cl" scope="col">번호</th>
													<th class="cl" scope="col">제목</th>
													<th class="cl" scope="col">내용</th>
													<th class="cl" scope="col">지원인원수/모집인원수</th>
													<th class="cl" scope="col">봉사시간수</th>
													<th class="cl" scope="col">모집상태</th>
													<th></th>
												</tr>
											</thead>
											<tbody class="table-group-divider">
												<c:forEach items="${vlntrNotiList }" var="data">
													<tr>
														<th scope="row">${data.vlntrNotiVO.vlntr_noti_no}</th>
														<th>${data.vlntrNotiVO.vlntr_title}</th>
														<td>${data.vlntrNotiVO.vlntr_content }</td>
														<td>${data.vlntrNotiVO.vlntr_appl_count}/${data.vlntrNotiVO.vlntr_fixed_people}</td>
														<td>${data.vlntrNotiVO.vlntr_srvc_time }</td>
														<c:choose>
															<c:when
																test="${data.vlntrNotiVO.vlntr_noti_state eq 'N'}">
																<td scope="row" style="color: blue;">모집중</td>
															</c:when>
															<c:when
																test="${data.vlntrNotiVO.vlntr_noti_state eq 'Y'}">
																<td scope="row" style="color: green;">마감</td>
															</c:when>
														</c:choose>
														<td><button
																onclick="location.href='/cbh/student/volunteer/stud_DetailVlntrApplPage?vlntr_noti_no=${data.vlntrNotiVO.vlntr_noti_no}'"
																type="button" class="btn" style="color: black;">
																<i class="bi bi-search"></i>보기
															</button></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>

									</div>


								</div>

								<div class="col-1"></div>

							</div>
						</div>

						<div class="row">
							<div class="col-1"></div>
							<div class="col">
								<form action="./stud_VlntrApplPage" method="get">
									<div class="row my-5">
										<div class="col">
											<h6
												style="font-size: 15px; color: #333; font-weight: bold; margin-top: 20px;">검색어</h6>
										</div>

										<div class="col">
											<div class="form-floating">

												<select name="searchType" class="form-select"
													id="floatingSelect"
													aria-label="Floating label select example"
													style="font-size: 15px; color: #333; font-weight: bold; padding: 10px;">
													<option value="title">제목</option>
													<option value="content">내용</option>
												</select>
											</div>
										</div>

										<div class="col-6">
											<div class="form-floating">
												<textarea name="searchWord" class="form-control"
													placeholder="Leave a comment here" id="floatingTextarea"></textarea>
												<label for="floatingTextarea" style="font-size: 15px;">검색어를
													입력해주세요.</label>
											</div>
										</div>

										<div class="col">
											<button type="submit" class="btn btn-primary btn-lg"
												style="height: 60px; font-size: 15px;">
												<i class="bi bi-search">검색</i>
											</button>
										</div>
									</div>
								</form>

								<div class="row text-center">
									<div class="col">
										<!-- 페이징 -->
										<nav aria-label="Page navigation example">
											<ul class="pagination" style="place-content: center;">
												<c:choose>
													<c:when test="${startPage <= 1 }">
														<li class="page-item disabled"><a class="page-link"
															style="text-decoration-line: none; color: red;">◀</a></li>
													</c:when>
													<c:otherwise>

														<li class="page-item"><a class="page-link"
															style="text-decoration-line: none; color: black;"
															href="./staff_VlntrNotiPage?pageNum=${startPage - 1 }${additionalParam}">◀</a></li>
													</c:otherwise>
												</c:choose>

												<c:forEach begin="${startPage }" end="${endPage }" var="i">
													<c:choose>
														<c:when test="${i == currentPageNum }">
															<li class="page-item active"><a
																style="text-decoration-line: none; color: blue; font-weight: 600;"
																class="page-link"
																href="./staff_VlntrNotiPage?pageNum=${i}${additionalParam}">${i}</a></li>
														</c:when>
														<c:otherwise>
															<li class="page-item"><a class="page-link"
																style="text-decoration-line: none; color: black;"
																href="./staff_VlntrNotiPage?pageNum=${i}${additionalParam}">${i}</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												<c:choose>
													<c:when test="${endPage >= totalPageCount }">
														<li class="page-item disabled"><a class="page-link"
															style="text-decoration-line: none; color: red;">▶</a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item"><a class="page-link"
															style="text-decoration-line: none; color: black;"
															href="./staff_VlntrNotiPage?pageNum=${endPage+1}${additionalParam}">▶</a></li>
													</c:otherwise>
												</c:choose>
											</ul>
										</nav>
									</div>
								</div>
							</div>
							<div class="col-1"></div>
						</div>
					</div>
				</div>
			</c:if>
		
		<c:if test="${not empty MainData.IsNormalMember}">
				<div class="row card box" style="width: 100%; height: 45px;">
					<div class="dashboard-card-bottom">
						<div class="row">

							<div class="col-1"></div>

							<div class="col">

								<div class="row ps-1 p-2 mb-2">
									<div class="col text-center">
										<div class="row" style="justify-content: center">
											<a id="student_MemberMgmtPage"
												href="/cbh/student/volunteer/stud_VlntrApplPage"
												class="col-auto px-3 aClick"
												style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none; background-color: #bfc9e3; color: white !important; padding-left: 0px; padding-right: 0px; width: 30%;">
												봉사 공고 </a>
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
						<div class="container-fluid">

							<div class="row">

								<div class="col-1"></div>

								<div class="col">

									<div class="row my-5">
										<table class="table text-center">
											<thead style="background-color: rgb(252, 243, 243);">
												<tr>
													<th class="cl" scope="col">번호</th>
													<th class="cl" scope="col">제목</th>
													<th class="cl" scope="col">내용</th>
													<th class="cl" scope="col">지원인원수/모집인원수</th>
													<th class="cl" scope="col">봉사시간수</th>
													<th class="cl" scope="col">모집상태</th>
													<th></th>
												</tr>
											</thead>
											<tbody class="table-group-divider">
												<c:forEach items="${vlntrNotiList }" var="data">
													<tr>
														<th scope="row">${data.vlntrNotiVO.vlntr_noti_no}</th>
														<th>${data.vlntrNotiVO.vlntr_title}</th>
														<td>${data.vlntrNotiVO.vlntr_content }</td>
														<td>${data.vlntrNotiVO.vlntr_appl_count}/${data.vlntrNotiVO.vlntr_fixed_people}</td>
														<td>${data.vlntrNotiVO.vlntr_srvc_time }</td>
														<c:choose>
															<c:when
																test="${data.vlntrNotiVO.vlntr_noti_state eq 'N'}">
																<td scope="row" style="color: blue;">모집중</td>
															</c:when>
															<c:when
																test="${data.vlntrNotiVO.vlntr_noti_state eq 'Y'}">
																<td scope="row" style="color: green;">마감</td>
															</c:when>
														</c:choose>
														<td><button
																onclick="location.href='/cbh/student/volunteer/stud_DetailVlntrApplPage?vlntr_noti_no=${data.vlntrNotiVO.vlntr_noti_no}'"
																type="button" class="btn" style="color: black;">
																<i class="bi bi-search"></i>보기
															</button></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>

									</div>


								</div>

								<div class="col-1"></div>

							</div>
						</div>

						<div class="row">
							<div class="col-1"></div>
							<div class="col">
								<form action="./stud_VlntrApplPage" method="get">
									<div class="row my-5">
										<div class="col">
											<h6
												style="font-size: 15px; color: #333; font-weight: bold; margin-top: 20px;">검색어</h6>
										</div>

										<div class="col">
											<div class="form-floating">

												<select name="searchType" class="form-select"
													id="floatingSelect"
													aria-label="Floating label select example"
													style="font-size: 15px; color: #333; font-weight: bold; padding: 10px;">
													<option value="title">제목</option>
													<option value="content">내용</option>
												</select>
											</div>
										</div>

										<div class="col-6">
											<div class="form-floating">
												<textarea name="searchWord" class="form-control"
													placeholder="Leave a comment here" id="floatingTextarea"></textarea>
												<label for="floatingTextarea" style="font-size: 15px;">검색어를
													입력해주세요.</label>
											</div>
										</div>

										<div class="col">
											<button type="submit" class="btn btn-primary btn-lg"
												style="height: 60px; font-size: 15px;">
												<i class="bi bi-search">검색</i>
											</button>
										</div>
									</div>
								</form>

								<div class="row text-center">
									<div class="col">
										<!-- 페이징 -->
										<nav aria-label="Page navigation example">
											<ul class="pagination" style="place-content: center;">
												<c:choose>
													<c:when test="${startPage <= 1 }">
														<li class="page-item disabled"><a class="page-link"
															style="text-decoration-line: none; color: red;">◀</a></li>
													</c:when>
													<c:otherwise>

														<li class="page-item"><a class="page-link"
															style="text-decoration-line: none; color: black;"
															href="./staff_VlntrNotiPage?pageNum=${startPage - 1 }${additionalParam}">◀</a></li>
													</c:otherwise>
												</c:choose>

												<c:forEach begin="${startPage }" end="${endPage }" var="i">
													<c:choose>
														<c:when test="${i == currentPageNum }">
															<li class="page-item active"><a
																style="text-decoration-line: none; color: blue; font-weight: 600;"
																class="page-link"
																href="./staff_VlntrNotiPage?pageNum=${i}${additionalParam}">${i}</a></li>
														</c:when>
														<c:otherwise>
															<li class="page-item"><a class="page-link"
																style="text-decoration-line: none; color: black;"
																href="./staff_VlntrNotiPage?pageNum=${i}${additionalParam}">${i}</a></li>
														</c:otherwise>
													</c:choose>
												</c:forEach>
												<c:choose>
													<c:when test="${endPage >= totalPageCount }">
														<li class="page-item disabled"><a class="page-link"
															style="text-decoration-line: none; color: red;">▶</a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item"><a class="page-link"
															style="text-decoration-line: none; color: black;"
															href="./staff_VlntrNotiPage?pageNum=${endPage+1}${additionalParam}">▶</a></li>
													</c:otherwise>
												</c:choose>
											</ul>
										</nav>
									</div>
								</div>
							</div>
							<div class="col-1"></div>
						</div>
					</div>
				</div>
		
		</c:if>
	</div>


</body>
</html>
