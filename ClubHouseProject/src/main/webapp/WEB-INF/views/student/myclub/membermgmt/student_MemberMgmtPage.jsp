<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 페이지</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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

document.addEventListener("DOMContentLoaded", function () {
	
	var nowPage = "${pageContext.request.requestURI}".split('/')["${pageContext.request.requestURI}".split('/').length-1];

	var url1 = document.getElementById("student_MemberMgmtPage");
	var url2 = document.getElementById("student_MemberJoinMgmtPage");
	
		if((url1.getAttribute("href").split('/'))[5]+".jsp" == nowPage){
			$("#student_MemberMgmtPage").attr('class','selectDiv');
		
		}else if ((url2.getAttribute("href").split('/'))[5]+".jsp" == nowPage) {
			$("#student_MemberJoinMgmtPage").attr('class','selectDiv');
		}
});

</script>
</head>
<body>
	<jsp:include
		page="/WEB-INF/views/student_common/student_navigationvar.jsp"></jsp:include>

	<!-- 페이지 내용 부분 시작 (이 부분만 카피해서 사용할것. 카피 후 삭제) -->
	<div class="page-content p-5" id="content">
		<!-- 토글 버튼 -->
		<button id="sidebarCollapse" type="button"
			class="btn btn-light bg-white rounded-pill box px-4 mb-4">
			<small class="text-uppercase font-weight-bold">MENU</small>
		</button>

		<c:if test="${empty MainData.IsBoss}">
			<link
				href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
				rel="stylesheet">
			<link rel="stylesheet" href="/cbh/resources/css/status.css">
			<div class="row my-5"
				style="width: 100%; height: 100%; padding-top: 100px;">
				<div class="col-1"></div>
				<div class="col">
					<div class="page-404">
						<div class="outer">
							<div class="middle">
								<div class="inner">
									<!--BEGIN CONTENT-->
									<a href="/cbh/student/myclub/main/student_MainPage" style="text-decoration: none;" class="inner-circle"><i
										class="fa fa-home"></i><span> 권한제한</span></a> <span
										class="inner-status">페이지 권한이 없습니다.</span> <span
										class="inner-detail"> 접속을 원하시면 권한을 부여받으십시요. </span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-1"></div>
			</div>
		</c:if>

		<c:if test="${not empty MainData.IsBoss}">
			<div class="row card box" style="width: 100%; height: 45px;">
				<div class="dashboard-card-bottom">
					<div class="row">

						<div class="col-1"></div>

						<div class="col">

							<div class="row ps-1 p-2 mb-2">
								<div class="col text-center"
									style="border-right: 2px solid #ededed;">
									<div class="row" style="justify-content: center">
										<a id="student_MemberMgmtPage"
											href="/cbh/student/myclub/membermgmt/student_MemberMgmtPage"
											class="col-auto px-3 aClick"
											style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none;">
											전체 회원 관리 </a>
									</div>
								</div>

								<div class="col text-center"
									style="border-right: 2px solid #ededed;">
									<div class="row" style="justify-content: center">
										<a id="student_MemberJoinMgmtPage"
											href="/cbh/student/myclub/membermgmt/student_MemberJoinMgmtPage"
											class="col-auto px-3 aClick"
											style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none;">
											가입 관리 </a>
									</div>
								</div>

								<div class="col text-center"
									style="border-right: 2px solid #ededed;">
									<div class="row" style="justify-content: center">
										<div class="col-auto px-3"
											style="cursor: pointer; border-radius: 2rem;">[동아리 총 멤버
											: ${ActiveMemberCount} 명]</div>
									</div>
								</div>

								<div class="col text-center">
									<div class="row" style="justify-content: center">
										<div class="col-auto px-3"
											style="cursor: pointer; border-radius: 2rem;">[동아리 총 멤버
											: ${ActiveMemberCount} 명]</div>
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

						<div class="row my-5">

							<div class="col-1"></div>

							<div class="col">
								<div class="row">
									<table class="table">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">아이디</th>
												<th scope="col">이름</th>
												<th scope="col">직책</th>
												<th scope="col">가입일</th>
												<th scope="col">성별</th>
												<th scope="col">번호</th>
												<th scope="col"></th>
												<th scope="col"></th>
											</tr>
										</thead>

										<c:if test="${ActiveMemberDataList.size() == 0}">
											<tbody>
												<tr>
													<th scope="row"></th>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
													<td></td>
												</tr>
											</tbody>
										</c:if>

										<c:if test="${ActiveMemberDataList.size() > 0}">
											<c:forEach begin="0" end="${ActiveMemberDataList.size() -1}"
												var="i">
												<tbody>
													<tr>
														<th scope="row">${ActiveMemberDataList[i].MemberInfoDyVO.club_stud_no}</th>
														<td>${ActiveMemberDataList[i].MemberInfoDyVO.stud_id}</td>
														<td>${ActiveMemberDataList[i].MemberInfoDyVO.stud_name}</td>
														<td>${ActiveMemberDataList[i].MemberInfoDyVO.club_stud_grade}</td>
														<td><fmt:formatDate
																value="${ActiveMemberDataList[i].MemberInfoDyVO.club_stud_join_date}"
																pattern="yy.MM.dd" /></td>
														<td>${ActiveMemberDataList[i].MemberInfoDyVO.stud_gender}</td>
														<td>${ActiveMemberDataList[i].MemberInfoDyVO.stud_phone}</td>
														<td>

															<div class="dropdown">

																<button class="btn btn-secondary dropdown-toggle"
																	type="button" data-bs-toggle="dropdown"
																	aria-expanded="false">직책 임명</button>

																<ul class="dropdown-menu">
																	<li><input type="text"
																		class="btn btn-outline-secondary alertStart"
																		onclick="changePosition(this)" value="부회장"></li>
																	<li><input type="text"
																		class="btn btn-outline-secondary alertStart"
																		onclick="changePosition(this)" value="총무"></li>
																	<li><input type="text"
																		class="btn btn-outline-secondary alertStart"
																		onclick="changePosition(this)" value="회계"></li>
																	<li><input type="text"
																		class="btn btn-outline-secondary alertStart"
																		onclick="changePosition(this)" value="서기"></li>
																	<li><input type="text"
																		class="btn btn-outline-secondary alertStart"
																		onclick="changePosition(this)" value="일반회원"></li>
																</ul>

																<script type="text/javascript">

																	function changePosition(target) {
	
																		var club_stud_no = $(target).parent().parent().parent().children('.club_stud_no').text();
																		var club_stud_grade = $(target).val();
													
																		Swal.fire({
																		      title:'직책 임명을 하시겠습니까?',
																		      text: "직책 임명은. 신중하세요.",
																		      icon: 'warning',
																		      showCancelButton: true,
																		      confirmButtonColor: '#3085d6',
																		      cancelButtonColor: '#d33',
																		      confirmButtonText: '승인',
																		      cancelButtonText: '취소',
																		      reverseButtons: true, // 버튼 순서 거꾸로
																		      
																		    }).then((result) => {
																		      if (result.isConfirmed) {

																		        var xhr = new XMLHttpRequest();
																				xhr.onreadystatechange = function() {
																					if (xhr.readyState == 4 && xhr.status == 200) {
																						var result = JSON.parse(xhr.responseText);

																					}
																				}
																		      
																				xhr.open("post","/cbh/student/myclub/membermgmt/updateClubMemberChangePosition");
																				xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
																				xhr.send("club_stud_no=" + club_stud_no + "&club_stud_grade="+ club_stud_grade);
																				
																				location.reload();

																		      }
																				
																		    })
																	}
																</script>

																<div hidden="hidden" class="club_stud_no">${ActiveMemberDataList[i].MemberInfoDyVO.club_stud_no}</div>
															</div>

														</td>
														<td><input type="text" class="btn btn-danger"
															onclick="deleteMemberInfo(this)" value="강제 탈퇴">
															<div hidden="hidden" class="club_stud_no">${ActiveMemberDataList[i].MemberInfoDyVO.club_stud_no}</div>
															<script type="text/javascript">
															function deleteMemberInfo(target) {

																var club_stud_no = $(target).parent().children('.club_stud_no').text();
														
																Swal.fire({
																      title:'강제 탈퇴 시키시겠습니까?',
																      text: "다시 되돌릴 수 없습니다. 신중하세요.",
																      icon: 'warning',
																      showCancelButton: true,
																      confirmButtonColor: '#3085d6',
																      cancelButtonColor: '#d33',
																      confirmButtonText: '승인',
																      cancelButtonText: '취소',
																      reverseButtons: true, // 버튼 순서 거꾸로
																      
																    }).then((result) => {
																      if (result.isConfirmed) {

																        var xhr = new XMLHttpRequest();
																		xhr.onreadystatechange = function() {
																			if (xhr.readyState == 4 && xhr.status == 200) {
																				var result = JSON.parse(xhr.responseText);

																			}
																		}
																      
																		xhr.open("get","/cbh/student/myclub/membermgmt/deleteMemberInfo?club_stud_no="+ club_stud_no);
																		xhr.send();
																      	
																		location.reload();
																      }
																		
																    })
																}	
															</script></td>
													</tr>
												</tbody>
											</c:forEach>
										</c:if>
									</table>
								</div>

								<form
									action="/cbh/student/myclub/membermgmt/student_MemberMgmtPage"
									method="get">
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
													<option selected value="name">이름</option>
													<option value="id">아이디</option>
													<option value="phone">번호</option>
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

								<div class="row my-5">
									<nav aria-label="Page navigation example">
										<ul class="pagination justify-content-center pagination-lg">
											<c:choose>
												<c:when test="${startPage <= 1}">
													<li class="page-item disabled"><a class="page-link"
														style="text-decoration-line: none; color: red;">◀</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item disabled"><a class="page-link"
														style="text-decoration-line: none; color: black;"
														href="/cbh/student/myclub/membermgmt/student_MemberMgmtPage?pageNum=${startPage -1}">◀</a></li>
												</c:otherwise>
											</c:choose>

											<c:forEach begin="${startPage}" end="${endPage}" var="i">
												<c:choose>
													<c:when test="${i == currentPageNum}">
														<li class="page-item"><a class="page-link"
															style="text-decoration-line: none; color: blue; font-weight: 600;"
															href="/cbh/student/myclub/membermgmt/student_MemberMgmtPage?pageNum=${i}">${i}</a></li>
													</c:when>
													<c:otherwise>
														<li class="page-item"><a class="page-link"
															style="text-decoration-line: none; color: black;"
															href="/cbh/student/myclub/membermgmt/student_MemberMgmtPage?pageNum=${i}">${i}</a></li>
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
														href="/cbh/student/myclub/membermgmt/student_MemberMgmtPage?pageNum=${endPage +1}">▶</a></li>
												</c:otherwise>
											</c:choose>

										</ul>
									</nav>
								</div>

							</div>

							<div class="col-1"></div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
	</div>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>