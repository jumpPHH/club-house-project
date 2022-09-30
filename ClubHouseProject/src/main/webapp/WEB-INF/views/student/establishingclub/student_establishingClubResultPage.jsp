<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="/cbh/resources/css/NewFile.css">
<link rel="stylesheet" href="/cbh/resources/css/establishingclub.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"
        integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
        crossorigin="anonymous">
</script>




<style type="text/css">
.tab {
	border: 1px solid white;
	border-bottom: 0px;
	background-color: black;
	color: white;
	width: auto;
	align-self: end;
	flex: 0 0 auto;
	border-radius: 0.3rem 0.3rem 0% 0%;
}

.scroll-container {
	display: flex;
	flex-wrap: no-wrap;
	overflow-x: hidden;
	overflow-y: hidden;
	align-items: end;
}

.MP {
	padding-left: 2.2rem;
}

#bigMenuText{
	font-size: 2.5vh;
}
#sideBar>ul>li{
	font-size: 2vh;
	padding-left: 1.0vw;
}
#sideBar>ul>li>div{
	background:linear-gradient( to right, #d6d6d6 , #ededed );
	margin-right: 1.0vw;
	padding-left:1vw;
	border-radius: 5vh;
	color:#969696;
	font-weight: bold;
}
#sideBar>ul>li>div{
	margin-bottom: .2vh;
	margin-right: 1.0vw;
	padding-left:1vw;
	border-radius: 5vh;
}
#sideBar li ul li{
	font-size: 1.8vh;
	list-style-type: disc;
	list-style: none;
	margin-bottom: .5vh;
	color: #828282;
}
#sideBar li ul li:hover{
	font-weight: bold;
	color: #bf1f51;
	letter-spacing: 0.05vw;
}
#sideBar ul{
	margin-bottom: 1.5vh;
	padding-left: 0;
}
#sideBar li ul{
	padding-left: 1vw;
	margin-bottom: 2.2vh;
}
.bi-chevron-right{
	
}
</style>

<script type="text/javascript">
	function seeTheReason(){
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
<jsp:include page="/WEB-INF/views/student_common/student_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/student_common/student_sidevar.jsp"></jsp:include>


<div style="position: absolute; left: 13.5%; width: 86.5%; top: 14vh; height:86vh;overflow-y: auto">
	<div class="container-fluid">
		<div class="row" >
			<div class="col">
				
				<!-- 여기다 작성하세요 -->
				<div class="row">
					<div class="col" id="content">
							<!-- 컨텐트 of 헤더 -->
							<div class="row page_title">
								<div class="col-4 page_title_text">
									<span><img src="../../resources/img/student/establishingclub/contentBox_header2.png"
									 style="margin-left:0.5em; width:1.1em; height:1.5em"></span> <span style="margin-left:0.3em;">동아리 개설 신청 결과</span>
								</div>
								<div class="col"></div>
							</div>
							<div class="row">
								<div class="col">
									<table class="table">
									  <thead>
									    <tr class="table-secondary">
									      <th scope="col" class="text_align_center">번호</th>
									      <th scope="col">동아리 이름</th>
									      <th scope="col">개설 목적</th>
									      <th scope="col">개설 신청 현황</th>
									      <th scope="col" class="text_align_center">신청 일시</th>
									    </tr>
									  </thead>
									  <tbody>
									  	<c:forEach var="data" items="${clubApplDataList }">
										  	<tr>
										      <td class="text_align_center">${data.club_appl_no }</td>
										      <td>${data.club_name }</td>
										      <td>${data.club_purpose }</td>
										       <td>
										      <c:if test="${data.club_appl_state eq '1' }">
										      		<c:out value="심사중"></c:out>
									      	  </c:if> 
									      	  <c:if test="${data.club_appl_state eq '2' }">
										      		<c:out value="승인"></c:out><span style="margin-left:2em"><button class="btn btn-danger" onclick="location.href='./student_writeClubInfoPage'">동아리 정보 입력하기</button></span>
									      	  </c:if>
									      	  <c:if test="${data.club_appl_state eq '3' }">
										      		<c:out value="반려"></c:out><span style="margin-left:2em"><button class="btn btn-secondary" onclick="seeTheReason()">사유보기</button></span>
									      	  </c:if> 
										      </td>
										      <td class="text_align_center"><fmt:formatDate value="${data.club_appl_date }" pattern="yyyy.MM.dd"/></td>
										    </tr>
									  	</c:forEach>
									  </tbody>
									</table>
									
								</div>
							</div>
							
						</div>
						<div class="col-2"></div>
						</div>
				</div>
			</div>
		</div>
	</div>
					
</body>
</html>