<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 동아리 메인 페이지</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
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
			<small class="text-uppercase font-weight-bold">MENU</small>
		</button>


		<c:if test="${empty MainData.IsBoss}">
			<c:if test="${empty MainData.IsNormalMember}">
				<div class="card box" style="width: 100%; height: auto;">
					<div class="dashboard-card-bottom">
						<!-- 실제 내용 -->
						<div class="container-fluid"></div>
					</div>
				</div>

			</c:if>
		</c:if>


		<c:if test="${not empty MainData.IsBoss}">
			<div class="row">
				<div class="col-8">
					<div class="card box" style="width: auto; height: 500px;">
						<div class="dashboard-card-bottom">
							<!-- 실제 내용 -->
							<div class="container-fluid">

								<div class="row my-3">
									<span
										style="font-size: 20px; font-weight: bold; text-align: center;">내
										동아리 이미지</span>
								</div>
								<div class="row my-3">

									<img
										style="width: 80%; height: 400px; border-radius: 40px 40px 40px 40px; margin-left: 100px;"
										src="/uploadFiles/ClubHouseProject/student/${MainData.GetClubBossClubInfo.club_title_image }">
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col">

					<div class="card box" style="width: auto; height: 500px;">
						<div class="dashboard-card-bottom">
							<!-- 실제 내용 -->
							<div class="container-fluid">

								<div class="row my-3">
									<span
										style="font-size: 20px; font-weight: bold; text-align: center; padding-bottom: 30px;">내
										동아리 소개</span>
								</div>
								<div class="row my-3">
									<div class="col"
										style="border-right: 2px solid #ededed; text-align: center; font-weight: bolder;">동아리
										이름</div>
									<div class="col"
										style="text-align: center; font-weight: bolder; color: #4065ce;">${MainData.GetClubBossClubInfo.club_name}</div>
								</div>

								<div class="row my-3">
									<div class="col"
										style="border-right: 2px solid #ededed; text-align: center; font-weight: bolder;">설립
										일자</div>
									<div class="col"
										style="text-align: center; font-weight: bolder; color: #4065ce;">
										<fmt:formatDate
											value="${MainData.GetClubBossClubInfo.club_estbl_dt }"
											pattern="yy.MM.dd" />
									</div>
								</div>

								<div class="row my-3">
									<div class="col"
										style="border-right: 2px solid #ededed; text-align: center; font-weight: bolder;">동아리
										회장</div>
									<div class="col"
										style="text-align: center; font-weight: bolder; color: #4065ce;">${MainData.GetClubBoss.stud_name }</div>
								</div>

								<div class="row my-3" style="padding-top: 30px;">
									<div>
										<div class="col card form-check"
											style="width: 100%; height: 230px; font-weight: bolder; background-color: #e6ecff; padding-left: 10px;">
											${MainData.GetClubBossClubInfo.club_description }</div>
									</div>
								</div>


							</div>
						</div>
					</div>

				</div>
			</div>
		</c:if>



		<c:if test="${not empty MainData.IsNormalMember}">
			<div class="row">
				<div class="col-8">
					<div class="card box" style="width: auto; height: 500px;">
						<div class="dashboard-card-bottom">
							<!-- 실제 내용 -->
							<div class="container-fluid">

								<div class="row my-3">
									<span
										style="font-size: 20px; font-weight: bold; text-align: center;">내
										동아리 이미지</span>
								</div>
								<div class="row my-3">

									<img
										style="width: 80%; height: 400px; border-radius: 40px 40px 40px 40px; margin-left: 100px;"
										src="/uploadFiles/ClubHouseProject/student/${MainData.MyClubInfo.club_title_image }">
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col">

					<div class="card box" style="width: auto; height: 500px;">
						<div class="dashboard-card-bottom">
							<!-- 실제 내용 -->
							<div class="container-fluid">

								<div class="row my-3">
									<span
										style="font-size: 20px; font-weight: bold; text-align: center; padding-bottom: 30px;">내
										동아리 소개</span>
								</div>
								<div class="row my-3">
									<div class="col"
										style="border-right: 2px solid #ededed; text-align: center; font-weight: bolder;">동아리
										이름</div>
									<div class="col"
										style="text-align: center; font-weight: bolder; color: #4065ce;">${MainData.MyClubInfo.club_name}</div>
								</div>

								<div class="row my-3">
									<div class="col"
										style="border-right: 2px solid #ededed; text-align: center; font-weight: bolder;">설립
										일자</div>
									<div class="col"
										style="text-align: center; font-weight: bolder; color: #4065ce;">
										<fmt:formatDate value="${MainData.MyClubInfo.club_estbl_dt }"
											pattern="yy.MM.dd" />
									</div>
								</div>

								<div class="row my-3">
									<div class="col"
										style="border-right: 2px solid #ededed; text-align: center; font-weight: bolder;">동아리
										회장</div>
									<div class="col"
										style="text-align: center; font-weight: bolder; color: #4065ce;">${MainData.MyClubBossInfo.stud_name }</div>
								</div>

								<div class="row my-3" style="padding-top: 30px;">
									<div>
										<div class="col card form-check"
											style="width: 100%; height: 230px; font-weight: bolder; background-color: #e6ecff; padding-left: 10px;">
											${MainData.MyClubInfo.club_description }</div>
									</div>
								</div>


							</div>
						</div>
					</div>

				</div>
			</div>
		</c:if>

		<c:if test="${empty MainBoardData}">
			<c:if test="${empty MainActData}">
				<div class="row my-3">
					<div class="col">
						<div class="card box" style="width: auto; height: 500px;">
							<div class="dashboard-card-bottom">
								<!-- 실제 내용 -->
								<div class="container-fluid">
									<div class="row">
										<div class="col-1"></div>
										<div class="col">
											<div class="row my-3">
												<div class="col">
													<div class="row my-2">
														<div class="col">
															<h3>동아리 활동 내역</h3>
														</div>
														<div class="col" style="text-align: right;">
															전체보기<i class="bi bi-arrow-right-circle-fill"
																style="padding-left: 20px; font-size: 20px; color: #428EF4;"></i>
														</div>
													</div>
													<div class="row my-2">
														<table class="table">
															<thead>
																<tr>
																	<th scope="col">#</th>
																	<th scope="col">제목</th>
																	<th scope="col">글쓴이</th>
																	<th scope="col">작성일</th>
																	<th scope="col">조회수</th>
																</tr>
															</thead>
															<tbody>
																<tr>
																	<th scope="row"></th>
																	<td></td>
																	<td></td>
																	<td></td>
																	<td></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>

										</div>
										<div class="col-1"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card box" style="width: auto; height: 500px;">
							<div class="dashboard-card-bottom">
								<!-- 실제 내용 -->
								<div class="container-fluid">
									<div class="row">
										<div class="col-1"></div>
										<div class="col">
											<div class="row my-3">
												<div class="col">
													<div class="row my-2">
														<div class="col">
															<h3>동아리 자유 게시판</h3>
														</div>
														<div class="col" style="text-align: right;">
															전체보기<i class="bi bi-arrow-right-circle-fill"
																style="padding-left: 20px; font-size: 20px; color: #428EF4;"></i>
														</div>

													</div>
												</div>

												<div class="row my-2">
													<table class="table">
														<thead>
															<tr>
																<th scope="col">#</th>
																<th scope="col">제목</th>
																<th scope="col">글쓴이</th>
																<th scope="col">작성일</th>
																<th scope="col">조회수</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<th scope="row"></th>
																<td></td>
																<td></td>
																<td></td>
																<td></td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>

										</div>
										<div class="col-1"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:if>
		</c:if>

		<c:if test="${not empty MainBoardData}">
			<c:if test="${not empty MainActData}">
				<div class="row my-3">
					<div class="col">
						<div class="card box" style="width: auto; height: 500px;">
							<div class="dashboard-card-bottom">
								<!-- 실제 내용 -->
								<div class="container-fluid">
									<div class="row">
										<div class="col-1"></div>
										<div class="col">
											<div class="row my-3">
												<div class="col">
													<div class="row my-4">
														<div class="col">
															<h3>동아리 활동 내역</h3>
														</div>
														<div class="col" style="text-align: right;">
															전체보기<i class="bi bi-arrow-right-circle-fill"
																style="padding-left: 20px; font-size: 20px; color: #428EF4;"></i>
														</div>

													</div>

													<div class="row my-2">

														<table class="table">
															<thead>
																<tr>
																	<th scope="col">#</th>
																	<th scope="col">제목</th>
																	<th scope="col">글쓴이</th>
																	<th scope="col">작성일</th>
																	<th scope="col">조회수</th>
																</tr>
															</thead>

															<c:forEach items="${MainActData}" begin="0" end="4"
																var="MainActData">
																<tbody>
																	<tr>
																		<th scope="row">${MainActData.Club_ActVoList.club_act_no }</th>
																		<td style="text-overflow: ellipsis;">${MainActData.Club_ActVoList.club_act_title }</td>
																		<td>${MainActData.Club_ActStudVoList.stud_name }</td>
																		<td><fmt:formatDate
																				value="${MainActData.Club_ActVoList.club_act_date }"
																				pattern="yy.MM.dd" /></td>
																		<td>${MainActData.Club_ActVoList.club_readcount }</td>
																	</tr>
																</tbody>
															</c:forEach>

														</table>


													</div>
												</div>
											</div>


										</div>
										<div class="col-1"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card box" style="width: auto; height: 500px;">
							<div class="dashboard-card-bottom">
								<!-- 실제 내용 -->
								<div class="container-fluid">
									<div class="row">
										<div class="col-1"></div>
										<div class="col">
											<div class="row my-3">
												<div class="col">
													<div class="row my-4">
														<div class="col">
															<h3>동아리 자유 게시판</h3>
														</div>
														<div class="col" style="text-align: right;">
															전체보기<i class="bi bi-arrow-right-circle-fill"
																style="padding-left: 20px; font-size: 20px; color: #428EF4;"></i>
														</div>
												</div>

												<div class="row my-2">
													<table class="table">
														<thead>
															<tr>
																<th scope="col">#</th>
																<th scope="col">제목</th>
																<th scope="col">글쓴이</th>
																<th scope="col">작성일</th>
																<th scope="col">조회수</th>
															</tr>
														</thead>

														<c:forEach items="${MainBoardData}" begin="0" end="4"
															var="MainBoardData">
															<tbody>
																<tr>
																	<th scope="row">${MainBoardData.Club_BoardVoList.club_board_no }</th>
																	<td style="text-overflow: ellipsis;">${MainBoardData.Club_BoardVoList.club_board_title }</td>
																	<td>${MainBoardData.Club_BoardStudVoList.stud_name}</td>
																	<td><fmt:formatDate
																			value="${MainBoardData.Club_BoardVoList.club_board_writedate }"
																			pattern="yy.MM.dd" /></td>
																	<td>${MainBoardData.Club_BoardVoList.club_board_readcount }</td>
																</tr>
															</tbody>
														</c:forEach>
													</table>
												</div>
											</div>

										</div>
										<div class="col-1"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:if>
		</c:if>

		<script type="text/javascript"
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>