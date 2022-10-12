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
<style type="text/css">

</style>
<script type="text/javascript">
window.addEventListener('DOMContentLoaded', function(){
	var navtab = document.getElementById("VlntrControlPage")
	navtab.setAttribute("style", "border-right: 5px solid #FA5858");
   });

</script>

</head>
<body>
<jsp:include page="/WEB-INF/views/staff_common/staff_sidevar.jsp"></jsp:include>
      
   <!-- 페이지 내용 부분 시작 (이 부분만 카피해서 사용할것. 카피 후 삭제) -->
   <div class="page-content p-5 pt-4" id="content">
     <!-- 토글 버튼 -->
      <button id="sidebarCollapse" type="button"
         class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-3" style="color: #FA5858">
         <i class="fa fa-bars mr-2"></i><small
            class="text-uppercase font-weight-bold">MENU</small>
      </button>
      

		
			<form action="./staff_VlntrControlPage" method="get">
		<div class="ms-1 row mt-3 box p-2" style="height: 45px; align-content: center;">
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
		<div class="row ms-1 mt-4 box p-4" style="height: 67vh">
			<div class="col">
			
			
			<table class="table table-sm text-center" style="border-color: grey">
			  <thead style="background-color: rgb(252, 243, 243);">
			    <tr>
<!--   				  <th><input class="form-check-input" type="checkbox" id="cbx_chkAll" /></th> -->
			      <th scope="col">동아리</th>
			      <th scope="col">학생이름</th>
			      <th scope="col">학생아이디</th>
			      <th scope="col">활동 봉사시간</th>
			      <th scope="col">총 봉사시간</th>
			    </tr>
			  </thead>
			  <tbody>
			   
			    	<c:if test="${clubStudList.size() == 0}">
						<div class="row">
							<div class="col">결과가 없습니다.</div>
						</div>
					</c:if>
					<c:if test="${clubStudList.size() > 0}">
					    <c:forEach  begin="0" end="${clubStudList.size()-1 }" var="i">
					     <tr>
<!-- 					      <th><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></th> -->
					      <td>${clubStudList[i].CLUB_NAME }</td>
					      <td>${clubStudList[i].STUD_NAME }</td>
					      <td>${clubStudList[i].STUD_ID }</td>
					       <td>
					      
					      
							<button type="button" class="btn py-0" style="color: #FA5858" data-bs-toggle="modal" data-bs-target="#exampleModal${i}">
								<i class="bi bi-plus-circle"></i>시간추가
							</button>
							
						  </td>
					      <td>${clubStudList[i].STUD_VLNTR_TIME }</td>
					     
					      </tr>
				  	    </c:forEach>
				     </c:if> 
			    
			  </tbody>
			</table>
		</div>
		
		
		</div>
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
												<li class="page-item active"><a style="text-decoration-line: none; border-color:#FA5858; background-color: #FA5858; font-weight: 600;" class="page-link" href="./staff_VlntrNotiPage?pageNum=${i}${additionalParam}">${i}</a></li>  		
								    		</c:when>
								    		<c:otherwise>
								    			<li class="page-item"><a class="page-link" style="text-decoration-line: none; color: black;" href="./staff_VlntrControlPage?pageNum=${i}${additionalParam}">${i}</a></li>
								    		</c:otherwise>
								    	</c:choose>
								    </c:forEach>
								    <c:choose>
								    	<c:when test="${endPage >= totalPageCount }">
									    	<li class="page-item disabled"><a class="page-link"
				                              style="text-decoration-line: none; color: red;">▶</a></li>
								    	</c:when>
								    	<c:otherwise>
								    		<li class="page-item"><a class="page-link"  style="text-decoration-line: none; color: black;" href="./staff_VlntrControlPage?pageNum=${endPage+1}${additionalParam}">▶</a></li>
								    	</c:otherwise>
								    </c:choose>
								  </ul>
								</nav>							
							</div>
						</div>	
	
		
		
		
		
		
		
		
		
		
		
			
	</div>

	<c:if test="${clubStudList.size() > 0}">
	 <c:forEach begin="0" end="${clubStudList.size()-1 }" var="i">
								<div class="modal fade" id="exampleModal${i}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
										      <th scope="row">${clubStudList[i].CLUB_NAME }</th>
										      <td>${clubStudList[i].STUD_NAME }</td>
										      <td>${clubStudList[i].STUD_ID }</td>
										    </tr>							  	
										  </tbody>
										</table>		
										<!-- 활동시간추가 textarea... -->
								      	<div class="row mt-2">
				      						<div class="col">		
										<textarea class="form-control" placeholder="봉사시간을 기입해주세요"
								   		onfocus="this.placeholder=''" onblur="this.placeholder='봉사시간을 기입해주세요'" name="vlntrActivityTime"></textarea>
										  <input type="hidden" name="stud_id" value="${clubStudList[i].STUD_ID }"> 
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
	  </c:forEach>
	</c:if>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>