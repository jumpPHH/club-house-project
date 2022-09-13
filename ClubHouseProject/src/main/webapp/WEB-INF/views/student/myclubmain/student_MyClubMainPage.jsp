<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 동아리 메인 페이지</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="/cbh/resources/css/student_MainPage.css">

</head>
<body>
<jsp:include page="/WEB-INF/views/student_common/student_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/student_common/student_sidevar.jsp"></jsp:include>

<div style="position: absolute; left: 13.5%; width: 86.5%; top: 14vh; height:86vh; overflow-y: auto; word-break: break-all;">
	<div class="container-fluid">
	
	<c:if test="${empty myClubMainData.GetClubBoss}">
			<div class="row">
			<div class="col-4">
				<div class="row my-5">
					<div class="col">
						<i class="bi bi-people-fill" style="font-size: 40px; color: #EF1B3F;"></i>
						<span style="font-size: 30px;">내 동아리</span>	
					</div>		
				</div>	
					
				<div class="row  my-3">
					<div class="col">동아리 이름</div>
					<div class="col-1">|</div>
					<div class="col">없음</div>
				</div>
	
				<div class="row my-3">
					<div class="col">설립 일자</div>
					<div class="col-1">|</div>
					<div class="col">없음</div>
				</div>
	
				<div class="row my-3">
					<div class="col">동아리 회장</div>
					<div class="col-1">|</div>
					<div class="col">없음</div>
				</div>	
			</div>
			 
			<div class="col">
				<div class="row my-5">
					<img style="width:100%; height:400px;  " src="../../resources/img/notclub.png">
				</div>
			</div>	
		</div>
	   
		<div class="row">
			<div class="col">
				<div class="row my-2">
					<h3>동아리 소개</h3>
				</div>
			</div>
		</div>
		
		<div class="row my-2">
			<div>
				<div class="col card form-check"
					style="width: 100%; height: 10rem; border: 1px solid black; background-color: #f0f8ff; padding-left: 10px;">
					 내용 없음.
				</div>
			</div>
		</div>
	
		
			
	</c:if>
		
	<c:if test="${not empty myClubMainData.GetClubBoss}">
	  <div class="row">
		<div class="col-4">
			<div class="row my-5">
				<div class="col">
					<i class="bi bi-people-fill" style="font-size: 40px; color: #EF1B3F;"></i>
					<span style="font-size: 30px;">내 동아리</span>	
				</div>		
			</div>	
				
			<div class="row  my-3">
				<div class="col">동아리 이름</div>
				<div class="col-1">|</div>
				<div class="col">${myClubMainData.GetClubBossClubInfo.club_name}</div>
			</div>

			<div class="row my-3">
				<div class="col">설립 일자</div>
				<div class="col-1">|</div>
				<div class="col"><fmt:formatDate value="${myClubMainData.GetClubBossClubInfo.club_estbl_date }" pattern="yy.MM.dd"/></div>
			</div>

			<div class="row my-3">
				<div class="col">동아리 회장</div>
				<div class="col-1">|</div>
				<div class="col">${myClubMainData.GetClubBoss.stud_name }</div>
			</div>	
		</div>
		 
		<div class="col">
			<div class="row my-5">
				<img src="/uploadFiles/ClubHouseProject/student/${myClubMainData.GetClubBossClubInfo.club_title_image }">
			</div>
		</div>	
	</div>
   
	<div class="row">
		<div class="col">
			<div class="row my-2">
				<h3>동아리 소개</h3>
			</div>
		</div>
	</div>
	
	<div class="row my-2">
		<div>
			<div class="col card form-check"
				style="width: 100%; height: 10rem; border: 1px solid black; background-color: #f0f8ff; padding-left: 10px;">
				 ${myClubMainData.GetClubBossClubInfo.club_description }
			</div>
		</div>
	</div>
	</c:if>
	
	<div class="row">
		<div id="calendar">
			<div class="row my-3">
				<div class="col"></div>
				<div class="col-3" style="text-align: center;"><h3>8월</h3></div>
				<div class="col" style="text-align: right;"><span>전체보기<i class="bi bi-arrow-right-circle-fill" style="padding-left:20px; font-size: 20px; color:#428EF4;"></i></span></div>
			</div>
		
			<div class="row" style="background-color: #dcdcdc;">
				<div class="col" style="border: 2px solid #c8c8c8; width: 50px; height: 120px;">25일</div>
				<div class="col" style="border: 2px solid #c8c8c8; width: 50px; height: 120px;">26일</div>
				<div class="col" style="border: 2px solid #c8c8c8; width: 50px; height: 120px;">27일</div>
				<div class="col" style="border: 2px solid #c8c8c8; width: 50px; height: 120px;">28일</div>
				<div class="col" style="border: 2px solid #c8c8c8; width: 50px; height: 120px;">29일</div>
				<div class="col" style="border: 2px solid #c8c8c8; width: 50px; height: 120px;">30일</div>
				<div class="col" style="border: 2px solid #c8c8c8; width: 50px; height: 120px;">31일</div>
			</div>
		</div>
	</div>

		<div class="row my-3">
			<div class="col">
				<div class="row my-2">
					<div class="col"><h3>동아리 활동 내역</h3></div>
					<div class="col" style="text-align: right;">전체보기<i class="bi bi-arrow-right-circle-fill" style="padding-left:20px; font-size: 20px; color:#428EF4;"></i></div>
					
				</div>
				
				<div class="row my-2">
					<table class="table">
					  <thead>
					    <tr>
					      <th scope="col">#</th>
					      <th scope="col">제목</th>
					      <th scope="col">글쓴이</th>
					      <th scope="col">작성일</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th scope="row">1</th>
					      <td>이두,삼두 3세트 조져놨더니..</td>
					      <td>안요섭</td>
					      <td>2022.08.22</td>
					    </tr>
					    <tr>
					      <th scope="row">2</th>
					      <td>복근 키우는데에 이것만하세요.</td>
					      <td>김찬우</td>
					      <td>2022.08.19</td>
					    </tr>
					    <tr>
					      <th scope="row">3</th>
					      <td>상당히 힘든 등조지기</td>
					      <td>박한희</td>
					      <td>2022.08.16</td>
					    </tr>
					  </tbody>
					</table>
				</div>
				
			</div>
		</div>
	
		<div class="row my-3">
			<div class="col">
				<div class="row my-2">
					<div class="col"><h3>동아리 자유 게시판</h3></div>
					<div class="col" style="text-align: right;">전체보기<i class="bi bi-arrow-right-circle-fill" style="padding-left:20px; font-size: 20px; color:#428EF4;"></i></div>
					
				</div>
			</div>
			
			<div class="row my-2">
				<table class="table">
				  <thead>
				    <tr>
				      <th scope="col">#</th>
				      <th scope="col">제목</th>
				      <th scope="col">글쓴이</th>
				      <th scope="col">작성일</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">1</th>
				      <td>이두,삼두 3세트 조져놨더니..</td>
				      <td>안요섭</td>
				      <td>2022.08.22</td>
				    </tr>
				    <tr>
				      <th scope="row">2</th>
				      <td>복근 키우는데에 이것만하세요.</td>
				      <td>김찬우</td>
				      <td>2022.08.19</td>
				    </tr>
				    <tr>
				      <th scope="row">3</th>
				      <td>상당히 힘든 등조지기</td>
				      <td>박한희</td>
				      <td>2022.08.16</td>
				    </tr>
				  </tbody>
				</table>
			</div>
		</div>

		</div>
</div>

<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>