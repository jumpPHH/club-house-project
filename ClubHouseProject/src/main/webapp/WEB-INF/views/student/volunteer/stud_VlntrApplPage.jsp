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
							<div class="col">
								<h2>
								<i class="bi bi-heart" style="color:red"></i>
								<strong>봉사공고신청</strong> 
								</h2>
							</div>
							<div class="col"></div>
							<div class="col"></div>
							<div class="col"></div>
						
						<div class="row mt-4">
							<table class="table">
							  <thead class="table" style="background-color: rgb(230, 219, 219); height: 4rem;">
							    <tr>
							      <th class="cl" scope="col">번호</th>
							      <th class="cl" scope="col">제목</th>
							      <th class="cl" scope="col">내용</th>
							      <th class="cl" scope="col">지원인원수/모집인원수</th>
							      <th class="cl" scope="col">봉사시간수</th>
							      <th class="cl" scope="col">모집상태</th>
							    </tr>
							  </thead>
							  <tbody class="table-group-divider">
								<c:forEach items="${vlntrNotiList}" var="data">
							    <tr>
							      <th scope="row">${data.vlntrNotiVO.vlntr_noti_no}</th>
							      <td><a href="./stud_DetailVlntrApplPage?vlntr_noti_no=${data.vlntrNotiVO.vlntr_noti_no}">${data.vlntrNotiVO.vlntr_title}</a></td>
							      <td>${data.vlntrNotiVO.vlntr_content }</td>
							      <td>${data.vlntrNotiVO.vlntr_appl_count}/${data.vlntrNotiVO.vlntr_fixed_people}</td>
							      <td>${data.vlntrNotiVO.vlntr_srvc_time }</td>
							      <c:choose>
							      	<c:when test="${data.vlntrNotiVO.vlntr_noti_state eq 'N'}">
							      		<td scope="row" style="color: red;">모집중</td> 
							      	</c:when>
									<c:when test="${data.vlntrNotiVO.vlntr_noti_state eq 'Y'}">
							      		<td scope="row" style="color: green;">마감</td>
							      	</c:when>
							      </c:choose>
							    </tr>
							  </c:forEach>
							  </tbody>
							</table>
							
						</div>	
						
						<form action="./staff_VlntrNotiPage" method="get">
							 <div class="row my-5">
				                           <div class="col">
				                              <h6
				                                 style="font-size: 15px; color: #333; font-weight: bold; margin-top: 20px;">검색어</h6>
				                           </div>
				
				                           <div class="col">
				                              <div class="form-floating">
				                               
				                                 <select name="searchType" class="form-select"
				                                    id="floatingSelect"
				                                    aria-label="Floating label select example"
				                                    style="font-size: 15px; color: #333; font-weight: bold; padding: 10px;">
													<option value="title">제목</option>
													<option value="content">내용</option>
													<option value="spot">장소</option>
												</select>
				                              </div>
				                           </div>
				
				                           <div class="col-6">
				                              <div class="form-floating">
				                                 <textarea name="searchWord" class="form-control"
				                                    placeholder="Leave a comment here" id="floatingTextarea"></textarea>
				                                 <label for="floatingTextarea" style="font-size: 15px;">검색어를
				                                    입력해주세요.</label>
				                              </div>
				                           </div>
				
				                           <div class="col">
				                              <button type="submit" class="btn btn-primary btn-lg"
				                                 style="height: 60px; font-size: 15px;">
				                                 <i class="bi bi-search">검색</i>
				                              </button>
				                           </div>
				                        </div>
						</form>
						
						<div class="row mt-3">
							<div class="col"> <!-- 페이징 -->
								<nav aria-label="Page navigation example">
								  <ul class="pagination">
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
												<li class="page-item active"><a style="text-decoration-line: none; color: blue; font-weight: 600;" class="page-link" href="./staff_VlntrNotiPage?pageNum=${i}${additionalParam}">${i}</a></li>  		
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
						</div>
            	</div>
            	<div class="col-1"></div>
            </div>
         
         </div>
      </div>
   </div>

	
</body>
</html>
	