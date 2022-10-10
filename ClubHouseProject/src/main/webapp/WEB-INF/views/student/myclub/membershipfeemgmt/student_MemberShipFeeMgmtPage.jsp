<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회비 관리 페이지</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<style type="text/css">
.title01 {
	border-right: 1px solid gray;
	border-left: 1px solid gray;
	background-color: #EBEBEB;
	padding: 20px;
	font-weight: bold;
	text-align: center;
}

.title01-right {
	border-right: 1px solid gray;
	background-color: #EBEBEB;
	padding: 20px;
	font-weight: bold;
	text-align: center;
}

.blank01 {
	background-color: #F7F7F7;
	font-weight: bold;
	padding: 20px;
	text-align: center;
}

.title02 {
	border-right: 1px solid gray;
	background-color: #EBEBEB;
	padding: 10px;
	font-weight: bold;
	text-align: center;
}

.title02-right {
	border-right: 1px solid gray;
	background-color: #EBEBEB;
	padding: 10px;
	font-weight: bold;
	text-align: center;
}

.title02-non {
	background-color: #EBEBEB;
	padding: 10px;
	font-weight: bold;
	text-align: center;
}

.blank02 {
	border-right: 1px solid gray;
	background-color: white;
	font-weight: bold;
	padding: 10px;
	text-align: center;
}

.blank02-non {
	background-color: white;
	font-weight: bold;
	padding: 10px;
	text-align: center;
}

.buttonClick {
	padding-left: 30px;
	padding-right: 30px;
	font-size: 15px;
	font-weight: bold;
}

.selectDiv {
	background-color: #bfc9e3;
	color: white !important;
	text-decoration: underline;
	padding-left: 0px;
	padding-right: 0px;
	width: 50%;
}

.aClick {
	display: inline-block;
	color: #03c;
	-webkit-transition: 0.5s;
	-moz-transition: 0.5s;
	-o-transition: 0.5s;
	-ms-transition: 0.5s;
	transition: 0.5s;
}

.aClick:hover {
	-webkit-transform: scale(1.15, 1.15);
	-moz-transform: scale(1.15, 1.15);
	-o-transform: scale(1.15, 1.15);
	-ms-transform: scale(1.15, 1.15);
	transform: scale(1.15, 1.15);
}
</style>

<script type="text/javascript">

var data = new Array();
var club_no = ${ClubBossAndAccountingMemberIs.club_no};
var club_stud_no = ${ClubBossAndAccountingMemberIs.club_stud_no};

function save() {
	
	Swal.fire({
	      title:'저장 하시겠습니까?',																		      
	      icon: 'question',
	      showCancelButton: true,
	      confirmButtonColor: '#3085d6',
	      cancelButtonColor: '#d33',
	      confirmButtonText: '저장',
	      cancelButtonText: '취소',
	      reverseButtons: true, // 버튼 순서 거꾸로
	      
	    }).then((result) => {
	      if (result.isConfirmed) {
	    	  
    		var count = document.getElementsByClassName("rowBox").length;
    		var TABLE = $("#TABLE").val();
    		
    		for(let i = 0 ; i < count ; i++){
    			
    			var CLUB_STUD_NO = club_stud_no;
    			var CLUB_NO = club_no;
    			var CLUB_FEE_USE_DATE = $(".rowBox").children(".dateCheck").children(".CLUB_FEE_USE_DATE:eq("+i+")").val();
    			var CLUB_FEE_DIVISION = $(".rowBox").children(".divisionCheck").children(".CLUB_FEE_DIVISION:eq("+i+")").val();
    			var CLUB_FEE_DETAIL = $(".rowBox").children(".detailCheck").children(".CLUB_FEE_DETAIL:eq("+i+")").val();
    			var CLUB_FEE_INCOME_AMOUNT = $(".rowBox").children(".incomeAmountCheck").children(".CLUB_FEE_INCOME_AMOUNT:eq("+i+")").val();
    			var CLUB_FEE_USING_AMOUNT = $(".rowBox").children(".usingAmountCheck").children(".CLUB_FEE_USING_AMOUNT:eq("+i+")").val();
    			var CLUB_FEE_OTHER_DETAIL = $(".rowBox").children(".otherDetailCheck").children(".CLUB_FEE_OTHER_DETAIL:eq("+i+")").val();
    			var CLUB_FEE_BALANCE = CLUB_FEE_INCOME_AMOUNT - CLUB_FEE_USING_AMOUNT;
    			
    	 		var jsonObj = {
    				"TABLE" : TABLE,
    				"DIV": "저장",
    				"CLUB_STUD_NO":CLUB_STUD_NO,
    				"CLUB_NO":CLUB_NO,
    				"CLUB_FEE_DIVISION":CLUB_FEE_DIVISION,
    				"CLUB_FEE_INCOME_AMOUNT":CLUB_FEE_INCOME_AMOUNT,
    				"CLUB_FEE_USING_AMOUNT":CLUB_FEE_USING_AMOUNT,
    				"CLUB_FEE_BALANCE":CLUB_FEE_BALANCE,
    				"CLUB_FEE_DETAIL":CLUB_FEE_DETAIL,
    				"CLUB_FEE_OTHER_DETAIL":CLUB_FEE_OTHER_DETAIL,
    				"CLUB_FEE_USE_DATE":CLUB_FEE_USE_DATE,
    			}
    			data.push(jsonObj) 
    		}
	    		
    		var data2 = JSON.stringify(data);
    		
    		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
    			 xhr.onreadystatechange = function () {
    		if(xhr.readyState == 4 && xhr.status == 200){
    	    var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)

    			}      
    		}
    		
			xhr.open("post","/cbh/student/myclub/membershipfeemgmt/student_MemberShipFeeMgmtRegistration",false);
			xhr.setRequestHeader("Content-type","application/json");
			xhr.send(data2); 
			
			window.location.href = '/cbh/student/myclub/membershipfeemgmt/student_MemberShipFeeMgmtListPage';

	      }
			
	    })
}

