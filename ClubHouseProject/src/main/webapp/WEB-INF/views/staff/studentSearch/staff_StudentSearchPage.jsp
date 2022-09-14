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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
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

#title{
	font-weight: bold;
	font-size: 3vh;
	color: #bf1f51;
}

</style>
</head>
<body>
<jsp:include page="../../staff_common/staff_header.jsp"></jsp:include>
<jsp:include page="../../staff_common/staff_sidevar.jsp"></jsp:include>

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
				학생정보 ...건이 조회되었습니다
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
							<c:forEach items="${studentList }" var="studentList">
								<tr>
									<td><input onclick="" type="checkbox"  class="form-check-input"></td>
									<td>${studentList.studVo.stud_id }</td>
									<td>${studentList.studVo.stud_name }</td>
									<td>${studentList.studVo.stud_gender }</td>
									<td>${studentList.studVo.stud_dept }</td>
									<td>${studentList.studVo.stud_grade }</td>
									<td>${studentList.studVo.stud_state }</td>
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