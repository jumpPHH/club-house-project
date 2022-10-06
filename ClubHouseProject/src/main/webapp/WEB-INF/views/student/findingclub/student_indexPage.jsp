<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=divice-width, intial-scale=1.0"
	charset="UTF-8">
<title>학생메인 페이지</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

<style type="text/css">
.title_image {
	
}

.category_box {
	display: inline-block;
	border: 2px solid #EAEAEA;
	width: 22em;
	height: 15em;
	border-radius: 5px;
	margin: 2em 0 2em 1em;
}

.category_image {
	width: 10em;
	height: 13em;
	opacity: 0.85;
}

.category_box_title {
	font-weight: bold;
	font-size: 1.1em;
}

.category_box_content {
	font-size: 0.8em;
	color: gray;
	height: 4.7rem;
}

.page_title {
	font-weight: bold;
	font-size: 1.4em;
}
</style>

</head>
<body>

	<jsp:include
		page="/WEB-INF/views/student_common/student_navigationvar.jsp"></jsp:include>
<head>
<style>
</style>
</head>
<!-- 페이지 내용 부분 시작 (이 부분만 카피해서 사용할것. 카피 후 삭제) -->
<div class="page-content p-5" id="content">
	<!-- 토글 버튼 -->
	<button id="sidebarCollapse" type="button"
		class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4">
		<i class="fa fa-bars mr-2"></i><small
			class="text-uppercase font-weight-bold"
			style="box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075) !important;">Toggle</small>
	</button>

	<div class="card"
		style="width: 100%; height: auto; border-radius: 2%; box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075) !important; padding: 0px 15px;">
		<div class="dashboard-card-bottom">
			<!-- 실제 내용 -->

			<!-- 카테고리 박스 -->
			<div class="container-fluid">
				<div class="row">

					<!-- 컨텐트 박스 -->
					<div class="col pe-0">
						<!-- 컨텐트 부분 -->
						<div class="row">
							<div class="col" id="content">
								<!-- 컨텐트 헤더 -->
								<div class="row">
									<div class="col" style="margin-top: 0.8em">
										<i class="fa bi bi-search mr-3 text-primary fa-fw"
											style="width: 2em; height: 1.2em"></i>&nbsp <span
											class="page_title">동아리 찾기</span>
									</div>
								</div>

								<!-- 켄텐트 of 컨텐트 -->
								<div class="row mt-2">
									<!-- 첫번째 세로 카테고리 -->
									<div class="col" style="margin-left: 8px">
										<!-- 카테고리 박스 -->
										<div class="row category_box mt-2">
											<div class="col my-3">
												<div class="row">
													<!-- 카테고리 박스 이미지 공간 -->
													<div class="col-4">
														<img
															src="/cbh/resources/img/student/findingclub/clubcategory1.jpeg"
															class="category_image">
													</div>
													<!-- 카테고리 박스 설명 공간  -->
													<div class="col my-2">
														<div class="row">
															<div class="col-4"></div>
															<div class="col category_box_title">공연예술분과</div>
														</div>
														<div class="row pt-4">
															<div class="col-4"></div>
															<div class="col category_box_content"
																style="color: #919191">교양의 세계에 들어와보고 싶다면 동아리로 가볍게!</div>
														</div>
														<div class="row mt-4">
															<div class="col-4"></div>
															<div class="col">
																<!-- 여기에 카테고리 파라미터로 넘겨주는 주소 적어야 함. -->
																<button class="btn btn-primary">
																	<a
																		href="./student_clubsOfCategoryPage?club_category_no=1"
																		style="color: white;">자세히보기</a>
																</button>
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
														<img
															src="/cbh/resources/img/student/findingclub/categoryimage2.jpg"
															class="category_image">
													</div>
													<!-- 카테고리 박스 설명 공간  -->
													<div class="col my-2">
														<div class="row">
															<div class="col-4"></div>
															<div class="col category_box_title">종교분과</div>
														</div>
														<div class="row pt-4">
															<div class="col-4"></div>
															<div class="col category_box_content"
																style="color: #919191"></div>
														</div>
														<div class="row mt-4">
															<div class="col-4"></div>
															<div class="col">
																<!-- 여기에 카테고리 파라미터로 넘겨주는 주소 적어야 함. -->

																<button class="btn btn-primary">
																	<a
																		href="./student_clubsOfCategoryPage?club_category_no=2"
																		style="color: white;">자세히보기</a>
																</button>
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
														<img
															src="/cbh/resources/img/student/findingclub/categoryimage3.jpg"
															class="category_image">
													</div>
													<!-- 카테고리 박스 설명 공간  -->
													<div class="col my-2">
														<div class="row">
															<div class="col-4"></div>
															<div class="col category_box_title">체육분과</div>
														</div>
														<div class="row pt-4">
															<div class="col-4"></div>
															<div class="col category_box_content"
																style="color: #919191">건강한 생활을 위해 운동은 필수!</div>
														</div>
														<div class="row mt-4">
															<div class="col-4"></div>
															<div class="col">
																<!-- 여기에 카테고리 파라미터로 넘겨주는 주소 적어야 함. -->

																<button class="btn btn-primary">
																	<a
																		href="./student_clubsOfCategoryPage?club_category_no=3"
																		style="color: white;">자세히보기</a>
																</button>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>

									<!-- 두번째 세로단 카테고리 -->
									<div class="col">
										<div class="row category_box mt-2">
											<div class="col my-3">
												<div class="row">
													<!-- 카테고리 박스 이미지 공간 -->
													<div class="col-4">
														<img
															src="/cbh/resources/img/student/findingclub/categoryimage4.jpg"
															class="category_image">
													</div>
													<!-- 카테고리 박스 설명 공간  -->
													<div class="col my-2">
														<div class="row">
															<div class="col-4"></div>
															<div class="col category_box_title">사회활동분과</div>
														</div>
														<div class="row pt-4">
															<div class="col-4"></div>
															<div class="col category_box_content"
																style="color: #919191">사회에 관심이 많고 사회발전에 기여하고 싶은
																사람들을 위한</div>
														</div>
														<div class="row mt-4">
															<div class="col-4"></div>
															<div class="col">
																<!-- 여기에 카테고리 파라미터로 넘겨주는 주소 적어야 함. -->

																<button class="btn btn-primary">
																	<a
																		href="./student_clubsOfCategoryPage?club_category_no=4"
																		style="color: white;">자세히보기</a>
																</button>
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
														<img
															src="/cbh/resources/img/student/findingclub/categoryimage5.jpg"
															class="category_image">
													</div>
													<!-- 카테고리 박스 설명 공간  -->
													<div class="col my-2">
														<div class="row">
															<div class="col-4"></div>
															<div class="col category_box_title">창작예술분과</div>
														</div>
														<div class="row pt-4">
															<div class="col-4"></div>
															<div class="col category_box_content"
																style="color: #919191">나의 상상력을 마음껏 표현할 수 있는</div>
														</div>
														<div class="row mt-4">
															<div class="col-4"></div>
															<div class="col">
																<!-- 여기에 카테고리 파라미터로 넘겨주는 주소 적어야 함. -->

																<button class="btn btn-primary">
																	<a
																		href="./student_clubsOfCategoryPage?club_category_no=5"
																		style="color: white;">자세히보기</a>
																</button>
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
														<img
															src="/cbh/resources/img/student/findingclub/categoryimage6.jpg"
															class="category_image">
													</div>
													<!-- 카테고리 박스 설명 공간  -->
													<div class="col my-2">
														<div class="row">
															<div class="col-4"></div>
															<div class="col category_box_title">학술교양분과</div>
														</div>
														<div class="row pt-4">
															<div class="col-4"></div>
															<div class="col category_box_content"
																style="color: #919191">학술적 관심이 많은 사람들을 위한</div>
														</div>
														<div class="row mt-4">
															<div class="col-4"></div>
															<div class="col">
																<!-- 여기에 카테고리 파라미터로 넘겨주는 주소 적어야 함. -->

																<button class="btn btn-primary">
																	<a
																		href="./student_clubsOfCategoryPage?club_category_no=6"
																		style="color: white;">자세히보기</a>
																</button>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- 세번재 세로단 카테고리 -->
									<div class="col">
										<div class="row category_box mt-2">
											<div class="col my-3">
												<div class="row">
													<!-- 카테고리 박스 이미지 공간 -->
													<div class="col-4">
														<img
															src="/cbh/resources/img/student/findingclub/categoryimage7.jpg"
															class="category_image">
													</div>
													<!-- 카테고리 박스 설명 공간  -->
													<div class="col my-2">
														<div class="row">
															<div class="col-4"></div>
															<div class="col category_box_title">기타분과</div>
														</div>
														<div class="row pt-4">
															<div class="col-4"></div>
															<div class="col category_box_content"
																style="color: #919191"></div>
														</div>
														<div class="row mt-4">
															<div class="col-4"></div>
															<div class="col">
																<!-- 여기에 카테고리 파라미터로 넘겨주는 주소 적어야 함. -->

																<button class="btn btn-primary">
																	<a	href="./student_clubsOfCategoryPage?club_category_no=7"
																		style="color: white;">자세히보기</a>
																</button>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>
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