function plusCode(){
	var TABLE = $("#TABLE").val();
	var memberShipFeeMgmtBody = $('#memberShipFeeMgmtBody')[0];

	var rowBox = document.createElement("div");
	rowBox.classList.add("row");
	rowBox.classList.add("rowBox");
	rowBox.setAttribute("style","border: 1px solid black; border-top: 0px;");
	memberShipFeeMgmtBody.appendChild(rowBox);
	
	var col1NoBox = document.createElement("div");
	col1NoBox.classList.add("col-1");
	col1NoBox.classList.add("blank02");
	col1NoBox.classList.add("boxCheck");
	rowBox.appendChild(col1NoBox);
	
	var col1CheckBox = document.createElement("input");
	col1CheckBox.classList.add("form-check-input");
	col1CheckBox.setAttribute("type","checkbox");
	col1CheckBox.setAttribute("name","boxCheck");
	col1NoBox.appendChild(col1CheckBox);
	
	var col2DateBox = document.createElement("div");
	col2DateBox.classList.add("col-2");
	col2DateBox.classList.add("blank02");
	col2DateBox.classList.add("dateCheck");
	col2DateBox.setAttribute("style","padding-top: 15px;");
	rowBox.appendChild(col2DateBox);
	
	var dateInput = document.createElement("input");
	dateInput.classList.add("CLUB_FEE_USE_DATE");
	dateInput.setAttribute("type","date");
	dateInput.setAttribute("style","font-size: 13px;");
	col2DateBox.appendChild(dateInput);
	
	var col1DivisionBox = document.createElement("div");
	col1DivisionBox.classList.add("col-1");
	col1DivisionBox.classList.add("blank02");
	col1DivisionBox.classList.add("divisionCheck");
	col1DivisionBox.setAttribute("style","padding-top: 15px;");
	rowBox.appendChild(col1DivisionBox);
	
	var divisionSelect = document.createElement("select");
	divisionSelect.classList.add("form-select");
	divisionSelect.classList.add("CLUB_FEE_DIVISION");
	divisionSelect.setAttribute("aria-label","Default select example");
	divisionSelect.setAttribute("style","font-size: 10px;");
	col1DivisionBox.appendChild(divisionSelect);
	
	var optionSeleted = document.createElement("option");
	optionSeleted.setAttribute("selected","selected");
	optionSeleted.innerText = "구분";
	divisionSelect.appendChild(optionSeleted);
	
	var option1= document.createElement("option");
	option1.setAttribute("value","경조사비");
	option1.innerText="경조사비";
	divisionSelect.appendChild(option1);
	
	var option2= document.createElement("option");
	option2.setAttribute("value","회식비");
	option2.innerText="회식비";
	divisionSelect.appendChild(option2);
	
	var option3= document.createElement("option");
	option3.setAttribute("value","회비");
	option3.innerText="회비";
	divisionSelect.appendChild(option3);
	
	var option4= document.createElement("option");
	option4.setAttribute("value","가입비");
	option4.innerText="가입비";
	divisionSelect.appendChild(option4);

	var col3DetailBox = document.createElement("div");
	col3DetailBox.classList.add("col-3");
	col3DetailBox.classList.add("blank02");
	col3DetailBox.classList.add("detailCheck");
	rowBox.appendChild(col3DetailBox);
	
	var detailInput = document.createElement("input");
	detailInput.setAttribute("type","text");
	detailInput.classList.add("form-control");
	detailInput.classList.add("CLUB_FEE_DETAIL");
	col3DetailBox.appendChild(detailInput);
	
	var col1IncomeAmountBox = document.createElement("div");
	col1IncomeAmountBox.classList.add("col-1");
	col1IncomeAmountBox.classList.add("blank02");
	col1IncomeAmountBox.classList.add("incomeAmountCheck");
	rowBox.appendChild(col1IncomeAmountBox);
	
	var incomeAmountInput = document.createElement("input");
	incomeAmountInput.setAttribute("type","text");
	incomeAmountInput.classList.add("form-control");
	incomeAmountInput.classList.add("CLUB_FEE_INCOME_AMOUNT");
	col1IncomeAmountBox.appendChild(incomeAmountInput);
	
	var col1UsingAmountBox = document.createElement("div");
	col1UsingAmountBox.classList.add("col-1");
	col1UsingAmountBox.classList.add("blank02");
	col1UsingAmountBox.classList.add("usingAmountCheck");
	rowBox.appendChild(col1UsingAmountBox);
	
	var usingAmountInput = document.createElement("input");
	usingAmountInput.setAttribute("type","text");
	usingAmountInput.classList.add("form-control");
	usingAmountInput.classList.add("CLUB_FEE_USING_AMOUNT");
	col1UsingAmountBox.appendChild(usingAmountInput);
	
	var colOtherDetailBox = document.createElement("div");
	colOtherDetailBox.classList.add("col");
	colOtherDetailBox.classList.add("blank02-non");
	colOtherDetailBox.classList.add("otherDetailCheck");
	rowBox.appendChild(colOtherDetailBox);
	
	var otherDetailInput = document.createElement("input");
	otherDetailInput.setAttribute("type","text");
	otherDetailInput.classList.add("form-control");
	otherDetailInput.classList.add("CLUB_FEE_OTHER_DETAIL");
	colOtherDetailBox.appendChild(otherDetailInput);
}

