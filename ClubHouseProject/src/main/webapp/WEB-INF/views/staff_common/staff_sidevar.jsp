<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
					<div style="background:linear-gradient( to right, #d95d84 , #e8d8dd ); margin-right: 1.0vw; padding-left:1vw; border-radius: 5vh; color:white; font-weight: bold;">기준정보관리</div>
					<ul>
						<li>
							<!-- div태그 style 아래랑 교환, i태그도 교환 -->
							<div style="font-weight: bold;color: #bf1f51;letter-spacing: 0;"onclick="location.href='/cbh/staff/division/staff_DivisionPage" ><i class="bi bi-check-lg"></i> 코드관리</div>
						</li>
					</ul>
				</li>
<!-- 				<li class="border-top my-2" style="padding: 0"></li> -->
				
				<li>
					<div>학생</div>
					<ul>
						<li><div onclick="location.href='/cbh/staff/studentSearch/staff_StudentSearchPage'" style="cursor: pointer;"><i class="bi bi-dot"></i>학생조회</div></li>
						<li><div onclick="location.href='/cbh/staff/studentNotice/staff_StudentNoticePage'" style="cursor: pointer;"><i class="bi bi-dot"></i>학생공지사항</div></li>
					</ul>
				</li>
<!-- 				<li class="border-top my-2" style="padding: 0"></li> -->
				<li>
					<div>동아리</div>
					<ul>
						<li><div style="cursor: pointer;"><i class="bi bi-dot"></i>동아리관리</div></li>
						<li><div style="cursor: pointer;"><i class="bi bi-dot"></i>동아리멤버관리</div></li>
					</ul>
				</li>
<!-- 				<li class="border-top my-2" style="padding: 0"></li> -->
				<li>
					<div>동아리경비관리</div>
					<ul>
						<li><div style="cursor: pointer;"><i class="bi bi-dot"></i>동아리경비내역</div></li>
						<li><div style="cursor: pointer;"><i class="bi bi-dot"></i>동아리경비접수</div></li>
						<li><div style="cursor: pointer;"><i class="bi bi-dot"></i>동아리경비검수</div></li>
					</ul>
				</li>
<!-- 				<li class="border-top my-2" style="padding: 0"></li> -->
				<li>
					<div>봉사관리</div>
					<ul>
						<li><div style="cursor: pointer;"><i class="bi bi-dot"></i>봉사공고신청</div></li>
						<li><div style="cursor: pointer;"><i class="bi bi-dot"></i>봉사시간관리</div></li>
					</ul>
				</li>
				
				
			</ul>
		</div>	
</div>
