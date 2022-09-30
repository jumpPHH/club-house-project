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
           <form action="/cbh/student/signup/student_SignUpProcess" method="post" enctype="multipart/form-data">
            <div class="input-group">
              <input id="id" name="stud_id" style="width:50%; display: flex;" type="text" placeholder="학번 입력">	
            </div>
            
            <div class="input-group" style="display: flex;">         
              <input id="password" style="width:50%;" type="password" name="stud_pw"  placeholder="비밀번호 입력">
              <input id="passwordConfirm" style="width:50%;" type="password"  placeholder="비밀번호 재입력"> 
            </div>
            	
            <div class="input-group" >
              <img style="width:30%; border-radius: 5.2rem;" id="blah" src="https://dummyimage.com/200x200/e6d5ed/000000.png&text=Profile+image">
              <input style="width: 68%; padding: 0.5rem;" type="file" id="imgInp" name="file" accept="image/*" required multiple>
            </div>

            <div class="input-group" style="display: flex;">
              <input id="name" type="text"  style="width:50%;" name="stud_name"  placeholder="이름 입력">
              <input type="text" style="width:50%;" name="stud_phone"  placeholder="010-0000-0000"> 
            </div>
               
            <div class="input-group">
             <input id="email" type="text" name="stud_email"  placeholder="이메일 example@naver.com"> 
            </div>
            
            <h4 style="padding-bottom: 10px;">성별</h4>
            <div  style=" display: flex;    
				    padding: 1rem 3rem;
				    font-size: 1rem;
				    background-color: var(--gray);
				    border-radius: .5rem;
				    border: 0.125rem solid var(--white);
				    outline: none;">
				    
             <h4>남자</h4> <input type="radio"  style="width:30%;" name="stud_gender" id="inlineRadio1" value="남자" checked="checked">
             <h4>여자</h4> <input type="radio"  style="width:30%;" name="stud_gender" id="inlineRadio2" value="여자">
            </div>
            
            <h4 style="padding-top: 10px;">생년월일</h4>
           <div class="input-group">
              <input id="birth" type="date" name="stud_birth" > 
            </div>
            
            <div class="input-group" style="display: flex;">
				<input type="text" style="width:50%;" name="stud_dept" placeholder="학과 입력"> 
				<select 
					style="   
				    padding: 1rem 3rem;
				    font-size: 1rem;
				    background-color: var(--gray);
				    border-radius: .5rem;
				    border: 0.125rem solid var(--white);
				    outline: none;
				    width:50%;" 
					
					name="stud_grade">
					<option selected>학년 선택</option>
					<option value="1">1학년</option>
					<option value="2">2학년</option>
					<option value="3">3학년</option>
			  </select>
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
            <form action="/cbh/student/login/student_LoginProcess" method="get">
            <div class="input-group">
              <i class='bx bxs-user'></i>
              <input type="text" name="stud_id" placeholder="학번 입력">
            </div>
            <div class="input-group">
              <i class='bx bxs-lock-alt'></i>
              <input type="password" name="stud_pw" placeholder="비밀번호 입력">
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
           <span>Student</span> Welcome To <br> Club House 
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
            <span>Student</span> Club House <br> Join with us
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