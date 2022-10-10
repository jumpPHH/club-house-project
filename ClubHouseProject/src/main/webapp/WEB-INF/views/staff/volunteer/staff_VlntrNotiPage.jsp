<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원메인 페이지</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
<script type="text/javascript">
function ttt(e){
	e.setAttribute("style","color: blue");
}

window.addEventListener('DOMContentLoaded', function(){
	var navtab = document.getElementById("VlntrNotiPage")
	navtab.setAttribute("style", "border-right: 5px solid #FA5858");
   });
</script>
</head>
<body>
<jsp:include page="../../staff_common/staff_sidevar.jsp"></jsp:include>

	<!-- 페이지 내용 부분 시작 (이 부분만 카피해서 사용할것. 카피 후 삭제) -->
   <div class="page-content p-5 pt-4" id="content">
     <!-- 토글 버튼 -->
      <button id="sidebarCollapse" type="button"
         class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-3" style="color: #FA5858">
         <i class="fa fa-bars mr-2"></i><small
            class="text-uppercase font-weight-bold">MENU</small>
      </button>
      

		<form action="./staff_VlntrNotiPage" method="get">
			<div class="row ms-1 mt-3 box " style="height: 45px; align-items: center;"><!-- 검색 -->
				<div class="col-1"></div>
				<div class="col">
					<select name="searchType" class="form-select">
						
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="spot">장소</option>
					</select>
				</div>
				<div class="col-8">
					<input name="searchWord" type="text" class="form-control">
				</div>
				<div class="col">
					<button class="btn btn-primary">
					<i class="bi bi-search"></i>검색</button>
				</div>
				<div class="col-1"></div>
			</div>
		</form>
		<div class="row mt-4 ms-1 box p-3" style="height: 68vh">
		
		<div class="col">
			<div class="row mt-2 mb-1">
				<div class="col text-end">
						<!-- Button trigger modal -->
				<button type="button" class="btn" style="color: #FA5858;" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
					<i class="bi bi-pencil-square"></i>공고작성
				</button>
				

				</div>
			</div>
			<div class="row">
				<div class="col">
					<table class="table text-center table-sm">
				  <thead style="background-color: rgb(252, 243, 243);">
				    <tr>
				      <th class="cl" scope="col">번호</th>
				      <th class="cl" scope="col">제목</th>
				      <th class="cl" scope="col">내용</th>
				      <th class="cl" scope="col">지원인원수/모집인원수</th>
				      <th class="cl" scope="col">봉사시간수</th>
				      <th class="cl" scope="col">모집상태</th>
				      <th>상세보기</th>
				    </tr>
				  </thead>
				  <tbody class="table-group-divider">
				  <c:forEach items="${vlntrNotiList }" var="data">
				    <tr>
				      <th scope="row">${data.vlntrNotiVO.vlntr_noti_no}</th>
				      <th>${data.vlntrNotiVO.vlntr_title}</th>
				      <td>${data.vlntrNotiVO.vlntr_content }</td>
				      <td>${data.vlntrNotiVO.vlntr_appl_count}/${data.vlntrNotiVO.vlntr_fixed_people}</td>
				      <td>${data.vlntrNotiVO.vlntr_srvc_time }</td>
				      <c:choose>
				      	<c:when test="${data.vlntrNotiVO.vlntr_noti_state eq 'N'}">
				      		<td scope="row" style="color: blue;">모집중</td> 
				      	</c:when>
						<c:when test="${data.vlntrNotiVO.vlntr_noti_state eq 'Y'}">
				      		<td scope="row" style="color: green;">마감</td>
				      	</c:when>
				      </c:choose>
<%-- 				      <td><a href="./staff_DetailVlntrNotiPage?vlntr_noti_no=${data.vlntrNotiVO.vlntr_noti_no}">보기</a></td> --%>
				      <td class="pt-0"><button onclick="location.href='/cbh/staff/volunteer/staff_DetailVlntrNotiPage?vlntr_noti_no=${data.vlntrNotiVO.vlntr_noti_no}'" 
				      type="button" class="btn py-0" style="color: black;"><i class="bi bi-search"></i>보기</button></td>
				    </tr>
				  </c:forEach>
				  </tbody>
				</table>
				</div>
			</div>
				
				
			</div>
		</div>	
		<div class="row mt-3">
