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
<link rel="stylesheet" href="/cbh/resources/css/student_MainPage.css">

</head>
<body>
	<jsp:include page="/WEB-INF/views/student_common/student_header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/student_common/student_sidevar.jsp"></jsp:include>

	<div
		style="position: absolute; left: 13.5%; width: 86.5%; top: 14vh; height: 86vh; overflow-y: auto; word-break: break-all;">
		<div class="container-fluid">

			<c:if test="${empty MyClubMainData.IsBoss}">
				<c:if test="${empty MyClubMainData.IsNormalMember}">

					<div class="row">
						<div class="col-4">
							<div class="row my-5">
								<div class="col">
									<i class="bi bi-people-fill"
										style="font-size: 40px; color: #EF1B3F;"></i> <span
										style="font-size: 30px;">내 동아리</span>
								</div>
							</div>

							<div class="row  my-3">
								<div class="col">동아리 이름</div>
								<div class="col-1">|</div>
								<div class="col">없음</div>
							</div>

							<div class="row my-3">
								<div class="col">설립 일자</div>
								<div class="col-1">|</div>
								<div class="col">없음</div>
							</div>

							<div class="row my-3">
								<div class="col">동아리 회장</div>
								<div class="col-1">|</div>
								<div class="col">없음</div>
							</div>
						</div>

						<div class="col">
							<div class="row my-5">
								<img style="width: 100%; height: 400px;"
									src="../../resources/img/student/myclubmain/IsMember.png">
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col">
							<div class="row my-2">
								<h3>동아리 소개</h3>
							</div>
						</div>
					</div>

					<div class="row my-2">
						<div>
							<div class="col card form-check"
								style="width: 100%; height: 10rem; border: 1px solid black; background-color: #f0f8ff; padding-left: 10px;">
								내용 없음.</div>
						</div>
					</div>
				</c:if>
			</c:if>


			<c:if test="${not empty MyClubMainData.IsBoss}">
				<div class="row">
					<div class="col-4">
						<div class="row my-5">
							<div class="col">
								<i class="bi bi-people-fill"
									style="font-size: 40px; color: #EF1B3F;"></i> <span
									style="font-size: 30px;">내 동아리</span>
							</div>
						</div>

						<div class="row  my-3">
							<div class="col">동아리 이름</div>
							<div class="col-1">|</div>
							<div class="col">${MyClubMainData.GetClubBossClubInfo.club_name}</div>
						</div>

						<div class="row my-3">
							<div class="col">설립 일자</div>
							<div class="col-1">|</div>
							<div class="col">
								<fmt:formatDate
									value="${MyClubMainData.GetClubBossClubInfo.club_estbl_dt }"
									pattern="yy.MM.dd" />
							</div>
						</div>

						<div class="row my-3">
							<div class="col">동아리 회장</div>
							<div class="col-1">|</div>
							<div class="col">${MyClubMainData.GetClubBoss.stud_name }</div>
						</div>
					</div>

					<div class="col">
						<div class="row my-5">
							<img
								src="/uploadFiles/ClubHouseProject/student/${MyClubMainData.GetClubBossClubInfo.club_title_image }">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col">
						<div class="row my-2">
							<h3>동아리 소개</h3>
						</div>
					</div>
				</div>

				<div class="row my-2">
					<div>
						<div class="col card form-check"
							style="width: 100%; height: 10rem; border: 1px solid black; background-color: #f0f8ff; padding-left: 10px;">
							${MyClubMainData.GetClubBossClubInfo.club_description }</div>
					</div>
				</div>
			</c:if>

			<c:if test="${not empty MyClubMainData.IsNormalMember}">

				<div class="row">
					<div class="col-4">
						<div class="row my-5">
							<div class="col">
								<i class="bi bi-people-fill"
									style="font-size: 40px; color: #EF1B3F;"></i> <span
									style="font-size: 30px;">내 동아리</span>
							</div>
						</div>

						<div class="row  my-3">
							<div class="col">동아리 이름</div>
							<div class="col-1">|</div>
							<div class="col">${MyClubMainData.MyClubInfo.club_name}</div>
						</div>

						<div class="row my-3">
							<div class="col">설립 일자</div>
							<div class="col-1">|</div>
							<div class="col">
								<fmt:formatDate
									value="${MyClubMainData.MyClubInfo.club_estbl_dt }"
									pattern="yy.MM.dd" />
							</div>
						</div>

						<div class="row my-3">
							<div class="col">동아리 회장</div>
							<div class="col-1">|</div>
							<div class="col">${MyClubMainData.MyClubBossInfo.stud_name }</div>
						</div>
					</div>

					<div class="col">
						<div class="row my-5">
							<img
								src="/uploadFiles/ClubHouseProject/student/${MyClubMainData.MyClubInfo.club_title_image }">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col">
						<div class="row my-2">
							<h3>동아리 소개</h3>
						</div>
					</div>
				</div>

				<div class="row my-2">
					<div>
						<div class="col card form-check"
							style="width: 100%; height: 10rem; border: 1px solid black; background-color: #f0f8ff; padding-left: 10px;">
							${MyClubMainData.MyClubInfo.club_description }</div>
					</div>
				</div>
			</c:if>


			<div class="row">
				<div id="calendar">
					<div class="row my-3">
						<div class="col"></div>
						<div class="col-3" style="text-align: center;">
							<h3>8월</h3>
						</div>
						<div class="col" style="text-align: right;">
							<span>전체보기<i class="bi bi-arrow-right-circle-fill"
								style="padding-left: 20px; font-size: 20px; color: #428EF4;"></i></span>
						</div>
					</div>

					<div class="row" style="background-color: #dcdcdc;">
						<div class="col"
							style="border: 2px solid #c8c8c8; width: 50px; height: 120px;">25일</div>
						<div class="col"
							style="border: 2px solid #c8c8c8; width: 50px; height: 120px;">26일</div>
						<div class="col"
							style="border: 2px solid #c8c8c8; width: 50px; height: 120px;">27일</div>
						<div class="col"
							style="border: 2px solid #c8c8c8; width: 50px; height: 120px;">28일</div>
						<div class="col"
							style="border: 2px solid #c8c8c8; width: 50px; height: 120px;">29일</div>
						<div class="col"
							style="border: 2px solid #c8c8c8; width: 50px; height: 120px;">30일</div>
						<div class="col"
							style="border: 2px solid #c8c8c8; width: 50px; height: 120px;">31일</div>
					</div>
				</div>
			</div>

			<c:if test="${empty MyClubMainBoardData}">
				<c:if test="${empty MyClubMainActData}">
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
				</c:if>
			</c:if>

			<c:if test="${not empty MyClubMainBoardData}">
				<c:if test="${not empty MyClubMainActData}">
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

									<c:forEach items="${MyClubMainActData}" begin="0" end="4"
										var="MyClubMainActData">
										<tbody>
											<tr>
												<th scope="row">${MyClubMainActData.Club_ActVoList.club_act_no }</th>
												<td>${MyClubMainActData.Club_ActVoList.club_act_title }</td>
												<td>${MyClubMainActData.Club_ActStudVoList.stud_name }</td>
												<td><fmt:formatDate
														value="${MyClubMainActData.Club_ActVoList.club_act_date }"
														pattern="yy.MM.dd" /></td>
												<td>${MyClubMainActData.Club_ActVoList.club_readcount }</td>
											</tr>
										</tbody>
									</c:forEach>

								</table>


							</div>
						</div>
					</div>

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

								<c:forEach items="${MyClubMainBoardData}" begin="0" end="4"
									var="MyClubMainBoardData">
									<tbody>
										<tr>
											<th scope="row">${MyClubMainBoardData.Club_BoardVoList.club_board_no }</th>
											<td>${MyClubMainBoardData.Club_BoardVoList.club_board_title }</td>
											<td>${MyClubMainBoardData.Club_BoardStudVoList.stud_name}</td>
											<td><fmt:formatDate
													value="${MyClubMainBoardData.Club_BoardVoList.club_board_writedate }"
													pattern="yy.MM.dd" /></td>
											<td>${MyClubMainBoardData.Club_BoardVoList.club_board_readcount }</td>
										</tr>
									</tbody>
								</c:forEach>
							</table>
						</div>
					</div>
				</c:if>
			</c:if>
		</div>
	</div>

	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>