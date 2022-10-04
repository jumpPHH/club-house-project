<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 페이지</title>
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
<div style="position: absolute; left: 13.5%; width: 86.5%; top: 14vh; height:86vh;overflow-y: auto;word-break: break-all" >
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
					
							<!-- 					공고수정 					-->
							<button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal1">
								수정하기
							</button>
							
							<!-- Button trigger modal -->
							<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">${vlntrMap.vlntrNotiVo.vlntr_title}</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      	
							    <form action="./staff_VlntrNotiModifyProcess" method="post" enctype="multipart/form-data">
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
								      			봉사공고제목 <textarea name="vlntr_title"  class="form-control" placeholder="문의제목을 작성해주세요..." id="floatingTextarea">${vlntrMap.vlntrNotiVo.vlntr_title}</textarea>
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
												 모집인원수<br><textarea class="form-control" placeholder="모집인원수를 작성해주세요"
												   id="floatingTextarea" name="vlntr_fixed_people">${vlntrMap.vlntrNotiVo.vlntr_fixed_people}</textarea>
								      		</div>
								      		<div class="col">
												 봉사시간<br><textarea class="form-control" placeholder="봉사시간을 작성해주세요"
												   id="floatingTextarea" name="vlntr_srvc_time">${vlntrMap.vlntrNotiVo.vlntr_srvc_time}</textarea>
								      		</div>
								      	</div>
								      	<div class="row mt-2">
								      		<div class="col">
												 기관명<br>
												 <textarea class="form-control" placeholder="기관명을 작성해주세요"
												   id="floatingTextarea" name="vlntr_org_name">${vlntrMap.vlntrNotiVo.vlntr_org_name}</textarea>
											</div>
								      		<div class="col">
												 확인자<br>
												 	 <textarea class="form-control" placeholder="확인자를 작성해주세요"
												   id="floatingTextarea" name="vlntr_checker">${vlntrMap.vlntrNotiVo.vlntr_checker}</textarea>
											</div>
								      	</div>
								      	<div class="row mt-2">
								      		<div class="col">
												 봉사 집합 시간<br>
												 <input class="form-control" type="datetime-local" name="vlntr_mtng_time" value="${vlntrMap.vlntrNotiVo.vlntr_mtng_time}">
								      		</div>
								      	</div>
								      	<div class="row mt-2">
									      	<div class="col">
											  봉사 공고 이미지<br>
											  <input type="file" name="file" class="form-control" id="inputGroupFile04" 
											  aria-describedby="inputGroupFileAddon04" aria-label="Upload" value="${vlntrMap.vlntrNotiVo.vlntr_image_link}">
											</div>
										</div>	
								      	<div class="row mt-2">
								      		<div class="col">
												 활동장소<br>
												 <textarea class="form-control" placeholder="활동장소를 작성해주세요"
												   id="floatingTextarea" name="vlntr_spot">${vlntrMap.vlntrNotiVo.vlntr_spot}</textarea>
								      		</div>
								      	</div>
								        <div class="row mt-2">
								      		<div class="col">
												 활동내용<br>
												 		<textarea class="form-control" placeholder="활동내용을 작성해주세요"
												   id="floatingTextarea" name="vlntr_content">${vlntrMap.vlntrNotiVo.vlntr_content}</textarea>
								      		</div>
								      	</div>
								      	<div class="row mt-2">
								      		<div class="col">
												 <input type="hidden" name="staff_id" value="${sessionUserInfo.staff_id }">
												 <input type="hidden" name="vlntr_noti_no" value="${vlntrMap.vlntrNotiVo.vlntr_noti_no}">
								      		</div>
								      	</div>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
								        <button type="submit" class="btn btn-primary">수정</button>
								      </div>
								      </form>
							    </div>
							  </div>
							</div>
											
											
								<!-- 					공고삭제 					-->
								<button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#exampleModal2">
									삭제
								</button>
								
								<!-- Button trigger modal -->
								<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel">${vlntrMap.vlntrNotiVo.vlntr_title}</h5>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <form action="./staff_VlntrNotiDeleteProcess" method="post">
								      <div class="modal-body">
								      	<input type="hidden" name="vlntr_noti_no" value="${vlntrMap.vlntrNotiVo.vlntr_noti_no }">
								        	봉사공고를 삭제시키겠습니까?
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
								        <button type="submit" class="btn btn-danger">삭제</button>
								      </div>
								      </form>
								    </div>
								  </div>
								</div>
								
								<!-- 					공고마감 					-->
								<button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#exampleModal3">
									마감하기
								</button>
								
								<!-- Button trigger modal -->
								<div class="modal fade" id="exampleModal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel">${vlntrMap.vlntrNotiVo.vlntr_title}</h5>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <form action="./staff_VlntrNotiCloseProcess" method="post">
								      <div class="modal-body">
								      	<input type="hidden" name="vlntr_noti_no" value="${vlntrMap.vlntrNotiVo.vlntr_noti_no }">
								        	봉사공고를 마감시키겠습니까?
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
								        <button type="submit" class="btn btn-success">마감</button>
								      </div>
								      </form>
							    </div>
							  </div>
							</div>
					</c:when>
					
					
					<c:when test="${vlntrMap.vlntrNotiVo.vlntr_noti_state eq 'Y'}">
					
					
				<!-- 					공고삭제 					-->
							<button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#exampleModal2">
								삭제
							</button>
							
							<!-- Button trigger modal -->
							<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">${vlntrMap.vlntrNotiVo.vlntr_title}</h5>
							        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							      </div>
							      <form action="./staff_VlntrNotiDeleteProcess" method="post">
							      <div class="modal-body">
							      	<input type="hidden" name="vlntr_noti_no" value="${vlntrMap.vlntrNotiVo.vlntr_noti_no }">
							        	봉사공고를 삭제시키겠습니까?
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
							        <button type="submit" class="btn btn-danger">삭제</button>
							      </div>
							      </form>
							    </div>
							  </div>
							</div>
							
							
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
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>