<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
	;

.box{
	background-color: white;
	border-radius: 1rem;
	box-shadow: 0 .125rem .25rem rgba(0,0,0,.075);
}
.vertical-nav {
  min-width: 17rem;
  width: 17rem;
  height: 100vh;
  position: fixed;
  top: 0;
  left: 0;
  box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.1);
  transition: all 0.4s;
}

.page-content {
  width: calc(100% - 17rem);
  margin-left: 17rem;
  transition: all 0.4s;
}

/* for toggle behavior */

#sidebar.active {
  margin-left: -17rem;
}

#content.active {
  width: 100%;
  margin: 0;
}

@media (max-width: 768px) {
  #sidebar {
    margin-left: -17rem;
  }
  #sidebar.active {
    margin-left: 0;
  }
  #content {
    width: 100%;
    margin: 0;
  }
  #content.active {
    margin-left: 17rem;
    width: calc(100% - 17rem);
  }
}
#sidebar li:hover{
	border-right: 5px solid #FA5858;
	background-color: #e7e7e7
}

body {
  background-color: #adb5bd12;
  min-height: 100vh;
  overflow-x: hidden;
  font-family: 'Noto Sans KR', sans-serif;
}

.separator {
  margin: 3rem 0;
  border-bottom: 1px dashed #fff;
}

.text-uppercase {
  letter-spacing: 0.1em;
}

.text-gray {
  color: #aaa;
}


</style>
<script type="text/javascript">

$(function() {
	  // Sidebar toggle behavior
	  $('#sidebarCollapse').on('click', function() {
	    $('#sidebar, #content').toggleClass('active');
	  });
	});

	function getStaffInfo(){
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
		if(xhr.readyState == 4 && xhr.status == 200){
		   var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
			var name = document.getElementById("name")
			name.innerText = result.session.STAFF_NAME
			
			var position = document.getElementById("position")
			position.innerText = result.session.PSTN_DIV_NAME
			}      
		}	
		xhr.open("post","/cbh/staff/restLogin/getStaffInfo",false);
		xhr.setRequestHeader("Content-type","application/json");
		xhr.send(); 
	
	}
	
	window.addEventListener('DOMContentLoaded', function(){
		getStaffInfo()
	   });
</script>

<!-- 사이드바 시작 -->
<div class="vertical-nav bg-white" id="sidebar">
  <div class="py-4 px-3 mb-2 bg-light">
    <div class="media d-flex align-items-center"><img style="cursor: pointer;" onclick="location.href='/cbh/staff/index/staff_IndexPage'" src="https://bootstrapious.com/i/snippets/sn-v-nav/avatar.png" alt="..." width="65" class="mr-3 rounded-circle img-thumbnail shadow-sm">
      <div class="media-body ps-2">
        <h4 id="name" class="m-0"></h4>
        <p id="position"class="font-weight-light text-muted mb-0"></p>
      </div> 
      <span style="cursor: pointer; font-size: 1rem; margin-left: auto" class="font-weight-bold btn btn-light bg-white rounded-pill shadow-sm" 
      onclick="location.href='/cbh/staff/login/staff_LogoutProcess'">로그아웃</span>
    </div>
  </div>

  <p class="text-gray font-weight-bold text-uppercase ps-3 mt-3 small  mb-0">기준정보관리</p>

  <ul class="nav flex-column ps-3 mb-0">
    <li class="nav-item ps-1" id="code">
      <a href="/cbh/staff/division/staff_DivisionPage" class="nav-link text-dark font-italic">
                <i class="bi bi-upc me-2" style="color: #FA5858"></i>
                코드관리
            </a>
    </li>
  </ul>

   <p class="text-gray font-weight-bold text-uppercase ps-3 mt-3 small  mb-0">전자결재</p>

  <ul class="nav flex-column ps-3 mb-0">
    <li class="nav-item ps-1" id="WriteDraftPage">
      <a href="/cbh/staff/approval/staff_WriteDraftPage" class="nav-link text-dark font-italic">
                <i class=" bi bi-pencil-square me-2" style="color: #FA5858"></i>
                기안서작성
            </a>
    </li>
     <li class="nav-item ps-1" id="DraftManagementPage">
      <a href="/cbh/staff/approval/staff_DraftManagementPage" class="nav-link text-dark font-italic">
                <i class=" bi-card-list me-2" style="color: #FA5858"></i>
                기안서통합관리
            </a>
    </li>
  </ul>

  
   <p class="text-gray font-weight-bold text-uppercase ps-3 mt-3 small mb-0">학생</p>

  <ul class="nav flex-column ps-3 mb-0">
    <li class="nav-item ps-1" id="StudentSearchPage">
      <a href="/cbh/staff/studentSearch/staff_StudentSearchPage" class="nav-link text-dark font-italic">
                <i class=" bi bi-search me-2" style="color: #FA5858"></i>
                학생조회
            </a>
    </li>
    
    <li class="nav-item ps-1" id="StudentNoticePage">
      <a href="/cbh/staff/studentNotice/staff_StudentNoticePage" class="nav-link text-dark font-italic">
                <i class=" bi bi-ui-checks me-2" style="color: #FA5858"></i>
                학생공지사항
            </a>
    </li>
  </ul>
  
   <p class="text-gray font-weight-bold text-uppercase ps-3 mt-3 small  mb-0">동아리</p>

  <ul class="nav flex-column ps-3 mb-0">
 <li class="nav-item ps-1" id="ApplyClubPage">
      <a href="/cbh/staff/applyClub/staff_applyClubPage" class="nav-link text-dark font-italic">
                <i class=" bi bi-file-check me-2" style="color: #FA5858"></i>
            	동아리신청접수
            </a>
    </li>

    
    <li id="ClubStudControlPage"class="nav-item ps-1">
      <a href="/cbh/staff/club/staff_ClubStudControlPage" class="nav-link text-dark font-italic">
                <i class="bi bi-pencil-square me-2" style="color: #FA5858"></i>
                동아리맴버관리
            </a>
    </li>
    
    
    <li id="ClubExpenseApplyListPage"class="nav-item ps-1">
      <a href="/cbh/staff/clubExpense/staff_ClubExpenseApplyListPage" class="nav-link text-dark font-italic">
                <i class="bi bi-cash-coin me-2 " style="color: #FA5858"></i>
                동아리경비접수
            </a>
    </li>
    
  </ul>
     <p class="text-gray font-weight-bold text-uppercase ps-3 mt-3 small mb-0">봉사관리</p>

  <ul class="nav flex-column ps-3 mb-0">
    <li id="VlntrNotiPage" class="nav-item ps-1">
      <a href="/cbh/staff/volunteer/staff_VlntrNotiPage"    class="nav-link text-dark font-italic">
                <i class=" bi bi-pencil-square me-2 " style="color: #FA5858"></i>
                봉사공고작성
            </a>
    </li>
    
    <li class="nav-item ps-1" id="VlntrControlPage">
      <a href="/cbh/staff/volunteer/staff_VlntrControlPage" class="nav-link text-dark font-italic ">
                <i class=" bi bi-ui-checks me-2 " style="color: #FA5858"></i>
                봉사시간관리
            </a>
    </li>
  </ul>
  

</div>
<!-- 사이드바 끝 -->

