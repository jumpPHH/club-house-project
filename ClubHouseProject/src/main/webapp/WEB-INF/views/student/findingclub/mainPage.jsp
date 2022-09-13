<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생메인 페이지</title>
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="/cbh/resources/css/student_MainPage.css">
<link rel="stylesheet" href="../../resources/css/NewFile.css">
<link rel="stylesheet" href="/cbh/resources/css/findingclub.css">
</head>
<body>
 <jsp:include page="/WEB-INF/views/student_common/student_header.jsp" flush="false"></jsp:include>
 <jsp:include page="/WEB-INF/views/student_common/student_sidevar.jsp" flush="false"></jsp:include>
   <div style="position: absolute; left: 13.5%; width: 86.5%; top: 14vh; height:86vh; overflow-y: auto; word-break: break-all;">
      <div class="container-fluid">
         <div class="row">

            <!-- 컨텐트 박스 -->
            <div class="col pe-0">
               <!-- 컨텐트 부분 -->
               <div class="row">
                  <div class="col" id="content">
                  	<!-- 컨텐트 헤더 -->
                  	<div class="row page_title">
                  		<div class="col page_title_text">
                  			<span><img src="../../resources/img/student/findingclub/pageTitle.png" class="page_title_image"></span> <span>동아리 찾기</span>
                  		</div>
                  	</div>
                  	
                  	<!-- 켄텐트 of 컨텐트 -->
                  	<div class="row">
                  		<!-- 첫번째 세로 카테고리 -->
                  		<div class="col">
                  			<!-- 카테고리 박스 -->
									<div class="row category_box mt-2">
										<div class="col my-3">
											<div class="row">
												<!-- 카테고리 박스 이미지 공간 -->
												<div class="col-4">
													<img src="/cbh/resources/img/student/findingclub/clubcategory1.jpeg" class="category_image">
												</div>
												<!-- 카테고리 박스 설명 공간  -->
												<div class="col my-2">
													<div class="row">
														<div class="col category_title">공연예술분과</div>
													</div>
													<div class="row">
														<div class="col category_explanation">안녕하세요 저는
															안요섭입니다.</div>
													</div>
													<div class="row">
														<div class="col">
															<!-- 여기에 카테고리 파라미터로 넘겨주는 주소 적어야 함. -->
															<button class=" button"><a href="./club_Of_CategoryPage?club_category_no=1" style="color:white;">자세히보기</a></button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="row category_box mt-2">
										<div class="col my-3">
											<div class="row">
												<!-- 카테고리 박스 이미지 공간 -->
												<div class="col-4">
													<img src="/cbh/resources/img/student/findingclub/categoryimage2.jpg" class="category_image">
												</div>
												<!-- 카테고리 박스 설명 공간  -->
												<div class="col my-2">
													<div class="row">
														<div class="col category_title">종교분과</div>
													</div>
													<div class="row">
														<div class="col category_explanation"></div>
													</div>
													<div class="row">
														<div class="col">
															<!-- 여기에 카테고리 파라미터로 넘겨주는 주소 적어야 함. -->
															
															<button class=" button"><a href="#" style="color:white;">자세히보기</a></button>	
														</div>
													</div>
												</div>
											</div>
										</div>
									</div> 
									                			
									<div class="row category_box mt-2">
										<div class="col my-3">
											<div class="row">
												<!-- 카테고리 박스 이미지 공간 -->
												<div class="col-4">
													<img src="/cbh/resources/img/student/findingclub/categoryimage3.jpg" class="category_image">
												</div>
												<!-- 카테고리 박스 설명 공간  -->
												<div class="col my-2">
													<div class="row">
														<div class="col category_title">체육분과</div>
													</div>
													<div class="row">
														<div class="col category_explanation">안녕하세요 저는
															안요섭입니다.</div>
													</div>
													<div class="row">
														<div class="col">
															<!-- 여기에 카테고리 파라미터로 넘겨주는 주소 적어야 함. -->
															
															<button class=" button"><a href="#" style="color:white;">자세히보기</a></button>	
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>                		</div>
                  		
                  		<!-- 두번째 세로단 카테고리 -->
                  		<div class="col">
									<div class="row category_box mt-2">
										<div class="col my-3">
											<div class="row">
												<!-- 카테고리 박스 이미지 공간 -->
												<div class="col-4">
													<img src="/cbh/resources/img/student/findingclub/categoryimage4.jpg" class="category_image">
												</div>
												<!-- 카테고리 박스 설명 공간  -->
												<div class="col my-2">
													<div class="row">
														<div class="col category_title">사회활동분과</div>
													</div>
													<div class="row">
														<div class="col category_explanation"></div>
													</div>
													<div class="row">
														<div class="col">
															<!-- 여기에 카테고리 파라미터로 넘겨주는 주소 적어야 함. -->
															
															<button class=" button"><a href="#" style="color:white;">자세히보기</a></button>	
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>                 			
									<div class="row category_box mt-2">
										<div class="col my-3">
											<div class="row">
												<!-- 카테고리 박스 이미지 공간 -->
												<div class="col-4">
													<img src="/cbh/resources/img/student/findingclub/categoryimage5.jpg" class="category_image">
												</div>
												<!-- 카테고리 박스 설명 공간  -->
												<div class="col my-2">
													<div class="row">
														<div class="col category_title">창작예술분과</div>
													</div>
													<div class="row">
														<div class="col category_explanation"></div>
													</div>
													<div class="row">
														<div class="col">
															<!-- 여기에 카테고리 파라미터로 넘겨주는 주소 적어야 함. -->
															
															<button class=" button"><a href="#" style="color:white;">자세히보기</a></button>	
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
                  			
									<div class="row category_box mt-2">
										<div class="col my-3">
											<div class="row">
												<!-- 카테고리 박스 이미지 공간 -->
												<div class="col-4">
													<img src="/cbh/resources/img/student/findingclub/categoryimage6.jpg" class="category_image">
												</div>
												<!-- 카테고리 박스 설명 공간  -->
												<div class="col my-2">
													<div class="row">
														<div class="col category_title">학술교양분과</div>
													</div>
													<div class="row">
														<div class="col category_explanation"></div>
													</div>
													<div class="row">
														<div class="col">
															<!-- 여기에 카테고리 파라미터로 넘겨주는 주소 적어야 함. -->
															
															<button class=" button"><a href="#" style="color:white;">자세히보기</a></button>	
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>                 		</div>
						<!-- 세번재 세로단 카테고리 -->
                  		<div class="col">
									<div class="row category_box mt-2">
										<div class="col my-3">
											<div class="row">
												<!-- 카테고리 박스 이미지 공간 -->
												<div class="col-4">
													<img src="/cbh/resources/img/student/findingclub/categoryimage7.jpg" class="category_image">
												</div>
												<!-- 카테고리 박스 설명 공간  -->
												<div class="col my-2">
													<div class="row">
														<div class="col category_title">기타분과</div>
													</div>
													<div class="row">
														<div class="col category_explanation"></div>
													</div>
													<div class="row">
														<div class="col">
															<!-- 여기에 카테고리 파라미터로 넘겨주는 주소 적어야 함. -->
															
															<button class="button"><a href="#" style="color:white;">자세히보기</a></button>	
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>                 		
								</div>
                  	
                  	</div>
                  </div>
                  <div class="col-1">
                  </div>
               </div>
            </div>
         </div>






      </div>
   </div>
   <script type="text/javascript"
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>