<!-- 			<div class="col"> 페이징 -->
<!-- 				<nav aria-label="Page navigation example"> -->
<!-- 				  <ul class="pagination" style="place-content: center;"> -->
<%-- 				  <c:choose> --%>
<%-- 				  		<c:when test="${startPage <= 1 }"> --%>
<!-- 					  		<li class="page-item disabled"><a class="page-link">&lt;</a></li> -->
<%-- 				  		</c:when> --%>
<%-- 				  		<c:otherwise> --%>
<%-- 				  		    <li class="page-item"><a class="page-link" href="./staff_VlntrNotiPage?pageNum=${startPage - 1 }${additionalParam}">&lt;</a></li> --%>
<%-- 				  		</c:otherwise> --%>
<%-- 				  </c:choose> --%>
<%-- 				    <c:forEach begin="${startPage }" end="${endPage }" var="i"> --%>
<%-- 				    	<c:choose> --%>
<%-- 				    		<c:when test="${i == currentPageNum }"> --%>
<%-- 								<li class="page-item active"><a class="page-link" href="./staff_VlntrNotiPage?pageNum=${i}${additionalParam}">${i}</a></li>  		 --%>
<%-- 				    		</c:when> --%>
<%-- 				    		<c:otherwise> --%>
<%-- 				    			<li class="page-item"><a class="page-link" href="./staff_VlntrNotiPage?pageNum=${i}${additionalParam}">${i}</a></li> --%>
<%-- 				    		</c:otherwise> --%>
<%-- 				    	</c:choose> --%>
<%-- 				    </c:forEach> --%>
<%-- 				    <c:choose> --%>
<%-- 				    	<c:when test="${endPage >= totalPageCount }"> --%>
<!-- 					    	<li class="page-item disabled"><a class="page-link">&gt;</a></li> -->
<%-- 				    	</c:when> --%>
<%-- 				    	<c:otherwise> --%>
<%-- 				    		<li class="page-item"><a class="page-link" href="./staff_VlntrNotiPage?pageNum=${endPage+1}${additionalParam}">&gt;</a></li> --%>
<%-- 				    	</c:otherwise> --%>
<%-- 				    </c:choose> --%>
<!-- 				  </ul> -->
<!-- 				</nav>							 -->
<!-- 			</div> -->
						<div class="row mt-3 text-center">
							<div class="col"> <!-- 페이징 -->
								<nav aria-label="Page navigation example">
								  <ul class="pagination" style="place-content: center;">
								  <c:choose>
								  		<c:when test="${startPage <= 1 }">
									  		<li class="page-item disabled"><a class="page-link"
				                              style="text-decoration-line: none; color: red;">◀</a></li>
								  		</c:when>
								  		<c:otherwise>
								  		
								  		    <li class="page-item"><a class="page-link"
				                              style="text-decoration-line: none; color: black;"
				                              href="./staff_VlntrNotiPage?pageNum=${startPage - 1 }${additionalParam}">◀</a></li>
								  		</c:otherwise>
								  </c:choose>
								  
								    <c:forEach begin="${startPage }" end="${endPage }" var="i">
								    	<c:choose>
								    		<c:when test="${i == currentPageNum }">
												<li class="page-item active"><a style="text-decoration-line: none;  border-color:#FA5858; background-color: #FA5858; font-weight: 600;" class="page-link" href="./staff_VlntrNotiPage?pageNum=${i}${additionalParam}">${i}</a></li>  		
								    		</c:when>
								    		<c:otherwise>
								    			<li class="page-item"><a class="page-link" style="text-decoration-line: none; color: black;" href="./staff_VlntrNotiPage?pageNum=${i}${additionalParam}">${i}</a></li>
								    		</c:otherwise>
								    	</c:choose>
								    </c:forEach>
								    <c:choose>
								    	<c:when test="${endPage >= totalPageCount }">
									    	<li class="page-item disabled"><a class="page-link"
				                              style="text-decoration-line: none; color: red;">▶</a></li>
								    	</c:when>
								    	<c:otherwise>
								    		<li class="page-item"><a class="page-link"  style="text-decoration-line: none; color: black;" href="./staff_VlntrNotiPage?pageNum=${endPage+1}${additionalParam}">▶</a></li>
								    	</c:otherwise>
								    </c:choose>
								  </ul>
								</nav>							
							</div>
				
			</div>
			
		</div>		
			<!-- 여기다 작성하세요 -->
				
	</div>
				<!-- Modal -->
				<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="staticBackdropLabel">공고작성</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <form action="./staff_VlntrNotiProcess" method="post" enctype="multipart/form-data">
				      <div class="modal-body">
				      	<div class="row">
				      		<div class="col">
				      			봉사구분<select class="form-select" name="vlntr_div_no" aria-label="Default select example">
									  <option value="1">생활편의지원</option>
									  <option value="2">주거환경</option>
									  <option value="3">상담</option>
									  <option value="4">교육</option>
									  <option value="5">농어촌봉사</option>
									  <option value="6">문화행사</option>
									  <option value="7">환경보호</option>
									  <option value="8">기타</option>
									</select>
				      		</div>
				      	</div>
				      	<div class="row mt-2">
				      		<div class="col">
				      			봉사공고제목 <textarea class="form-control" placeholder="서울동행"
								   onfocus="this.placeholder=''" onblur="this.placeholder='서울동행'" name="vlntr_title"></textarea>
				      		</div>
				      	</div>
				      	<div class="row mt-2">
				      		<div class="col">
				      			모집시작일 <input class="form-control" type="date" name="vlntr_st_date">
				      		</div>
				      		<div class="col">
				      			모집종료일 <input class="form-control" type="date" name="vlntr_end_date">
				      		</div>
				      	</div>
				      
				      	<div class="row mt-2">
				      		<div class="col">
								 모집인원수<br><textarea class="form-control" placeholder="10"
								   onfocus="this.placeholder=''" onblur="this.placeholder='10'" name="vlntr_fixed_people"></textarea>
				      		</div>
				      		<div class="col">
								 봉사시간<br><textarea class="form-control" placeholder="30"
								   onfocus="this.placeholder=''" onblur="this.placeholder='30'" name="vlntr_srvc_time"></textarea>
				      		</div>
				      	</div>
				      	<div class="row mt-2">
				      		<div class="col">
								 기관명<br><textarea class="form-control" placeholder="체육분과"
								   onfocus="this.placeholder=''" onblur="this.placeholder='체육분과'" name="vlntr_org_name"></textarea>
				      		</div>
				      		<div class="col">
								 확인자<br><textarea class="form-control" placeholder="김찬우"
								   onfocus="this.placeholder=''" onblur="this.placeholder='김찬우'" name="vlntr_checker"></textarea>
				      		</div>
				      	</div>
				      	<div class="row mt-2">
				      		<div class="col">
								 봉사 집합 시간<br>
								 <input class="form-control" type="datetime-local" pattern="yy.MM.dd yy:mm"  name="vlntr_mtng_time">
				      		</div>
				      	</div>
				      	<div class="row mt-2">
					      	<div class="col">
							  봉사 공고 이미지<br>
							  <input type="file" name="file" class="form-control" id="inputGroupFile04" 
							  aria-describedby="inputGroupFileAddon04" aria-label="Upload">
							</div>
						</div>	
				      	<div class="row mt-2">
				      		<div class="col">
								 활동장소<br><textarea class="form-control" placeholder="성내2동 및 강동구 관내"
								   onfocus="this.placeholder=''" onblur="this.placeholder='성내2동 및 강동구 관내'" name="vlntr_spot"></textarea>
				      		</div>
				      	</div>
				        <div class="row mt-2">
				      		<div class="col">
								 활동내용<br><textarea class="form-control" placeholder="불법광고 전단지 청소"
								   onfocus="this.placeholder=''" onblur="this.placeholder='불법광고 전단지 청소'" name="vlntr_content"></textarea>
				      		</div>
				      	</div>
				      	<div class="row mt-2">
				      		<div class="col">
								 <input type="hidden" name="staff_id" value="${sessionUserInfo.staff_id }">
				      		</div>
				      	</div>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				        <button type="submit" class="btn btn-primary">공고신청</button>
				      </div>
				      </form>
				    </div>
				  </div>
				</div>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>