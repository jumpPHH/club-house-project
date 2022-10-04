<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경비신청내역 페이지</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="/cbh/resources/css/staff_MainPage.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"
	integrity="sha512-T/tUfKSV1bihCnd+MxKD0Hm1uBBroVYBOYSk1knyvQ9VyZJpc/ALb4P0r6ubwVPSGB2GvjeoMAJJImBG12TiaQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js"
	integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"
	integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdn.tiny.cloud/1/bdorzubong3byjkwg9kl0ayxl92mhi8e0f24djie6ukepumt/tinymce/6/tinymce.min.js"
	referrerpolicy="origin"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<style type="text/css">
.selectDiv {
	color: #FA5858;
	font-size: 1.1rem;
	font-weight: bold;
}

.title {
	background-color: #EBEBEB;
	text-align: center;
	font-weight: bold;
	padding: 20px;
	border-bottom: 2px solid #AEA9A9;
	border-right: 2px solid #AEA9A9;
}

.blank {
	background-color: #F7F7F7;
	font-weight: bold;
	padding: 20px;
	border-bottom: 2px solid #AEA9A9;
}

.blank-bottom {
	background-color: #F7F7F7;
	font-weight: bold;
	padding: 20px;
	border-bottom: 2px solid #AEA9A9;
}
</style>
<script type="text/javascript">
	$('#datePicker').datepicker({
		format : 'yyyy-mm-dd', //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
		startDate : '-10d', //달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
		endDate : '+10d', //달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
		autoclose : true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
		clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
		daysOfWeekHighlighted : [ 3 ], //강조 되어야 하는 요일 설정
		disableTouchKeyboard : false, //모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
		immediateUpdates : false, //사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false
		multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false
		templates : {
			leftArrow : '&laquo;',
			rightArrow : '&raquo;',
		}, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
		showWeekDays : true, // 위에 요일 보여주는 옵션 기본값 : true
		title : '테스트', //캘린더 상단에 보여주는 타이틀
		todayHighlight : true, //오늘 날짜에 하이라이팅 기능 기본값 :false
		toggleActive : true, //이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
		weekStart : 0, //달력 시작 요일 선택하는 것 기본값은 0인 일요일
		language : 'ko', //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
	}).on('changeDate', function(e) {
		/* 이벤트의 종류 */
		//show : datePicker가 보이는 순간 호출
		//hide : datePicker가 숨겨지는 순간 호출
		//clearDate: clear 버튼 누르면 호출
		//changeDate : 사용자가 클릭해서 날짜가 변경되면 호출 (개인적으로 가장 많이 사용함)
		//changeMonth : 월이 변경되면 호출
		//changeYear : 년이 변경되는 호출
		//changeCentury : 한 세기가 변경되면 호출 ex) 20세기에서 21세기가 되는 순간
		console.log(e);
		// e.date를 찍어보면 Thu Jun 27 2019 00:00:00 GMT+0900 (한국 표준시) 위와 같은 형태로 보인다.
	});

	function getClubExpenseList(){
		var SEARCHWORD = document.getElementById("SEARCHWORD").value;
		if(!SEARCHWORD){
			SEARCHWORD = null;
		}
		
		console.log(SEARCHWORD)
		var STATE = document.getElementById("STATE").innerText;
		console.log(STATE);
		var jsonObj = {
			"SEARCHWORD" : SEARCHWORD,
			"STATE" : STATE
			}
		var param = JSON.stringify(jsonObj)
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var result = JSON.parse(xhr.responseText);
			
		var codeBody = document.getElementById("codeBody");
		codeBody.innerHTML = "";
		
		for(var data of result.data){
		
		var tr = document.createElement("tr");
		codeBody.appendChild(tr);
		
		var td1 = document.createElement("td");
		td1.classList.add("text-center");
		td1.innerText = data.ROWNUM
		tr.appendChild(td1);
		
		var td2 = document.createElement("td");
		td2.classList.add("text-center");
		td2.innerText = data.CLUB_NAME
		tr.appendChild(td2);
		
		var td3 = document.createElement("td");
		td3.classList.add("text-center");
		td3.innerText = data.CLUB_EXPNS_APPLY_GRANTS
		tr.appendChild(td3);
		
		var td4 = document.createElement("td");
		td4.classList.add("text-center");
		td4.innerText = data.CLUB_EXPNS_NUMBER_USE
		tr.appendChild(td4);
		
		var td5 = document.createElement("td");
		td5.classList.add("text-center");
		td5.innerText = moment(data.CLUB_EXPNS_APPLY_PERIOD_USE).format('YYYY.MM.DD') 
		tr.appendChild(td5);
		
		var td6 = document.createElement("td");
		td6.classList.add("text-center");
		td6.innerText = moment(data.CLUB_EXPNS_APPLY_DATE).format('YYYY.MM.DD') 
		tr.appendChild(td6);
		
		var td7 = document.createElement("td");
		td7.classList.add("text-center");
		td7.innerText = data.CLUB_EXPNS_APPLY_STATE
		tr.appendChild(td7);
		
		var td8 = document.createElement("td");
		td8.classList.add("text-center");
		td8.setAttribute("style","cursor: pointer;color: #FA5858; ")
		td8.setAttribute("onclick","getClubExpense("+data.CLUB_EXPNS_APPLY_NO+")")
		td8.innerText = "상세보기"
		tr.appendChild(td8);
		}
			}
		}
		xhr.open("post", "../restClubExpense/getClubExpenseList");
		xhr.setRequestHeader("Content-type","application/json");
		xhr.send(param);
		
	}
	
	function updateClubExpenseState(NO,STATE){
		var jsonObj = {
			"NO" : NO,
			"STATE" : STATE
			}
		
		var param = JSON.stringify(jsonObj)
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var result = JSON.parse(xhr.responseText);
			var statebtn = document.getElementsByClassName("statebtn");
			for(var btn of statebtn){
				if(btn.innerText == result.data.CLUB_EXPNS_APPLY_STATE){
					btn.setAttribute("style","color:#FA5858; font-weight: bold;")
				}else{
					btn.removeAttribute("style")
				}
				 
			}
			getClubExpenseList()
			
			}
		}
		xhr.open("post", "../restClubExpense/updateClubExpenseState");
		xhr.setRequestHeader("Content-type","application/json");
		xhr.send(param);
		
	}
	
	function getClubExpense(No) {

		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var result = JSON.parse(xhr.responseText);
				var myModal = new bootstrap.Modal(document.getElementById('staticBackdrop'))
				
				if(document.getElementById("rejectRow")){
					var rejectRow = document.getElementById("rejectRow")
					rejectRow.remove();
				}
				if(document.getElementById("rejectName")){
					var rejectName = document.getElementById("rejectName")
					rejectName.remove();
				}
				if(document.getElementById("rejectContent")){
					var rejectContent = document.getElementById("rejectContent")
					rejectContent.remove();
				}
				
				var rejectBtn = document.getElementById("rejectBtn")
				rejectBtn.setAttribute("onclick","rejectPlus("+result.data.CLUB_EXPNS_APPLY_NO+")");
				rejectBtn.innerText="반려"
				
				var statebtn = document.getElementsByClassName("statebtn");
				for(var btn of statebtn){
					if(btn.innerText == result.data.CLUB_EXPNS_APPLY_STATE){
						btn.setAttribute("style","color:#FA5858; font-weight: bold;")
					}else{
						btn.removeAttribute("style")
					}
					 
				}
				
				if(result.data.CLUB_EXPNS_APPLY_STATE != "반려"){
				var processBtn = document.getElementById("processBtn")
				processBtn.setAttribute("onclick","updateClubExpenseState("+result.data.CLUB_EXPNS_APPLY_NO+",'진행중')");
				
				
				var approvalBtn = document.getElementById("approvalBtn")
				approvalBtn.setAttribute("onclick","updateClubExpenseState("+result.data.CLUB_EXPNS_APPLY_NO+",'승인')");
				
				
				var clubName = document.getElementById("clubName")
				clubName.innerText = result.data.CLUB_NAME;
				
				var dept = document.getElementById("dept")
				dept.innerText = result.data.STUD_DEPT;
				
				var studId = document.getElementById("studId")
				studId.innerText = result.data.STUD_ID;
				
				var phone = document.getElementById("phone")
				phone.innerText = result.data.STUD_PHONE;

				var grade = document.getElementById("grade")
				grade.innerText = result.data.STUD_GRADE;
				
				var studName = document.getElementById("studName")
				studName.innerText = result.data.STUD_NAME;
				
				var NumberUse = document.getElementById("NumberUse")
				NumberUse.innerText = result.data.CLUB_EXPNS_NUMBER_USE;
				
				var applyGrants = document.getElementById("applyGrants")
				applyGrants.innerText = result.data.CLUB_EXPNS_APPLY_GRANTS.toLocaleString('ko-KR')
			
				var purpostUse = document.getElementById("purpostUse")
				purpostUse.innerText = result.data.CLUB_EXPNS_APPLY_PURPOSE_USE;
			
				var usingDate =document.getElementById("usingDate");
				usingDate.innerText = result.data.CLUB_EXPNS_APPLY_PERIOD_USE;
			
				var applicant = document.getElementById("applicant");
				applicant.innerText = "신"+" "+"청"+" "+"자"+" "+":"+" "+result.data.STUD_NAME+" "+"("+"인"+")";
				}else{
					var processBtn = document.getElementById("processBtn")
					processBtn.setAttribute("onclick","updateClubExpenseState("+result.data.CLUB_EXPNS_APPLY_NO+",'진행중')");
					
					var approvalBtn = document.getElementById("approvalBtn")
					approvalBtn.setAttribute("onclick","updateClubExpenseState("+result.data.CLUB_EXPNS_APPLY_NO+",'승인')");
					
					var clubName = document.getElementById("clubName")
					clubName.innerText = result.data.CLUB_NAME;
					
					var dept = document.getElementById("dept")
					dept.innerText = result.data.STUD_DEPT;
					
					var studId = document.getElementById("studId")
					studId.innerText = result.data.STUD_ID;
					
					var phone = document.getElementById("phone")
					phone.innerText = result.data.STUD_PHONE;

					var grade = document.getElementById("grade")
					grade.innerText = result.data.STUD_GRADE;
					
					var studName = document.getElementById("studName")
					studName.innerText = result.data.STUD_NAME;
					
					var NumberUse = document.getElementById("NumberUse")
					NumberUse.innerText = result.data.CLUB_EXPNS_NUMBER_USE;
					
					var applyGrants = document.getElementById("applyGrants")
					applyGrants.innerText = result.data.CLUB_EXPNS_APPLY_GRANTS.toLocaleString('ko-KR')
				
					var purpostUse = document.getElementById("purpostUse")
					purpostUse.innerText = result.data.CLUB_EXPNS_APPLY_PURPOSE_USE;
				
					var usingDate =document.getElementById("usingDate");
					usingDate.innerText = result.data.CLUB_EXPNS_APPLY_PERIOD_USE;
				
					var applicant = document.getElementById("applicant");
					applicant.innerText = "신"+" "+"청"+" "+"자"+" "+":"+" "+result.data.STUD_NAME+" "+"("+"인"+")";
					
					var modalHead = document.getElementById("modalHead")
					
					var rejectName = document.createElement("div");
					rejectName.classList.add("row");
					rejectName.classList.add("px-4");
					rejectName.classList.add("mt-2");
					rejectName.setAttribute("id","rejectName")
					modalHead.after(rejectName);
					
					var rejectNameCol = document.createElement("div");
					rejectNameCol.classList.add("col");
					rejectNameCol.innerText = "반려사유"
					rejectName.appendChild(rejectNameCol);
					
					var rejectRow = document.createElement("div");
					rejectRow.classList.add("row");
					rejectRow.setAttribute("id","rejectContent")
					rejectRow.setAttribute("style","background-color: #F7F7F7; height: 60px;border-radius: 0.5rem;")
					rejectRow.classList.add("mt-1");
					rejectRow.classList.add("mx-3");
					rejectName.after(rejectRow);
					
					var rejectCol = document.createElement("div");
					rejectCol.classList.add("col");
					if(result.data.CLUB_EXPNS_APPLY_REJECT_REASON){
					rejectCol.innerText = result.data.CLUB_EXPNS_APPLY_REJECT_REASON
					}
					rejectRow.appendChild(rejectCol);
					
					
					
				}
				myModal.show();
			}
		}
		xhr.open("post", "../restClubExpense/getClubExpenseData");
		xhr.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xhr.send("No=" + No);

	}

	function divSelect(e){
		var divBox = document.getElementById("STATE");
		var divValue = e.innerText;
		divBox.innerText = divValue
		
		$(".divisionTab").removeClass("selectDiv");
		
		var divisionTab = document.getElementsByClassName("divisionTab")		
		for(var tab of divisionTab){
			if(tab.innerText == e.innerText){
				tab.classList.add("selectDiv");
			}else{
				tab.classList.remove("selectDiv");
			}
			
			
		}
		
		
		
		getClubExpenseList()
		
	
	}
	function rejectPlus(e){
		var modalHead = document.getElementById("modalHead")
		
		var rejectRow = document.createElement("div");
		rejectRow.classList.add("row");
		rejectRow.setAttribute("id","rejectRow")
		rejectRow.classList.add("mt-3");
		rejectRow.classList.add("px-3");
		modalHead.after(rejectRow);
		
		var rejectCol = document.createElement("div");
		rejectCol.classList.add("col");
		rejectRow.appendChild(rejectCol);
		
		
		var rejectlabel = document.createElement("label");
		rejectlabel.classList.add("form-label");
		rejectlabel.setAttribute("for","exampleFormControlTextarea1")
		rejectlabel.innerText = "반려사유"
		rejectCol.appendChild(rejectlabel);
		
		var rejectBox = document.createElement("textarea");
		rejectBox.classList.add("form-control");
		rejectBox.setAttribute("id","exampleFormControlTextarea1")
		rejectBox.setAttribute("rows","3")
		rejectCol.appendChild(rejectBox);
	
		var rejectBtn = document.getElementById("rejectBtn")
		rejectBtn.setAttribute("onclick","updateClubExpenseState("+e+",'반려')");
		rejectBtn.innerText="반려하기"
	}


	window.addEventListener('DOMContentLoaded', function() {
		var navtab = document.getElementById("ClubExpenseApplyListPage")
		navtab.setAttribute("style", "border-right: 5px solid #FA5858");
		var start = document.getElementById("start")
		start.click();
	});
