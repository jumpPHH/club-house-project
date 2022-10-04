<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 페이지</title>




<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
</head>
<body>
<jsp:include
      page="/WEB-INF/views/student_common/student_navigationvar.jsp"></jsp:include>
      
     <!-- 페이지 내용 부분 시작 (이 부분만 카피해서 사용할것. 카피 후 삭제) -->
   <div class="page-content p-5" id="content">
     <!-- 토글 버튼 -->
      <button id="sidebarCollapse" type="button"
         class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4">
         <i class="fa fa-bars mr-2"></i><small
            class="text-uppercase font-weight-bold">Toggle</small>
      </button>
      
      <div class="card" style="width:100%; height:60rem; border-radius:2%;">
         <div class="dashboard-card-bottom" >
            <!-- 실제 내용 -->
            <div class="row">
            	<div class="col-1"></div>
            	<div class="col">
            		<div class="container-fluid">
		<div class="row mx-5 mt-4">
			<!-- 여기다 작성하세요 -->
			<div class="col">
				<h2>
				<i class="bi bi-heart" style="color:red"></i>
				<strong>봉사자 모집공고</strong> 
				</h2>
			</div>
			<div class="col"></div>
			<div class="col"></div>
			<div class="col"></div>
			
			<div class="row mt-5">
				<div class="col"></div>
				<div class="col"></div>
				<div class="col">
				
				<c:choose>
					<c:when test="${vlntrMap.vlntrNotiVo.vlntr_noti_state eq 'N'}">
						<c:if test="${myApplExist.myVlntrAppleCount eq '1'}">
							<button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
							  신청철회
							</button>
							
							<!-- Button trigger modal -->
							<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">${vlntrMap.vlntrNotiVo.vlntr_title}</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <form action="./stud_VlntrApplDeleteProcess" method="post">
							      <div class="modal-body">
							      	<input type="hidden" name="vlntr_noti_no" value="${vlntrMap.vlntrNotiVo.vlntr_noti_no }">
							        	봉사신청을 철회하겠습니까?
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
							        <button type="submit" class="btn btn-primary">철회</button>
							      </div>
							      </form>
							    </div>
							  </div>
							</div>
						</c:if>
						<c:if test="${myApplExist.myVlntrAppleCount eq '0'}">
							<!-- Modal -->
							<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
							  신청하기
							</button>
							
							<!-- Button trigger modal -->
							<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">${vlntrMap.vlntrNotiVo.vlntr_title}</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <form action="./stud_DetailVlntrApplProcess" method="post">
							      <div class="modal-body">
							      	<input type="hidden" name="vlntr_noti_no" value="${vlntrMap.vlntrNotiVo.vlntr_noti_no }">
							         신청하시겠습니까?
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
							        <button type="submit" class="btn btn-primary">신청</button>
							      </div>
							      </form>
							    </div>
							  </div>
							</div>
						</c:if>
						
					</c:when>
					<c:when test="${vlntrMap.vlntrNotiVo.vlntr_noti_state eq 'Y'}">
						<c:if test="${myApplExist.myVlntrAppleCount eq '1'}">
							<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
							  신청철회
							</button>
							
							<!-- Button trigger modal -->
							<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">${vlntrMap.vlntrNotiVo.vlntr_title}</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <form action="./stud_VlntrApplDeleteProcess" method="post">
							      <div class="modal-body">
							      	<input type="hidden" name="vlntr_noti_no" value="${vlntrMap.vlntrNotiVo.vlntr_noti_no }">
							        	봉사신청을 철회하겠습니까?
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
							        <button type="submit" class="btn btn-primary">철회</button>
							      </div>
							      </form>
							    </div>
							  </div>
							</div>
						</c:if>
						<c:if test="${myApplExist.myVlntrAppleCount eq '0'}">
							
						</c:if>
					</c:when>
				</c:choose>
					
					
				
				</div>
			</div>
			
			<div class="row mt-3" style="height: 100px">
				<hr>
				<div class="col-1"></div>
				<div class="col-7">
					
					<h2>${vlntrMap.vlntrNotiVo.vlntr_title }</h2>
				
				</div>
				<div class="col">
					<span>
						<c:choose>
					      	<c:when test="${vlntrMap.vlntrNotiVo.vlntr_noti_state eq 'N'}">
					      		<td scope="row" style="color: black;">모집중</td> 
					      	</c:when>
							<c:when test="${vlntrMap.vlntrNotiVo.vlntr_noti_state eq 'Y'}">
					      		<td scope="row" style="color: orange;">마감</td>
					      	</c:when>
					     </c:choose>
					</span>
				</div>
				<hr>
			</div>
			
			
			<div class="row mt-5">
				<div class="col">
					<img src="/uploadFiles/${vlntrMap.vlntrNotiVo.vlntr_image_link }" style="width: 90%; height:90%;"><br>
				</div>
				<div class="col">
					<table class="table" style="height: 500px">
				
						<tbody>
						    <tr style="border-top: 1px solid lightgrey; border-bottom: 1px solid lightgrey;" >
						      <th class="b1000 text-center" style="background-color: rgb(240, 233, 233)">봉사구분</th>
						      <td>${vlntrMap.vlntrDivVo.vlntr_div_name }</td>
						     </tr>
						     <tr> 
						      <th class="b1000 text-center" style="background-color: rgb(240, 233, 233)">봉사공고제목</th>
						      <td>${vlntrMap.vlntrNotiVo.vlntr_title }</td>
						    </tr>
						  
						    <tr>
						      <th scope="col" class="b1000 text-center" style="background-color: rgb(240, 233, 233)">모집시작일</th>
						      <td scope="col"><fmt:formatDate value="${vlntrMap.vlntrNotiVo.vlntr_st_date }"  pattern="yy.MM.dd"/></td>
						      </tr>
						     <tr>
						      <th scope="col" class="b1000 text-center" style="background-color: rgb(240, 233, 233)">모집종료일</th>
						      <td scope="col"><fmt:formatDate value="${vlntrMap.vlntrNotiVo.vlntr_end_date }" pattern="yy.MM.dd"/></td>
						    </tr>
						    <tr>
						      <th scope="col" class="b1000 text-center" style="background-color: rgb(240, 233, 233)">모집인원수</th>
						      <td scope="col">${vlntrMap.vlntrNotiVo.vlntr_fixed_people }명</td>
						      </tr>
						     <tr>
						      <th scope="col" class="b1000 text-center" style="background-color: rgb(240, 233, 233)">봉사시간</th>
						      <td scope="col">${vlntrMap.vlntrNotiVo.vlntr_srvc_time }시간</td>
						    </tr>
						    <tr>
						      <th scope="col" class="b1000 text-center" style="background-color: rgb(240, 233, 233)">활동장소</th>
						      <td scope="col">${vlntrMap.vlntrNotiVo.vlntr_spot }</td>
						      </tr>
						     <tr>
						      <th scope="col" class="b1000 text-center"style="background-color: rgb(240, 233, 233)">활동내용</th>
						      <td scope="col">${vlntrMap.vlntrNotiVo.vlntr_content }</td>
						    </tr>
				 		</tbody>
				</table>
					
				</div>
				
			</div>	

			
			
			</div>
		</div>
							
							
							
							
							
				</div>
            	<div class="col-1"></div>
            </div>
         
         </div>
	</div>
</div>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
	