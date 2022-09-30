<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동아리 활동내역</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
	
<link rel="stylesheet" href="/cbh/resources/css/student_MainPage.css">
	
</head>
<body>
<jsp:include page="../../student_common/student_header.jsp"></jsp:include>
<jsp:include page="../../student_common/student_sidevar.jsp"></jsp:include>

<div style="position: absolute; left: 13.5%; width: 86.5%; top: 14vh; height:86vh;overflow-y: auto">
	<div class="container-fluid" style="background-color: white">
		<div class="row">
			<div class="col-1"></div>
			<div class="col">
			
				
				<!-- 여기다 작성하세요 -->
		<div class="row"
			style="font-size: 20px; font-weight: bold; margin-top: 30px; padding-top: 10px; padding-bottom: 10px; border-bottom: 2px solid">
			<div class="col">동아리 활동내역</div>
		</div>





		<div class="row" style="padding-top: 10px; padding-bottom: 10px;">
			<form action="./student_MyClubActivityWritePageProcess" method="post">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					
					
		<tr>
			<td><input type="text" class="form-control" placeholder="글 제목" name="club_act_title"></td>
			
		</tr>

		<tr>
			<td><textarea class="form-control" placeholder="글 내용" name="club_act_content" style="height: 350px;"></textarea></td>
		</tr>
					
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기">	
				<a href="./student_MyClubActivityListPage" type="submit" class="btn btn-danger pull-right">취소</a>
			</form>
		</div>


					
				<!-- 여기다 작성하세요 -->
				
			</div>
			<div class="col-1"></div>
		</div>
	</div>
</div>

	
	
	
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>