<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="/cbh/resources/css/student_navbar.css">
<script src="https://code.jquery
.com/jquery-3.3.1.slim.min.js"></script>
<script type="text/javascript">
$(function() {
	  // Sidebar toggle behavior
	  $('#sidebarCollapse').on('click', function() {
	    $('#sidebar, #content').toggleClass('active');
	  });
	});
	
	
	

function ul(index) {
	console.log('click!' + index)
	
	var underlines = document.querySelectorAll(".underline");

	for (var i = 0; i < underlines.length; i++) {
		underlines[i].style.transform = 'translate3d(' + index * 100 + '%,0,0)';
	}
}


</script>

<!-- 사이드바 시작 -->
<div class="vertical-nav bg-white" id="sidebar">
	<div class="py-3 px-3 mb-2 bg-light">
		<div class="media d-flex align-items-center">
			<img src="/uploadFiles/ClubHouseProject/student/${sessionUserInfo.stud_photo_link}" width="65"
				class="mr-3 rounded-circle img-thumbnail shadow-sm">
			<div class="media-body">
			
				<h4 class="m-0">${sessionUserInfo.stud_name}</h4>
				<p class="font-weight-light text-muted mb-0">${sessionUserInfo.stud_grade} 학년</p>
			</div>
			<span style="cursor: pointer; font-size: 1.3vh"
				class="font-weight-bold btn btn-light bg-white rounded-pill shadow-sm"
				onclick="location.href='/cbh/student/login/student_LogoutProcess'">로그아웃</span>
		</div>
	</div>

	<p
		class="text-gray font-weight-bold text-uppercase px-3 small pb-2 mb-0">동아리관리</p>

	<ul class="nav flex-column bg-white mb-0">

		<li class="nav-item"><a href="/cbh/student/findingclub/student_indexPage"
			class="nav-link text-dark font-italic bg-light"> <i
				class="fa bi bi-search mr-3 fa-fw" style="color: #FA5858"></i> 동아리찾기
		</a></li>
	</ul>

	<p
		class="text-gray font-weight-bold text-uppercase px-3 small pb-2 mb-0">공지사항</p>

	<ul class="nav flex-column bg-white mb-0">
		<li class="nav-item"><a
			href="/cbh/student/notice/student_NoticeListPage"
			class="nav-link text-dark font-italic bg-light"> 
			<i class="fa bi bi-book-half mr-3 fa-fw" style="color: #FA5858"></i> 공지사항
		</a></li>

		<li class="nav-item"><a href="/cbh/student/volunteer/stud_VlntrApplPage"
			class="nav-link text-dark font-italic bg-light"> <i
				class="fa bi bi-signpost-2-fill mr-3  fa-fw" style="color: #FA5858"></i> 봉사공고
		</a></li>
	</ul>

	<p
		class="text-gray font-weight-bold text-uppercase px-3 small pb-2 mb-0">동아리
		개설 신청</p>

	<ul class="nav flex-column bg-white mb-0">
		<li class="nav-item">
			<a id="establishingClubIndexPage" href="/cbh/student/establishingclub/student_indexPage"
				class="nav-link text-dark font-italic bg-light"> 
				<i class="fa bi bi-pencil-square mr-3 fa-fw" style="color: #FA5858"></i> 신청서작성
			</a>
		</li>

		<li class="nav-item">

			<a id="establishingClubResultPage" href="/cbh/student/establishingclub/student_establishingClubResultPage"	class="nav-link text-dark font-italic bg-light"> 
				<i	class="fa bi bi-ui-checks mr-3 fa-fw" style="color: #FA5858"></i> 동아리신청상태

			</a>
		</li>

	</ul>

	<p
		class="text-gray font-weight-bold text-uppercase px-3 small pb-2 mb-0">내
		동아리</p>

	<ul class="nav flex-column bg-white mb-0">
		<li class="nav-item"><a
			href="/cbh/student/myclub/main/student_MainPage"
			class="nav-link text-dark font-italic bg-light"> <i
				class="fa bi bi-house-door-fill mr-3  fa-fw" style="color: #FA5858"></i> 메인
		</a></li>

		<li class="nav-item">
			
			<a id="myclubClubActivities" href="/cbh/student/myclub/clubactivities/student_indexPage"	class="nav-link text-dark font-italic bg-light"> 
				<i	class="fa bi bi-pencil-square mr-3 fa-fw" style="color: #FA5858"></i> 활동내역
			</a>
		</li>

		<li class="nav-item"><a id="myclubClubBoardPage" href="/cbh/student/myclub/clubboard/student_indexPage"
			class="nav-link text-dark font-italic bg-light"> <i
				class="fa bi bi-journal-text mr-3  fa-fw" style="color: #FA5858"></i> 자유게시판
		</a></li>

		<li class="nav-item"><a
			href="/cbh/student/myclub/membermgmt/student_MemberMgmtPage"
			class="nav-link text-dark font-italic bg-light"> <i
				class="fa bi bi-person-square mr-3  fa-fw" style="color: #FA5858"></i> 회원관리
		</a></li>

		<li class="nav-item"><a
			href="/cbh/student/myclub/applicationexpenses/student_ApplicationExpensesPage"
			class="nav-link text-dark font-italic bg-light"> <i
				class="fa bi bi-currency-dollar mr-3  fa-fw" style="color: #FA5858"></i> 경비신청
		</a></li>

		<li class="nav-item"><a
			href="/cbh/student/myclub/membershipfeemgmt/student_MemberShipFeeMgmtPage"
			class="nav-link text-dark font-italic bg-light"> <i
				class="fa bi bi-currency-exchange mr-3  fa-fw" style="color: #FA5858"></i> 회비관리
		</a></li>

		<li class="nav-item"><a href="#"
			class="nav-link text-dark font-italic bg-light"> <i
				class="fa bi bi bi-gear-fill mr-3 fa-fw" style="color: #FA5858"></i> 동아리소개작성
		</a></li>
	</ul>

</div>
<!-- 사이드바 끝 -->

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
