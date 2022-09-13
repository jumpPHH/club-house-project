<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript">

		 function doSubmit(){
		 
		  const frmRegister = document.getElementById("frmRegister");
	      const passwordInput = document.getElementById("password");
	      const passwordConfirmInput = document.getElementById("passwordConfirm");
	      
	      if(passwordInput.value != passwordConfirmInput.value){
	          alert("비밀 번호를 확인 해 주세요");
	          passwordInput.value = "";
	          passwordConfirmInput.value = "";
	          
	          passwordInput.focus();
	          return;
	       }
	         
	      frmRegister.submit();
		  
		 }
		 
</script>
</head>
<body>

	<div style="width:1200px; margin: 0 auto">
		<div class="container-fluid">
			
			<div class="row my-5">
				<div class="col"></div>
				
				<div class="col-6">

					<div class="row my-4">
						<h1 class="text-center">행정 직원 계정정보</h1>
					</div>
				
					<form id="frmRegister" action="./staff_SignUpProcess" method="post">
		
					<div class="row my-2"><!-- 아이디 -->
						<div class="col">
							<input id="id" name="staff_id" type="text" class="form-control" placeholder="아이디 입력">
						</div>
					</div>
					
					<div class="row my-2"><!-- 패스워드 -->
						<div class="col">
							<input id="password" type="password" name="staff_pw" class="form-control" placeholder="비밀번호 입력"> 
						</div>					
					</div>
					
					<div class="row my-2"><!-- 패스워드 재확인 -->
						<div class="col">
							<input id="passwordConfirm" type="password" class="form-control" placeholder="비밀번호 다시 입력"> 
						</div>					
					</div>

					<div class="row my-2"><!-- 이름 -->
						<div class="col"> 
							<input type="text" name="staff_name" class="form-control" placeholder="이름 입력"> 
						</div>
						<div id="checkNkckAlert"></div><!-- AJAX -->					
					</div>
				
					<div class="row my-2"><!-- 회원가입 버튼 --> 
						<div class="col d-grid gap-2">
							<input type="button" onclick="doSubmit()" class="btn btn-primary" value="가입하기">
						</div>					
					</div>
					
					<div class="row my-2"><!-- 이전 버튼 --> 
						<div class="col d-grid gap-2">
							<a href="../login/staff_LoginPage" class="btn btn-secondary">이전으로</a>
						</div>					
					</div>
					</form>
				
				</div>
				<div class="col"></div>
			</div>
		</div>
	</div>
	

<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>	
</body>
</html>