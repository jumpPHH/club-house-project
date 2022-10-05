<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 봉사시간관리</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="/cbh/resources/css/staff_MainPage.css">	
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
</head>
<body>
<jsp:include page="/WEB-INF/views/staff_common/staff_sidevar.jsp"></jsp:include>
      
   <!-- 페이지 내용 부분 시작 (이 부분만 카피해서 사용할것. 카피 후 삭제) -->
   <div class="page-content p-5 pt-4" id="content">
     <!-- 토글 버튼 -->
      <button id="sidebarCollapse" type="button"
         class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-3">
         <i class="fa fa-bars mr-2"></i><small
            class="text-uppercase font-weight-bold">MENU</small>
      </button>
      

		<div class="row mt-5">
			<div class="col"></div>
			<div class="col"></div>
			<div class="col"></div>
			<div class="col">
				
			</div>
		</div>	
			<form action="./staff_VlntrControlPage" method="get">
		<div class="row mt-5 box p-2">
				 <div class="col-auto">
				    <label class="col-form-label">동아리</label>
				  </div>
				<div class="col-auto">
					<select class="form-select" name="club_no">
						  <option value="0">전체</option>
					 <c:forEach begin="0" end="${clubList.size()-1 }" var="i">
						  <option value="${clubList[i].club_no }">${clubList[i].club_name }</option>
					  </c:forEach>
				    </select>
				</div>
				 <div class="col-auto">
				    <label class="col-form-label">학생이름</label>
				  </div>
				  <div class="col-auto">
				    <input type="text" class="form-control" name="stud_name" placeholder="학생이름을 입력해주세요">
				  </div>
				  <div class="col-auto">
				    <label class="col-form-label">학생아이디</label>
				  </div>
				  <div class="col-auto">
				    <input type="text" class="form-control" name="stud_id" placeholder="학생아이디를 입력해주세요">
				  </div>
				  <div class="col">
				  	<button class="btn btn-primary" onclick="submit">검색</button>
				  </div>
		</div>
			  </form>
		<div class="row mt-4 box p-4">
			<table class="table-bordered text-center" style="border-color: grey">
			  <thead style="background-color: rgb(101, 159, 206)">
			    <tr>
<!--   				  <th><input class="form-check-input" type="checkbox" id="cbx_chkAll" /></th> -->
			      <th scope="col">동아리</th>
			      <th scope="col">학생이름</th>
			      <th scope="col">학생아이디</th>
			      <th scope="col">활동 봉사시간</th>
			      <th scope="col">총 봉사시간</th>
			    </tr>
			  </thead>
			  <tbody style="background-color: rgb(202, 226, 246)">
			   
			    	<c:if test="${clubStudList.size() == 0}">
						<div class="row">
							<div class="col">결과가 없습니다.</div>
						</div>
					</c:if>
					<c:if test="${clubStudList.size() > 0}">
					    <c:forEach items="${clubStudList }" var="clubStudList">
					     <tr>
<!-- 					      <th><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></th> -->
					      <td>${clubStudList.CLUB_NAME }</td>
					      <td>${clubStudList.STUD_NAME }</td>
					      <td>${clubStudList.STUD_ID }</td>
					       <td>
					      
					      
							<button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal" style="background-color:rgb(202, 226, 246); color: white">
								시간추가
							</button>
							
							<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">봉사시간추가</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <form action="./staff_VlntrControlProcess" method="get">
							      <div class="modal-body">
							      	  <table class="table">
										  <thead>
										    <tr>
										      <th scope="col">동아리</th>
										      <th scope="col">학생이름</th>
										      <th scope="col">학생아이디</th>
										    </tr>
										  </thead>
										  <tbody>
										    <tr>
										      <th scope="row">${clubStudList.CLUB_NAME }</th>
										      <td>${clubStudList.STUD_NAME }</td>
										      <td>${clubStudList.STUD_ID }</td>
										    </tr>							  	
										  </tbody>
										</table>		
										<!-- 활동시간추가 textarea... -->
								      	<div class="row mt-2">
				      						<div class="col">		
										<textarea class="form-control" placeholder="봉사시간을 기입해주세요"
								   		onfocus="this.placeholder=''" onblur="this.placeholder='봉사시간을 기입해주세요'" name="vlntrActivityTime"></textarea>
										  <input type="hidden" name="stud_id" value="${clubStudList.STUD_ID }"> 
										</div>
										</div>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
							        <button type="submit" class="btn btn-primary">추가</button>
							      </div>
							      </form>
							    </div>
							  </div>
							</div>	
							
							
						  </td>
					      <td>${clubStudList.STUD_VLNTR_TIME }</td>
					     
					      </tr>
				  	    </c:forEach>
				     </c:if> 
			    
			  </tbody>
			</table>
		</div>
		<div class="row mt-3">
					<div class="col"> <!-- 페이징 -->
						<nav aria-label="Page navigation example">
						  <ul class="pagination">
						  <c:choose>
						  		<c:when test="${startPage <= 1 }">
							  		<li class="page-item disabled"><a class="page-link">&lt;</a></li>
						  		</c:when>
						  		<c:otherwise>
						  		    <li class="page-item"><a class="page-link" href="./mainPage?pageNum=${startPage - 1 }${additionalParam}">&lt;</a></li>
						  		</c:otherwise>
						  </c:choose>
						    <c:forEach begin="${startPage }" end="${endPage }" var="i">
						    	<c:choose>
						    		<c:when test="${i == currentPageNum }">
										<li class="page-item active"><a class="page-link" href="./mainPage?pageNum=${i}${additionalParam}">${i}</a></li>  		
						    		</c:when>
						    		<c:otherwise>
						    			<li class="page-item"><a class="page-link" href="./mainPage?pageNum=${i}${additionalParam}">${i}</a></li>
						    		</c:otherwise>
						    	</c:choose>
						    </c:forEach>
						    <c:choose>
						    	<c:when test="${endPage >= totalPageCount }">
							    	<li class="page-item disabled"><a class="page-link">&gt;</a></li>
						    	</c:when>
						    	<c:otherwise>
						    		<li class="page-item"><a class="page-link" href="./mainPage?pageNum=${endPage+1}${additionalParam}">&gt;</a></li>
						    	</c:otherwise>
						    </c:choose>
						  </ul>
						</nav>							
					</div>
				</div>
	
		
		
		
		
		
		
		
		
		
		
			
	</div>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>