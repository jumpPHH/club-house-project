<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
a {
	text-decoration: none;
	font-size: 1.8vh;
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
    
<div style="background: black; position:absolute; height: 3.5vh; width: 100vw; top: 10.5%"></div>
         
               
<div style="position: absolute; top: 10.5%; left: 1.5%; height: 89.5vh; width: 12vw;">

		<div class="text-center pe-0 mx-0"
		    style="background-color: #C4073D; height: 9vh; color: white; display: flex; align-items: center; justify-content: center;">
		    <p class="mb-0" id="bigMenuText" style="font-weight: bold">Club Activity</p>
		</div>
		
		<div style="border:1px solid #d9d9d9; background-color: #f8f9fa" id="sideBar">
			<ul style="list-style: none;">
				<li style="margin-top: 1vh; margin-bottom: 1vh">
					<!-- 아래 div 내부 전부 복사 -->
					<div style="background:linear-gradient( to right, #d95d84 , #e8d8dd ); margin-right: 1.0vw; padding-left:1vw; border-radius: 5vh; color:white; font-weight: bold;">동아리관리</div>
					<ul>
						<li>
							<!-- div태그 style 아래랑 교환, i태그도 교환 -->
							<div style="font-weight: bold;color: #bf1f51;letter-spacing: 0;"onclick="" ><i class="bi bi-check-lg"></i><a href="/cbh/student/findingclub/student_indexPage">동아리찾기</a></div>
						</li>
					</ul>
				</li>
<!-- 				<li class="border-top my-2" style="padding: 0"></li> -->
				
				<li>
					<div>공지사항</div>
					<ul>

						<li><div style="cursor: pointer;"><i class="bi bi-dot"></i><a href="/cbh/student/notice/student_NoticeListPage">공지사항</a></div></li>
						<li><div style="cursor: pointer;"><i class="bi bi-dot"></i>봉사공고</div></li>
					</ul>
				</li>
<!-- 				<li class="border-top my-2" style="padding: 0"></li> -->
				<li>
					<div>동아리 개설 신청</div>
					<ul>
						<li><div style="cursor: pointer;"><i class="bi bi-dot"></i>신청서작성</div></li>
						<li><div style="cursor: pointer;"><i class="bi bi-dot"></i>동아리신청상태</div></li>
					</ul>
				</li>
<!-- 				<li class="border-top my-2" style="padding: 0"></li> -->
				<li>
					<div>내 동아리</div>
					<ul>

						<li><div style="cursor: pointer;"><i class="bi bi-dot"></i><a href="../../student/myclubmain/student_MyClubMainPage">메인</a></div></li>
						<li><div style="cursor: pointer;"><i class="bi bi-dot"></i><a href="../../student/myclubactivity/student_MyClubActivityListPage">동아리 활동내역</a></div></li>

						<li><div style="cursor: pointer;"><i class="bi bi-dot"></i><a href="/cbh/student/myclub/main/student_MainPage">메인</a></div></li>

						<li><div style="cursor: pointer;"><i class="bi bi-dot"></i>확동계획서작성</div></li>
						<li><div style="cursor: pointer;"><i class="bi bi-dot"></i>자유게시판</div></li>
						<li><div style="cursor: pointer;"><i class="bi bi-dot"></i>동아리일정</div></li>
						<li><div style="cursor: pointer;"><i class="bi bi-dot"></i><a href="/cbh/student/myclub/membermgmt/student_MemberMgmtPage">회원관리</a></div></li>
						<li><div style="cursor: pointer;"><i class="bi bi-dot"></i><a href="/cbh/student/myclub/applicationexpenses/student_ApplicationExpensesPage">경비신청</a></div></li>
						<li><div style="cursor: pointer;"><i class="bi bi-dot"></i><a href="/cbh/student/myclub/membershipfeemgmt/student_MemberShipFeeMgmtPage">회비관리</a></div></li>
						<li><div style="cursor: pointer;"><i class="bi bi-dot"></i>동아리소개작성</div></li> 
					</ul>
				</li> 
	
			</ul>
		</div>	
</div>