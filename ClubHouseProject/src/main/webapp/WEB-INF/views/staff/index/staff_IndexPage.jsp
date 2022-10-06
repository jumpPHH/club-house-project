<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원메인 페이지</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<jsp:include page="../../staff_common/staff_sidevar.jsp"></jsp:include>
<div class="page-content p-5 pt-4" id="content">
		<!-- 토글 버튼 -->
		<button id="sidebarCollapse" type="button" style="color: #FA5858"
			class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4">
			<small class="text-uppercase font-weight-bold">MENU</small>
		</button>
				
				<!-- 여기다 작성하세요 -->
				<div class="row mb-4 ps-2" style="height: 25vh">
					<div class="col box me-4">
						<div class="row">
							<div class="col text-between pt-1" style="color:#FA5858">
							<span style="font-weight: bold;font-size: 1.1rem;color: black;">결재문서</span> 
							<span style="cursor: pointer;float: right" onclick="location.href='/cbh/staff/approval/staff_DraftManagementPage'">전체보기</span> 
							</div>
						</div>
						<div class="row">
							<div class="ps-3 col text-warning text-primary" style="font-size: 1rem; font-weight: bold">
								진행중
							</div>
						</div>
						<div class="row">
							<div class="col ps-0">
								<table class="table table-sm mb-1 table-borderless" style="font-size: 0.8rem">
									<tbody>
										<c:choose>
											<c:when test="${not empty data.MyProcessApvList }">
												<c:forEach begin="0" end="1" step="1" items="${data.MyProcessApvList }" var="data">
													<tr>
														<th class="text-center col-auto py-0 ps-3"><i class="bi bi-dot"></i></th>
														<td class="py-0">${data.APV_TITLE }</td>
														<td class="text-center col-2 py-0 "><fmt:formatDate value="${data.APV_WRITEDATE }" pattern="yyyy-MM-dd"/></td>
													</tr>
												</c:forEach>
											</c:when>										
											<c:otherwise>
												<tr style="height: 19.19px">
													<th class="text-center col-auto py-0 ps-3"></th>
													<td class="py-0"></td>
													<td class="text-center col-2 py-0"></td>	
												</tr>
												<tr style="height: 19.19px">
													<th class="text-center col-auto py-0 ps-3"></th>
													<td class="py-0"></td>
													<td class="text-center col-2 py-0"></td>	
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>						
						</div>
						
						<div class="row">
						</div>
						<div class="row" >
							<div class="ps-3 col text-primary" style="font-size: 1rem; font-weight: bold">
								완료
							</div>
						</div>
						<div class="row">
							<div class="col ps-0">
								<table class="table table-sm mb-1 table-borderless" style="font-size: 0.8rem">
									<tbody>
										<c:choose>
											<c:when test="${not empty data.MyCompleteApvList }">
												<c:forEach begin="0" end="1" step="1" items="${data.MyCompleteApvList }" var="data">
													<tr>
														<th class="text-center col-auto py-0 ps-3"><i class="bi bi-dot"></i></th>
														<td class="py-0">${data.APV_TITLE }</td>
														<td class="text-center col-2 py-0"><fmt:formatDate value="${data.APV_WRITEDATE }" pattern="yyyy-MM-dd"/></td>
													</tr>
												</c:forEach>
											</c:when>										
											<c:otherwise>
												<tr style="height: 19.19px">
													<th class="text-center col-auto py-0 ps-3"></th>
													<td class="py-0"></td>
													<td class="text-center col-2 py-0"></td>	
												</tr>
												<tr style="height: 19.19px">
													<th class="text-center col-auto py-0  ps-3"></th>
													<td class="py-0"></td>
													<td class="text-center col-2 py-0"></td>	
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>						
						</div>
						
						<div class="row">
						</div>
						<div class="row">
							<div class="ps-3 col text-danger" style="font-size: 1rem; font-weight: bold">
								반려
							</div>
						</div>
						<div class="row">
							<div class="col ps-0">
								<table class="table table-sm mb-1 table-borderless" style="font-size: 0.8rem">
									
									<tbody>
										<c:choose>
											<c:when test="${not empty data.MyRejectApvList }">
												<c:forEach begin="0" end="1" step="1" items="${data.MyRejectApvList }" var="data">
													<tr>
														<th class="text-center col-auto py-0 ps-3"><i class="bi bi-dot"></i></th>
														<td class="py-0">${data.APV_TITLE }</td>
														<td class="text-center col-2 py-0"><fmt:formatDate value="${data.APV_WRITEDATE }" pattern="yyyy-MM-dd"/></td>
													</tr>
												</c:forEach>
											</c:when>										
											<c:otherwise>
												<tr style="height: 19.19px">
													<th class="text-center col-auto py-0 ps-3"></th>
													<td class="py-0"></td>
													<td class="text-center col-2 py-0"></td>	
												</tr>
												<tr style="height: 19.19px">
													<th class="text-center col-auto py-0 ps-3"></th>
													<td class="py-0"></td>
													<td class="text-center col-2 py-0"></td>	
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>						
						</div>
						
						<div class="row">
						</div>
					
					
					
					
					</div>
					
					
					
					
					<div class="col box">
					<div class="row">
						<div class="col text-between pt-1" style="color:#FA5858">
							<span style="font-weight: bold;font-size: 1.1rem;color: black;">결재함</span> 
							<span style="cursor: pointer;float: right" onclick="location.href='/cbh/staff/approval/staff_DraftManagementPage'">전체보기</span> 
							</div>
					</div>
					
					</div>
				</div>
				<div class="row mb-4 ps-2" style="height: 25vh">
				<div class="col box me-4">
					<div class="row">
						<div class="col text-between pt-1" style="color:#FA5858">
							<span style="font-weight: bold;font-size: 1.1rem;color: black;">동아리신청</span> 
							<span style="cursor: pointer;float: right" onclick="location.href='/cbh/staff/approval/staff_DraftManagementPage'">전체보기</span> 
							</div>
					</div>
				</div>
				<div class="col box">
					<div class="row">
						<div class="col text-between pt-1" style="color:#FA5858">
							<span style="font-weight: bold;font-size: 1.1rem;color: black;">동아리 경비신청</span> 
							<span style="cursor: pointer;float: right" onclick="location.href='/cbh/staff/approval/staff_DraftManagementPage'">전체보기</span> 
							</div>
					</div>
				
				</div>
				</div>
				<div class="row ps-2" style="height: 25vh">
				<div class="col box me-4">
				<div class="row">
						<div class="col text-between pt-1" style="color:#FA5858">
							<span style="font-weight: bold;font-size: 1.1rem;color: black;">학생공지사항</span> 
							<span style="cursor: pointer;float: right" onclick="location.href='/cbh/staff/approval/staff_DraftManagementPage'">전체보기</span> 
							</div>
					</div>
				</div>
				<div class="col box " >
				<div class="row">
						<div class="col text-between pt-1" style="color:#FA5858">
							<span style="font-weight: bold;font-size: 1.1rem;color: black;">봉사신청</span> 
							<span style="cursor: pointer;float: right" onclick="location.href='/cbh/staff/approval/staff_DraftManagementPage'">전체보기</span> 
							</div>
					</div>
				
				
				</div>
				</div>
				
				
				
				
				
				
				
				
				
				<!-- 여기다 작성하세요 -->
				
</div>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>