</script>


</head>
<body>
	<jsp:include page="/WEB-INF/views/staff_common/staff_sidevar.jsp"></jsp:include>

	<!-- 페이지 내용 부분 시작 (이 부분만 카피해서 사용할것. 카피 후 삭제) -->
	<div class="page-content p-5 pt-4" id="content">
		<!-- 토글 버튼 -->
		<button id="sidebarCollapse" type="button" style="color: #FA5858"
			class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-3">
			<small class="text-uppercase font-weight-bold">MENU</small>
		</button>

		<!-- 여기다 작성하세요 -->
		<div id="STATE"style="display: none;">전체</div>
		<div class="row px-3">
			<div class="col mt-3">
				<div class="row box mb-3" style="height: 45px; align-items: center;">
					<div class="col-2 text-center" style="border-right: 2px solid #ededed; font-size: 1.1rem; ">동아리 검색</div>
					<div class="col-2" style="border-right: 3px solid #ededed;">
						<input class="form-control" id="SEARCHWORD" type="text" onKeypress="javascript:if(event.keyCode==13) {getClubExpenseList()}">
					</div>
					<div class="col">
						<div class="row">
							<div class="col text-center" style="text-align-last: right; font-size: 1.1rem; ">상태&nbsp:</div>
							<div id="start"class="col divisionTab text-center" style="border-right: 2px solid #ededed; cursor: pointer;" onclick="divSelect(this)">전체</div>
							<div class="col divisionTab text-center" style="border-right: 2px solid #ededed;cursor: pointer;" onclick="divSelect(this)">신청</div>
							<div class="col divisionTab text-center" style="border-right: 2px solid #ededed;cursor: pointer;" onclick="divSelect(this)">진행중</div>
							<div class="col divisionTab text-center" style="border-right: 2px solid #ededed;cursor: pointer;" onclick="divSelect(this)">승인</div>
							<div class="col divisionTab text-center" onclick="divSelect(this)">반려</div>
						</div>
					</div>
				</div>
				<div class="row box mb-3 p-2" style="height: 45px;">
					<div class="col-2 text-center">기간</div>
					<div class="col">
						<input id="datePicker" class="form-control" type="text">
					</div>
				</div>
				<div class="row box p-3" style="height: 77vh;">

					<div class="col px-0">
						<input id="TABLE" type="hidden" value="공지">
						<div class="row">
							<div class="col">
								<table class="table table-hover table-sm">
									<thead>
										<tr id="codeContentHead" class="text-center">
											<th class="text-center col-1">NO</th>
											<th class="text-center col-3">동아리명</th>
											<th class="text-center col-1">경비</th>
											<th class="text-center col-1">사용인원</th>
											<th class="text-center col-1">사용일자</th>
											<th class="text-center col-1">신청일자</th>
											<th class="text-center col-1">상태</th>
											<th class="text-center col-1">상세</th>
										</tr>
									</thead>
									<tbody id="codeBody">
									</tbody>
								</table>
							</div>
						</div>

					</div>

				</div>

			</div>
		</div>
		<!-- 여기다 작성하세요 -->

	</div>

	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div id="modalHead"class="modal-header">
					<button id="processBtn" type="button" class="btn statebtn">진행중</button>
					<button id="approvalBtn" type="button" class="btn statebtn">승인</button>
					<button id="rejectBtn" type="button" onclick="rejectPlus()" class="btn statebtn">반려</button>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				
				<div class="modal-body">
					<div class="row">

						<div class="col pe-0">
							<div class="row my-5">

								<div class="col"
									style="font-size: 23px; font-weight: bold; text-align: center;">동아리
									경비 신청서</div>
							</div>

							<div class="row my-3" style="padding: 0px; margin: 0px;">

								<div class="row" style="padding: 0px; margin: 0px;">
									<div class="row pe-0">
										<div class="col-3 title">동아리 명</div>
										<div id="clubName" class="col blank-bottom"></div>
									</div>

									<div class="row pe-0">
										<div class="col-3 title" style="padding-top: 80px;">회 장</div>
										<div class="col-2">
											<div class="row title">전 공</div>
											<div class="row title">학 번</div>
											<div class="row title">연 락 처</div>
										</div>
										<div class="col">
											<div id="dept" class="row blank"></div>
											<div id="studId" class="row blank"></div>
											<div id="phone" class="row blank"></div>
										</div>
										<div class="col-2"
											style="border-bottom: 2px solid #AEA9A9; background-color: #F7F7F7;">
											<div class="row title"
												style="border-left: 2px solid #AEA9A9;">학 년</div>
											<div class="row title"
												style="border-left: 2px solid #AEA9A9;">성 명</div>
										</div>
										<div class="col"
											style="border-bottom: 2px solid #AEA9A9; background-color: #F7F7F7;">
											<div id="grade" class="row blank"></div>
											<div id="studName" class="row blank"></div>
										</div>
									</div>

									<div class="row pe-0">
										<div class="col-3 title">사용 인원</div>
										<div id="NumberUse" class="col blank" style="background-color: white;">
										</div>
									</div>

									<div class="row pe-0">
										<div class="col-3 title">경비 요청액</div>
										<div id="applyGrants"class="col blank" style="background-color: white;">

										</div>
									</div>

									<div class="row pe-0">
										<div class="col-3 title">사용 목적</div>
										<div id="purpostUse" class="col blank" style="background-color: white;">

										</div>
									</div>

									<div class="row pe-0">
										<div class="col-3 title" style="padding-top: 40px;">경비
											사용날짜</div>
										<div id="usingDate"class="col blank"
											style="background-color: white; padding-bottom: 0px;">

										</div>
									</div>

									<div class="row my-5 pe-0">
										<div class="col"
											style="text-align: center; font-weight: bold;">상기 동아리
											활동에 필요한 경비지원을 요청합니다.</div>
									</div>

									<div class="row pe-0">
										<div class="col"
											style="text-align: center; font-weight: bold;"></div>
									</div>

									<div class="row ">
										<div class="col"></div>
										<div class="col"></div>
										<div class="col-4 pe-5"
											style="font-weight: bold; text-align: right;"><span id="applicant">
											신 청 자 : 박한희 (인)</span><img
												style="width: 100px; transform: translate(50%, -60%);"
												src="/cbh/resources/img/student/myclub/applicationexpenses/payment.png">
										</div>
									</div>

									<div class="row my-3 pe-0">
										<div class="col" style="font-size: 25px; font-weight: bold;">
											중앙정보처리학원 총장 귀하</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@tinymce/tinymce-webcomponent@2/dist/tinymce-webcomponent.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>