<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생조회 페이지</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/cbh/resources/css/staff_MainPage.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<style type="text/css">


#title{
	font-weight: bold;
	font-size: 3vh;
	color: #bf1f51;
}

</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/staff_common/staff_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/staff_common/staff_sidevar.jsp"></jsp:include>

<div style="position: absolute; left: 13.5%; width: 86.5%; top: 14vh; height:86vh;overflow-y: auto; word-break: break-all">
	<div class="container-fluid" style="background-color: aqua">
		<div class="row" >
			<div class="col" id="title">
				학생조회
			</div>
		</div>

		<!-- 버튼 from으로 조회하고 신규삭제 ajax써야할듯-->
		<div class="row" >
			<div class="col-9" style="">
			</div>
			<div class="col" style="">
				<button class="btn btn" type="button">조회</button>
			</div>
			<div class="col" style="">
				<button class="btn btn" type="button">신규</button>
			</div>
			<div class="col" style="">
				<button class="btn btn" type="button">삭제</button>
			</div>
			<div class="col" style="">
				<button class="btn btn" type="button">저장</button>
			</div>
		</div>
		<div class="row">
			<div class="col">
				학번(이름)
			</div>
			<div class="col">
				<input type="text">
			</div>
			<div class="col">
				학적상태
			</div>
			<div class="col">
				<select name="searchType" >
					<option value="attending">재학</option>
					<option value="absence">휴학</option>
					<option value="drop">제적</option>
					<option value="graduate">졸업</option>					
				</select>
			</div>
			<div class="col">
				소속학과
			</div>
			<div class="col">
				<input type="text">
			</div>
		
		</div>
		
		<br>
		<div class="row">
			<div class="col">
				학생정보 건이 조회되었습니다
			</div>
		</div>
		
		<br>
		<!-- 학생정보 -->
			<div class="row">
				<div class="col">
					<table class="table">
						<thead>
							<tr>
								<th scope="col"><input onclick="totalCheck()" type="checkbox" class="form-check-input"></th>
								<th scope="col">학번</th>
								<th scope="col">이름</th>
								<th scope="col">성별</th>
								<th scope="col">소속학과</th>
								<th scope="col">학년</th>
								<th scope="col">학적상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${studentList }" var="list">
								<tr>
									<td><input onclick="" type="checkbox"  class="form-check-input"></td>
									<td>${list.stud_id }</td>
									<td>${list.stud_name }</td>
									<td>${list.stud_gender }</td>
									<td>${list.stud_dept }</td>
									<td>${list.stud_grade }</td>
									<td>${list.stud_state }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

	</div>
</div>

	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>