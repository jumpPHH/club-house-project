<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="/cbh/resources/css/login.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

		
		 /* 회원가입 프로필 미리보기 (제이쿼리) */
		  $(function() {
			    //#imgInp에 on속성에 change매서드 사용 함수 만들꺼임 선언.
			    //파일 업로드 버튼 -> 사진을 고르고 -> readURL(this) 함수 실행
	            $("#imgInp").on('change', function(){
	                readURL(this);
	            });
	        });

	        function readURL(input) {
	            if (input.files && input.files[0]) {
	            var reader = new FileReader();

	            reader.onload = function (e) {
	                    $('#blah').attr('src', e.target.result);
	                }

	              reader.readAsDataURL(input.files[0]);
	            }
	        }
	        

	      
</script>
</head>
<body>

	<div id="container" class="container">
    <!-- FORM SECTION -->
    <div class="row" style="overflow: auto;">
      <!-- SIGN UP -->
      <div class="col align-items-center flex-col sign-up">
        <div class="form-wrapper align-items-center sign-upsize">
          <div class="form sign-up">
           <form action="/cbh/staff/signup/staff_SignUpProcess" method="post" enctype="multipart/form-data">
            <div class="input-group">
              <input id="id" name="staff_id" type="text" class="form-control" placeholder="아이디 입력">	
            </div>
            
            <div class="input-group" style="display: flex;">         
              <input id="password" style="width:50%;" type="password" name="staff_pw"  placeholder="비밀번호 입력">
              <input id="passwordConfirm" style="width:50%;" type="password"  placeholder="비밀번호 재입력"> 
            </div>
            
            <div class="input-group" style="display: flex;">         
             <input type="text" name="staff_name" class="form-control" placeholder="이름 입력"> 
            </div>            
   	 
            <button type="submit">
              가입 하기
            </button>
            </form>
            <p>
              <span>
                로그인 하시겠어요?
              </span>
              <b onclick="toggle()" class="pointer">
                로그인
              </b>
            </p>
          </div>
        </div>
      
      </div>
      <!-- END SIGN UP -->
      <!-- SIGN IN -->
      <div class="col align-items-center flex-col sign-in"> 
        <div class="form-wrapper align-items-center">
          <div class="form sign-in">
            <form action="/cbh/staff/login/staff_LoginProcess" method="get">
            <div class="input-group">
              <i class='bx bxs-user'></i>
              <input type="text" name="staff_id" placeholder="학번 입력">
            </div>
            <div class="input-group">
              <i class='bx bxs-lock-alt'></i>
              <input type="password" name="staff_pw" placeholder="비밀번호 입력">
            </div>
            <button type="submit">
              로그인
            </button>
            <p>
              <span>
                동아리 운영 계정이 없으신가요?
              </span>
              <b onclick="toggle()" class="pointer">
                회원가입
              </b>
            </p>
            </form>
          </div>
        </div> 
        <div class="form-wrapper"></div>
      </div>
        
      <!-- END SIGN IN -->
    </div>
    <!-- END FORM SECTION -->
    <!-- CONTENT SECTION -->
    <div class="row content-row">
      <!-- SIGN IN CONTENT -->
      <div class="col align-items-center flex-col">
        <div class="text sign-in">
          <h2>
           <span>Staff</span> Welcome To <br> Club House 
          </h2>
  
        </div>
        <div class="img sign-in">
    
        </div>
      </div>
      <!-- END SIGN IN CONTENT -->
      <!-- SIGN UP CONTENT -->
      <div class="col align-items-center flex-col">
        <div class="img sign-up">
        
        </div>
        <div class="text sign-up">
          <h2>
            <span>Staff</span> Club House <br> Join with us
          </h2>
  
        </div>
      </div>
      <!-- END SIGN UP CONTENT -->
    </div>
    <!-- END CONTENT SECTION -->
  </div>
	
<script type="text/javascript">
	let container = document.getElementById('container')
	
	toggle = () => {
	  container.classList.toggle('sign-in')
	  container.classList.toggle('sign-up')
	}
	
	setTimeout(() => {
	  container.classList.add('sign-in')
	}, 200)

</script>
</body>
</html>