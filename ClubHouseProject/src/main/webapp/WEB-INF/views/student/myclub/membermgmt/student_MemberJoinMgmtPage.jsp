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
    width: 50%;
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
    -webkit-transform: scale(1.15,1.15);
    -moz-transform: scale(1.15,1.15);
    -o-transform: scale(1.15,1.15);
    -ms-transform: scale(1.15,1.15);
    transform: scale(1.15,1.15);
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
			<small class="text-uppercase font-weight-bold" >MENU</small>
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
										<a  href="/cbh/student/myclub/membermgmt/student_MemberMgmtPage"
											class="col-auto px-3 aClick" id="student_MemberMgmtPage" 
											style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none;">
											전체 회원 관리 </a>
									</div>
								</div>

								<div class="col text-center">
									<div class="row" style="justify-content: center">
										<a  href="/cbh/student/myclub/membermgmt/student_MemberJoinMgmtPage"
											class="col-auto px-3 aClick" id="student_MemberJoinMgmtPage" 
											style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none;">
											가입 관리 </a>
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
											<th scope="col">아이디</th>
											<th scope="col">이름</th>
											<th scope="col">가입신청일</th>
											<th scope="col">성별</th>
											<th scope="col"></th>
											<th scope="col"></th>
										</tr>
									</thead>

									<c:if test="${ApplicantMemberDataList.size() == 0}">
										<tbody>
											<tr>
												<th scope="row"></th>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</c:if>

									<c:if test="${ApplicantMemberDataList.size() > 0}">
										<c:forEach begin="0"
											end="${ApplicantMemberDataList.size() -1}" var="i">
											<tbody>
												<tr>
													<td>${ApplicantMemberDataList[i].ApplicantMemberInfoVO.stud_id }</td>
													<td>${ApplicantMemberDataList[i].ApplicantMemberInfoVO.stud_name }</td>
													<td><fmt:formatDate
															value="${ApplicantMemberDataList[i].ApplicantMemberInfoVO.club_stud_appl_date }"
															pattern="yy.MM.dd" /></td>
													<td>${ApplicantMemberDataList[i].ApplicantMemberInfoVO.stud_gender }</td>
													<td><input type="text" class="btn btn-secondary"
														onclick="updateApprove(this)" value="가입 승인">
														<div hidden="hidden" class="club_stud_no">${ApplicantMemberDataList[i].ApplicantMemberInfoVO.club_stud_no}</div>
														
															<script type="text/javascript">

																	function updateApprove(target) {
	
																		var club_stud_no = $(target).parent().children('.club_stud_no').text();
													
																		Swal.fire({
																		      title:'가입 승인을 하시겠습니까?',																		      
																		      icon: 'question',
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
																		      
																				xhr.open("get",
																						"/cbh/student/myclub/membermgmt/updateApprove?club_stud_no="
																								+ club_stud_no);
																				xhr.send();

																				location.reload();

																		      }
																				
																		    })
																	}
																</script>
													</td>
													<td><input type="text" class="btn btn-danger"
														onclick="deleteApprove(this)" value="가입 거절">
														<div hidden="hidden" class="club_stud_no">${ApplicantMemberDataList[i].ApplicantMemberInfoVO.club_stud_no}</div>
														
														<script type="text/javascript">

																	function deleteApprove(target) {
	
																		var club_stud_no = $(target).parent().children('.club_stud_no').text();
													
																		Swal.fire({
																		      title:'가입 거절을 하시겠습니까?',																		      
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
																		      
																				xhr.open("get",
																						"/cbh/student/myclub/membermgmt/deleteApprove?club_stud_no="
																								+ club_stud_no);
																				xhr.send();

																				location.reload();
																		      }
																				
																		    })
																	}
																</script>
													</td>
												</tr>


											</tbody>
										</c:forEach>
									</c:if>
								</table>
							</div>

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
													href="/cbh/student/myclub/membermgmt/student_MemberJoinMgmtPage?pageNum=${startPage -1}">◀</a></li>
											</c:otherwise>
										</c:choose>

										<c:forEach begin="${startPage}" end="${endPage}" var="i">
											<c:choose>
												<c:when test="${i == currentPageNum}">
													<li class="page-item"><a class="page-link"
														style="text-decoration-line: none; color: blue; font-weight: 600;"
														href="/cbh/student/myclub/membermgmt/student_MemberJoinMgmtPage?pageNum=${i}">${i}</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link"
														style="text-decoration-line: none; color: black;"
														href="/cbh/student/myclub/membermgmt/student_MemberJoinMgmtPage?pageNum=${i}">${i}</a></li>
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
													href="/cbh/student/myclub/membermgmt/student_MemberJoinMgmtPage?pageNum=${endPage +1}">▶</a></li>
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
	</div>

	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>