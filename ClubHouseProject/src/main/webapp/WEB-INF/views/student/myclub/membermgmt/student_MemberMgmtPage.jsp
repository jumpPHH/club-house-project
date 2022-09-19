<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 동아리 동아리원 관리 페이지</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="/cbh/resources/css/student_MainPage.css">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
a {
	text-decoration: none;
	list-style-type: disc;
	list-style: none;
	margin-bottom: .5vh;
	color: #828282;
}

a:hover {
	font-weight: bold;
	color: #828282;
	letter-spacing: 0.05vw;
}
</style>

<script type="text/javascript">
	function changePosition(target) {

		var club_stud_no = $(target).parent().parent().parent().children('.club_stud_no').text();
		var club_stud_grade = $(target).val();

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

	function deleteMemberInfo(target) {

		var club_stud_no = $(target).parent().children('.club_stud_no').text();

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
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/student_common/student_header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/student_common/student_sidevar.jsp"></jsp:include>


	<div
		style="position: absolute; left: 13.5%; width: 86.5%; top: 14vh; height: 86vh; overflow-y: auto; word-break: break-all;">
		<div class="container-fluid">

			<c:if test="${empty MainData.IsBoss}">
			 	관리자만 이용가능한 페이지입니다.
			 </c:if>

			<c:if test="${not empty MainData.IsBoss}">
				<div class="row">
					<div class="col-1"></div>

					<div class="col">
						<div class="row my-5">
							<div class="col">
								<i class="bi bi-person-video3"
									style="font-size: 40px; color: #EF1B3F;"></i> <span
									style="font-size: 30px;">동아리원 관리</span>
							</div>
						</div>

						<div class="row my-5">
							<div class="col-2" style="text-align: center;">
								<a href="/cbh/student/myclub/membermgmt/student_MemberMgmtPage"
									style="font-size: 19px;">전체 멤버 관리</a>
							</div>
							<div class="col-1" style="text-align: center;">|</div>
							<div class="col-2" style="text-align: center;">
								<a
									href="/cbh/student/myclub/membermgmt/student_MemberJoinMgmtPage"
									style="font-size: 19px;">가입 관리</a>
							</div>
							<div class="col" style="text-align: center;">[동아리 총 멤버 :
								${ActiveMemberCount} 명]</div>
							<div class="col" style="text-align: center;">[검색 결과 :
								${ActiveMemberSelectCount} 명]</div>
						</div>

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
																class="btn btn-outline-secondary"
																onclick="changePosition(this)" value="부회장"></li>
															<li><input type="text"
																class="btn btn-outline-secondary"
																onclick="changePosition(this)" value="총무"></li>
															<li><input type="text"
																class="btn btn-outline-secondary"
																onclick="changePosition(this)" value="화계"></li>
															<li><input type="text"
																class="btn btn-outline-secondary"
																onclick="changePosition(this)" value="서기"></li>
															<li><input type="text"
																class="btn btn-outline-secondary"
																onclick="changePosition(this)" value="일반회원"></li>
														</ul>

														<div hidden="hidden" class="club_stud_no">${ActiveMemberDataList[i].MemberInfoDyVO.club_stud_no}</div>
													</div>

												</td>
												<td><input type="text" class="btn btn-danger"
													onclick="deleteMemberInfo(this)" value="강제 탈퇴">
													<div hidden="hidden" class="club_stud_no">${ActiveMemberDataList[i].MemberInfoDyVO.club_stud_no}</div>
												</td>
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
			</c:if>
		</div>
	</div>

	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>