function deleteRow() {
	    // 체크한 데이터를 담을 배열 선언
	    const arr = [];
	    // Name이 boxCheck인 속성 취득
	    const boxCheck = document.getElementsByName("boxCheck");
	    // 취득한 속성 만큼 루프
	    for (let i = 0; i < boxCheck.length; i++) {
	      // 속성중에 체크 된 항목이 있을 경우
	      if (boxCheck[i].checked == true) {
	      	arr.push(boxCheck[i].value);
	      	
	      	$(".rowBox")[i].remove();
	      }
	    }
	}
	
document.addEventListener("DOMContentLoaded", function () {
	
	var nowPage = "${pageContext.request.requestURI}".split('/')["${pageContext.request.requestURI}".split('/').length-1];

	var url1 = document.getElementById("student_MemberShipFeeMgmtPage");
	var url2 = document.getElementById("student_MemberShipFeeMgmtListPage");
		
		if((url1.getAttribute("href").split('/'))[5]+".jsp" == nowPage){
			$("#student_MemberShipFeeMgmtPage").attr('class','selectDiv');
		
		}else if ((url2.getAttribute("href").split('/'))[5]+".jsp" == nowPage) {
			$("#student_MemberShipFeeMgmtListPage").attr('class','selectDiv');
		}
});
</script>
</head>
<body>
	<jsp:include
		page="/WEB-INF/views/student_common/student_navigationvar.jsp"></jsp:include>
	<!-- 페이지 내용 부분 시작 (이 부분만 카피해서 사용할것. 카피 후 삭제) -->
	<div class="page-content p-5" id="content">
		<!-- 토글 버튼 -->
		<button id="sidebarCollapse" type="button"
			class="btn btn-light bg-white rounded-pill box px-4 mb-4">
			<small class="text-uppercase font-weight-bold">MENU</small>
		</button>

		<c:if test="${empty ClubBossAndAccountingMemberIs }">
			<link
				href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
				rel="stylesheet">
			<link rel="stylesheet" href="/cbh/resources/css/status.css">
			<div class="row my-5"
				style="width: 100%; height: 100%; padding-top: 100px;">
				<div class="col-1"></div>
				<div class="col">
					<div class="page-404">
						<div class="outer">
							<div class="middle">
								<div class="inner">
									<!--BEGIN CONTENT-->
									<a href="/cbh/student/myclub/main/student_MainPage" style="text-decoration: none;" class="inner-circle"><i
										class="fa fa-home"></i><span> 권한제한</span></a> <span
										class="inner-status">페이지 권한이 없습니다.</span> <span
										class="inner-detail"> 접속을 원하시면 권한을 부여받으십시요. </span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-1"></div>
			</div>
		</c:if>



	<c:if test="${not empty ClubBossAndAccountingMemberIs }">
				<div class="row card box" style="width: 100%; height: 45px;">
			<div class="dashboard-card-bottom">
				<div class="row">

					<div class="col-1"></div>

					<div class="col">

						<div class="row ps-1 p-2 mb-2">
							<div class="col text-center"
								style="border-right: 2px solid #ededed;">
								<div class="row" style="justify-content: center">
									<a id="student_MemberShipFeeMgmtPage"
										href="/cbh/student/myclub/membershipfeemgmt/student_MemberShipFeeMgmtPage"
										class="col-auto px-3 aClick"
										style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none;">
										회비 내역 작성 </a>
								</div>
							</div>

							<div class="col text-center">
								<div class="row" style="justify-content: center">
									<a id="student_MemberShipFeeMgmtListPage"
										href="/cbh/student/myclub/membershipfeemgmt/student_MemberShipFeeMgmtListPage"
										class="col-auto px-3 aClick"
										style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none;">
										회비 내역 </a>
								</div>
							</div>

						</div>

					</div>

					<div class="col-1"></div>

				</div>

			</div>
		</div>
		
		<div class="row card my-3 box" style="width: 100%; height: auto;">
			<div class="dashboard-card-bottom">
				<!-- 실제 내용 -->

				<div class="container-fluid">

					

						<div class="row">

							<div class="col-1"></div>

							<div class="col">
								<div class="row my-5">
									<div class="col"
										style="font-size: 23px; font-weight: bold; text-align: center;">회비
										내역 작성</div>
								</div>

								<div class="row my-5">
									<div class="col-8"></div>
									<div class="col">
										<button onclick="plusCode()" type="button"
											class="btn btn-outline-primary buttonClick">추가</button>
									</div>

									<div class="col">
										<button onclick="deleteRow()" type="button"
											class="btn btn-outline-danger buttonClick">삭제</button>
									</div>

									<div class="col">
										<button onclick="save()" type="button" id="success"
											class="btn btn-outline-secondary buttonClick">저장</button>
									</div>
									

								</div>

								<div class="row" style="border: 1px solid black;">
									<div class="col title01-right">작성일</div>
									<div class="col-2 blank01">
										<%= sf.format(nowTime) %></div>
									<div class="col title01">동아리명</div>
									<div class="col-2 blank01">${ClubBossAndAccountingMemberIs.club_name }</div>
									<div class="col title01">직책</div>
									<div class="col blank01">${ClubBossAndAccountingMemberIs.club_stud_grade }</div>
									<div class="col title01">성명</div>
									<div class="col blank01">${ClubBossAndAccountingMemberIs.stud_name }</div>
								</div>
							</div>

							<div class="col-1"></div>

						</div>

						<div class="row my-2">

							<div class="col-1"></div>

							<div class="col">

								<div class="row" style="border: 1px solid black;">
									<div class="col-1 title02-right">#</div>
									<div class="col-2 title02">날 짜</div>
									<div class="col-1 title02">구 분</div>
									<div class="col-3 title02">내 역</div>
									<div class="col-1 title02">수 입</div>
									<div class="col-1 title02">지 출</div>
									<div class="col title02-non">비 고</div>
								</div>
								<input id="TABLE" type="hidden" value="회비내역관리">
								<div id="memberShipFeeMgmtBody"></div>

							</div>

							<div class="col-1"></div>

						</div>
				
				</div>
			</div>
		</div>
		</c:if>
	</div>
	
	
</body>
</html>