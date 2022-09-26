<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구분코드 페이지</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/cbh/resources/css/staff_MainPage.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
	;

body {
	font-family: 'Noto Sans KR', sans-serif;
}

main>div>div>div {
	margin: 2vh;
	border: 0px solid black;
	border-radius: 0.7rem;
	padding: 17px;
	background-color: white /*       background-color:#EBF7FF; */
}
</style>
<script type="text/javascript">

var data = new Array();


function save(){
	var count = document.getElementsByClassName("newRow").length;
	var totalCount = document.getElementsByClassName("contentRow").length;
	var TABLE = $("#TABLE").val();
	
	
	for(let i = 0 ; i < totalCount ; i++){
		if($(".contentRow").children(".NAME:eq("+i+")").text() != 0){
		}else{
			alert("코드명은 필수 사항입니다.")
			return;
		}	
	}
	
	if(TABLE != "동아리카테고리"){
	for(let i = 0 ; i < count ; i++){
		var NAME = $(".newRow").children(".NAME:eq("+i+")").text();
		var STATE = $(".newRow").children(".stateCheck").children(".STATE:eq("+i+")").val()
		var jsonObj = {
			"TABLE" : TABLE,
			"DIV": "신규",
			"NAME":NAME,
			"STATE":STATE
		}
		data.push(jsonObj)
	}
	}else{
		for(let i = 0 ; i < count ; i++){
			var NAME = $(".newRow").children(".NAME:eq("+i+")").text();
			var STATE = $(".newRow").children(".stateCheck").children(".STATE:eq("+i+")").val()
			var DESCRIPTION = $(".newRow").children(".DESCRIPTION:eq("+i+")").text();
			var jsonObj = {
				"TABLE" : TABLE,
				"DIV": "신규",
				"NAME":NAME,
				"DESCRIPTION" : DESCRIPTION,
				"STATE":STATE
			}
			data.push(jsonObj)
		}
		
		
		
	}
	
	
	if(data.length == 0){
		alert("수정된부분이 없습니다.")
		return;
	}
	var data2 = JSON.stringify(data);
	
	var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		 xhr.onreadystatechange = function () {
	if(xhr.readyState == 4 && xhr.status == 200){
    var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
	data = [];
	
    getDivisionList(TABLE)
	
		}      
	}	
	xhr.open("post","../restDivision/saveDivision",false);
	xhr.setRequestHeader("Content-type","application/json");
	xhr.send(data2); 
}


function getDivisionList(table,e){
	if(data.length != 0){
		alert("구분이동시 저장하지않은 항목은 적용되지 않습니다.")
	}
		data = [];
	$("#TABLE").val(table);
	$(".divisionTab").removeClass("table-active");
	if(e){
		e.classList.add("table-active")
	}
	
	
	var xhr = new XMLHttpRequest(); //AJAX 객체 생성
	 xhr.onreadystatechange = function () {
	if(xhr.readyState == 4 && xhr.status == 200){
	var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
	if(table != '동아리카테고리'){
		$("#contentCount").text(result.count +"건");
		
		var codeContentHead = document.getElementById("codeContentHead")
		codeContentHead.innerHTML= "";
		
		var headTh1 = document.createElement("th");
		headTh1.classList.add("col-1");
		codeContentHead.appendChild(headTh1);
		
		var headTh1Input = document.createElement("input");
		headTh1Input.classList.add("form-check-input");
		headTh1Input.setAttribute("onclick","totalCheck()")
		headTh1Input.setAttribute("type","checkbox")
		headTh1.appendChild(headTh1Input);
		
		
		var headTh2 = document.createElement("th");
		headTh2.classList.add("col-1");
		headTh2.innerText = "코드"
		codeContentHead.appendChild(headTh2);
		
		
		var headTh3 = document.createElement("th");
		headTh3.classList.add("col-3");
		headTh3.innerText = "코드명(국문)"
		codeContentHead.appendChild(headTh3);
		
		
		var headTh4 = document.createElement("th");
		headTh4.classList.add("col-3");
		headTh4.innerText = "코드명(영문)"
		codeContentHead.appendChild(headTh4);
		
		
		var headTh5 = document.createElement("th");
		headTh5.classList.add("col-3");
		headTh5.innerText = "약어명"
		codeContentHead.appendChild(headTh5);
		
		
		var headTh6 = document.createElement("th");
		headTh6.classList.add("col-1");
		headTh6.innerText = "사용여부"
		codeContentHead.appendChild(headTh6);
		
		
		
		var codeBody = document.getElementById("codeBody")
		codeBody.innerHTML = "";
	
		
		for(var data of result.data){
			
			var contentRow = document.createElement("tr");
			contentRow.classList.add("text-center");
			contentRow.classList.add("contentRow");
			codeBody.appendChild(contentRow);
			
			var td1 = document.createElement("td");
			td1.classList.add("col-1");
			contentRow.appendChild(td1);
			
			var td1Input = document.createElement("input");
			td1Input.classList.add("check");
			td1Input.classList.add("form-check-input");
			td1Input.setAttribute("onclick","deleteValuetoggle(this)")
			td1Input.setAttribute("type","checkbox")
			td1.appendChild(td1Input);
			
			var th2 = document.createElement("th");
			th2.classList.add("col-1");
			th2.classList.add("NO");
			th2.innerText = data.NO;
			contentRow.appendChild(th2);
			
			
			var th3 = document.createElement("td");
			th3.classList.add("col-3");
			th3.classList.add("NAME");
			th3.setAttribute("ondblclick","inputBox(this)")
			th3.innerText = data.NAME;
			contentRow.appendChild(th3);
			
			
			var th4 = document.createElement("td");
			th4.classList.add("col-3");
			th4.setAttribute("ondblclick","inputBox(this)")
			contentRow.appendChild(th4);
			
			
			var th5 = document.createElement("td");
			th5.classList.add("col-3");
			th5.setAttribute("ondblclick","inputBox(this)")
			contentRow.appendChild(th5);
			
			var th6 = document.createElement("td");
			th6.classList.add("col-1");
			th6.classList.add("stateCheck");
			th6.classList.add("text-center");
			contentRow.appendChild(th6);
			
			if(data.STATE == 1){
				var th6Input = document.createElement("input");
				th6Input.classList.add("STATE");
				th6Input.classList.add("form-check-input");
				th6Input.setAttribute("onclick","stateCheck(this)")
				th6Input.setAttribute("value","1")
				th6Input.setAttribute("type","checkbox")
				th6Input.setAttribute("checked","checked")
				th6.appendChild(th6Input);
			}else{
				var th6Input = document.createElement("input");
				th6Input.classList.add("STATE");
				th6Input.classList.add("form-check-input");
				th6Input.setAttribute("onclick","stateCheck(this)")
				th6Input.setAttribute("value","2")
				th6Input.setAttribute("type","checkbox")
				th6.appendChild(th6Input);
			}
			
		}
	
	}else if(table == '동아리카테고리'){
		
		$("#contentCount").text(result.count +"건");
		var codeContentHead = document.getElementById("codeContentHead")
		codeContentHead.innerHTML= "";
		
		var headTh1 = document.createElement("th");
		headTh1.classList.add("col-1");
		codeContentHead.appendChild(headTh1);
		
		var headTh1Input = document.createElement("input");
		headTh1Input.classList.add("form-check-input");
		headTh1Input.setAttribute("onclick","totalCheck()")
		headTh1Input.setAttribute("type","checkbox")
		headTh1.appendChild(headTh1Input);
		
		
		var headTh2 = document.createElement("th");
		headTh2.classList.add("col-1");
		headTh2.innerText = "코드"
		codeContentHead.appendChild(headTh2);
		
		
		var headTh3 = document.createElement("th");
		headTh3.classList.add("col-3");
		headTh3.innerText = "코드명(국문)"
		codeContentHead.appendChild(headTh3);
		
		
		var headTh4 = document.createElement("th");
		headTh4.classList.add("col-2");
		headTh4.innerText = "코드명(영문)"
		codeContentHead.appendChild(headTh4);
		
		
		var headTh5 = document.createElement("th");
		headTh5.classList.add("col-4");
		headTh5.innerText = "설명"
		codeContentHead.appendChild(headTh5);
		
		
		var headTh6 = document.createElement("th");
		headTh6.classList.add("col-1");
		headTh6.innerText = "사용여부"
		codeContentHead.appendChild(headTh6);
		
		var codeBody = document.getElementById("codeBody")
		codeBody.innerHTML = "";
	
		for(var data of result.data){
		
		var tr = document.createElement("tr");
		tr.classList.add("text-center");
		tr.classList.add("contentRow");
		codeBody.appendChild(tr);
		
		var td1 = document.createElement("td");
		td1.classList.add("col-1");
		tr.appendChild(td1);
		
		var tdInput =  document.createElement("input");
		tdInput.classList.add("check");
		tdInput.setAttribute("onclick","deleteValuetoggle(this)")
		tdInput.setAttribute("type","checkbox")
		tdInput.classList.add("form-check-input");
		td1.appendChild(tdInput);
		
		
		var th2 = document.createElement("th");
		th2.classList.add("col-1");
		th2.classList.add("NO");
		th2.innerText = data.NO
		tr.appendChild(th2);

		
		var td3 = document.createElement("td");
		td3.classList.add("col-3");
		td3.classList.add("NAME");
		td3.setAttribute("ondblclick","inputBox(this)")
		td3.innerText = data.NAME
		tr.appendChild(td3);
		
		var td4 = document.createElement("td");
		td4.classList.add("col-2");
		td4.setAttribute("ondblclick","inputBox(this)")
		tr.appendChild(td4);
		
		
		var td5 = document.createElement("td");
		td5.classList.add("col-4");
		td5.classList.add("DESCRIPTION");
		td5.setAttribute("ondblclick","inputBox(this)")
		td5.innerText=data.DESCRIPTION
		tr.appendChild(td5);
	
		var td6 = document.createElement("td");
		td6.classList.add("col-1");
		td6.classList.add("stateCheck");
		td6.classList.add("text-center");
		tr.appendChild(td6);
		
		if(data.STATE == 1){
			var td6Input =  document.createElement("input");
			td6Input.classList.add("STATE");
			td6Input.classList.add("form-check-input");
			td6Input.setAttribute("onclick","stateCheck(this)")
			td6Input.setAttribute("type","checkbox")
			td6Input.setAttribute("value","1")
			td6Input.setAttribute("checked","checked")
			td6.appendChild(td6Input);
		}else{
			var td6Input =  document.createElement("input");
			td6Input.classList.add("STATE");
			td6Input.classList.add("form-check-input");
			td6Input.setAttribute("onclick","stateCheck(this)")
			td6Input.setAttribute("type","checkbox")
			td6Input.setAttribute("value","2")
			td6.appendChild(td6Input);
		}
		
		
		
	}
	}
		}      
	}	
	xhr.open("post","../restDivision/getDivisionList",false);
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("table=" + table); 
}
	
	
	
	




function codeClick(e) {
		var codeName = e.innerText;
		var codeTextView = document.getElementById("codeSelectBox")
		codeTextView.innerText = codeName
		
	}
	
	function plusCode(){
		var TABLE = $("#TABLE").val();
		var codeBody = $('#codeBody')[0]
		
		if(TABLE != "동아리카테고리"){
		
		var tr = document.createElement("tr");
		tr.classList.add("text-center");
		tr.classList.add("newRow");
		tr.classList.add("contentRow");
		codeBody.appendChild(tr);
		
		var tdd = document.createElement("th");
		tdd.classList.add("col-1");
		tr.appendChild(tdd);
		
		var inputCheck = document.createElement("input")
		inputCheck.classList.add("form-check-input");
		inputCheck.classList.add("check");
		inputCheck.setAttribute("onclick","deleteValuetoggle(this)")
		inputCheck.setAttribute("type","checkBox")
		tdd.appendChild(inputCheck);
		
		var th = document.createElement("th");
		th.classList.add("NO");
		th.classList.add("col-1");
		tr.appendChild(th);
		
		var td1 = document.createElement("td");
		td1.classList.add("col-3");
		td1.classList.add("NAME");
		td1.setAttribute("ondblclick","inputBox(this)")
		tr.appendChild(td1);
		

		var td2 = document.createElement("td");
		td2.classList.add("col-3");
		td2.setAttribute("ondblclick","inputBox(this)")
		tr.appendChild(td2);
		
		var td3 = document.createElement("td");
		td3.classList.add("col-3");
		td3.setAttribute("ondblclick","inputBox(this)")
		tr.appendChild(td3);
		

		
		var td4 = document.createElement("td");
		td4.classList.add("stateCheck");
		td4.classList.add("col-1");
		tr.appendChild(td4);
		
		var checkBox = document.createElement("input")
		checkBox.classList.add("form-check-input");
		checkBox.classList.add("STATE");
		checkBox.setAttribute("type","checkBox")
		checkBox.setAttribute("value","1")
		checkBox.setAttribute("onclick","stateCheck(this)")
		checkBox.setAttribute("checked","checked")
		td4.appendChild(checkBox);
		
		}else{
			var tr = document.createElement("tr");
			tr.classList.add("text-center");
			tr.classList.add("newRow");
			tr.classList.add("contentRow");
			codeBody.appendChild(tr);
			
			var tdd = document.createElement("td");
			tdd.classList.add("col-1");
			tr.appendChild(tdd);
			
			var inputCheck = document.createElement("input")
			inputCheck.classList.add("form-check-input");
			inputCheck.classList.add("check");
			inputCheck.setAttribute("onclick","deleteValuetoggle(this)")
			inputCheck.setAttribute("type","checkBox")
			tdd.appendChild(inputCheck);
			
			var th = document.createElement("th");
			th.classList.add("NO");
			th.classList.add("col-1");
			tr.appendChild(th);
			
			var td1 = document.createElement("td");
			td1.classList.add("col-3");
			td1.classList.add("NAME");
			td1.setAttribute("ondblclick","inputBox(this)")
			tr.appendChild(td1);
			
			var td2 = document.createElement("td");
			td2.classList.add("col-2");
			td2.setAttribute("ondblclick","inputBox(this)")
			tr.appendChild(td2);
			
			var td3 = document.createElement("td");
			td3.classList.add("col-4");
			td3.classList.add("DESCRIPTION");
			td3.setAttribute("ondblclick","inputBox(this)")
			tr.appendChild(td3);
			
			var td4 = document.createElement("td");
			td4.classList.add("stateCheck");
			td4.classList.add("col-1");
			tr.appendChild(td4);
			
			var checkBox = document.createElement("input")
			checkBox.classList.add("form-check-input");
			checkBox.classList.add("STATE");
			checkBox.setAttribute("type","checkBox")
			checkBox.setAttribute("value","1")
			checkBox.setAttribute("onclick","stateCheck(this)")
			checkBox.setAttribute("checked","checked")
			td4.appendChild(checkBox);
		}
	}
	
function innerTextPlus(e){
	var text = $("#edit").val()
	var TABLE = $("#TABLE").val();
	var NAME;
	var DESCRIPTION;
	var NO = $("#edit").closest(".contentRow").children(".NO").text()
	if($("#edit").parent().hasClass("NAME")){
		NAME = text
		if($("#edit").closest(".contentRow").children(".DESCRIPTION").text()){
			DESCRIPTION = $("#edit").closest(".contentRow").children(".DESCRIPTION").text()
		}
	}else if($("#edit").parent().hasClass("DESCRIPTION")){
		DESCRIPTION = text
		if($("#edit").closest(".contentRow").children(".NAME").text()){
			NAME = $("#edit").closest(".contentRow").children(".NAME").text();
		}
	}
	var STATE = $("#edit").closest(".contentRow").children(".stateCheck").children(".STATE").val();
	
	if(NO){
		if(TABLE != "동아리카테고리"){
		var jsonObj = {
				"TABLE" : TABLE,
				"DIV": "수정",
				"NO":NO,
				"NAME":NAME,
				"STATE":STATE
			}
		data.push(jsonObj)
	
		$("#edit").parent().text(text);
		}else{
			var jsonObj = {
					"TABLE" : TABLE,
					"DIV": "수정",
					"NO":NO,
					"NAME":NAME,
					"DESCRIPTION": DESCRIPTION,
					"STATE":STATE
				}
			data.push(jsonObj)
		
			$("#edit").parent().text(text);
		}
	
	}else{
		$("#edit").parent().text(text);
		return;
	}
}

function stateCheck(e){
	if(e.getAttribute("value") == 1){
		e.setAttribute("value","2")
	}else{
		e.setAttribute("value","1")
	}
	var TABLE = $("#TABLE").val();
	var NO = e.closest(".contentRow").querySelector(".NO").innerText;
	var NAME = e.closest(".contentRow").querySelector(".NAME").innerText;
	if(e.closest(".contentRow").querySelector(".DESCRIPTION")){
	var DESCRIPTION = e.closest(".contentRow").querySelector(".DESCRIPTION").innerText;
	}
	var STATE = e.value;
	if(NO){
		if(TABLE != "동아리카테고리"){
			console.log("안들어옴?")
			var jsonObj = {
				"TABLE":TABLE,
				"DIV": "수정",
				"NO":NO,
				"NAME":NAME,
				"STATE":STATE
			}
			data.push(jsonObj)
		}else{
			var jsonObj = {
					"TABLE":TABLE,
					"DIV": "수정",
					"NO":NO,
					"DESCRIPTION" : DESCRIPTION,
					"NAME":NAME,
					"STATE":STATE
				}
			data.push(jsonObj)
		}
	
	
	}else{
		return;
	}
}

	function inputBox(e){
		var text = e.innerText;
		e.innerText="";
		if($("#edit")[0]){
			$("#edit")[0].remove();
			var inputTag =document.createElement("input");
			inputTag.setAttribute("id","edit")
			inputTag.setAttribute("type","text")
			inputTag.setAttribute("onblur","innerTextPlus(this)")
			inputTag.setAttribute("style","border: 0px; box-shadow: 0px 0px 0px 1px lightgrey;")
			inputTag.classList.add("form-control");
			inputTag.classList.add("py-0");
			inputTag.setAttribute("value",text);
			e.appendChild(inputTag);
			inputTag.focus();
		}else{
		
		var inputTag =document.createElement("input");
		inputTag.setAttribute("id","edit")
		inputTag.setAttribute("type","text")
		inputTag.setAttribute("onblur","innerTextPlus(this)")
		inputTag.setAttribute("style","border: 0px; box-shadow: 0px 0px 0px 1px lightgrey;")
		inputTag.classList.add("form-control");
		inputTag.classList.add("py-0");
		inputTag.setAttribute("value",text);
		e.appendChild(inputTag);
		inputTag.focus();
		}
	}
	function deleteValuetoggle(e){
		e.classList.toggle("checkedDelte")
	}
	
 	function deleteRow(){
 		var count = document.getElementsByClassName("checkedDelte").length;
 		var TABLE = $("#TABLE").val();
 		for(var i = 0 ; i < count ; i++){
 			var NO = $(".checkedDelte").closest(".contentRow").children(".NO:eq("+i+")").text();
 			if(NO != 0){
 	 			var jsonObj = {
 	 					"TABLE":TABLE,
 	 					"DIV": "삭제",
 	 					"NO":NO,
 	 					"STATE": "3"
 	 				}
 	 			data.push(jsonObj)
 	 			
 	 		}else{
 	 		
 	 		}	
 			
 		}
 		
 	 			$(".checkedDelte").closest(".contentRow").remove();
 		
		
 	}
 	
 	function totalCheck(){
 		$(".check").click();
 		
 	}
 	function search(){
 		var searchDiv = $("#codeSelectBox").text();
 		if(searchDiv == "공지"){
 			$("#noti").click()
 		}else if(searchDiv == "봉사"){
 			$("#vlntr").click()
 		}else if(searchDiv == "직책"){
 			$("#pstn").click()
 		}else if(searchDiv == "결재"){
 			$("#apv").click()
 		}else if(searchDiv == "알람"){
 			$("#alarm").click()
 		}else if(searchDiv == "동아리"){
 			$("#clubDivision").click()
 		}else if(searchDiv == "동아리카테고리"){
 			$("#clubDeptCategory").click()
 		}
 		
 	}
 	window.addEventListener('DOMContentLoaded', function(){
		$("#noti").click();
	   });
</script>
</head>

<body>
	<div class="container-fluid">

		<jsp:include page="/WEB-INF/views/staff_common/staff_sidevar.jsp"></jsp:include>


		<main>
			<!-- 여기다 작성하세요 -->



			<div class="row px-3 mt-4">
				<div class="col">
					<div class="row ps-1">
						<div id="noti" class="col text-center" style="cursor: pointer;"
							onclick="getDivisionList('공지',this)">공지구분</div>
						<div id="vlntr" class="col text-center" style="cursor: pointer;"
							onclick="getDivisionList('봉사',this)">봉사구분</div>
						<div id="pstn" class="col text-center" style="cursor: pointer;"
							onclick="getDivisionList('직책',this)">직책구분</div>
						<div id="apv" class="col text-center" style="cursor: pointer;"
							onclick="getDivisionList('결재',this)">결재구분</div>
						<div id="alarm" class="col text-center" style="cursor: pointer;"
							onclick="getDivisionList('알람',this)">알람구분</div>
						<div id="clubDivision" class="col text-center"
							style="cursor: pointer;" onclick="getDivisionList('동아리',this)">
							동아리구분</div>
						<div id="clubDeptCategory" class="col text-center"
							style="cursor: pointer;"
							onclick="getDivisionList('동아리카테고리',this)">동아리카테고리</div>
					</div>

					<div class="row"style="height: 78vh;">

						<div class="col px-0" >
							<input id="TABLE" type="hidden" value="공지">
							<div class="row justify-content-between">
								<div class="col-auto">
									<div class="input-group input-group-sm">
										<div class="btn-group">
											<button id="codeSelectBox"
												class="btn btn-secondary btn-sm dropdown-toggle"
												type="button" data-bs-toggle="dropdown"
												aria-expanded="false">검색</button>
											<ul class="dropdown-menu">
												<li class="dropdown-item" onclick="codeClick(this)">공지</li>
												<li class="dropdown-item" onclick="codeClick(this)">봉사</li>
												<li class="dropdown-item" onclick="codeClick(this)">직책</li>
												<li class="dropdown-item" onclick="codeClick(this)">결재</li>
												<li class="dropdown-item" onclick="codeClick(this)">알람</li>
												<li class="dropdown-item" onclick="codeClick(this)">동아리</li>
												<li class="dropdown-item" onclick="codeClick(this)">동아리카테고리</li>
											</ul>
										</div>
										<input type="text"
											onKeypress="javascript:if(event.keyCode==13) {search()}"
											class="form-control" aria-label="Sizing example input"
											aria-describedby="inputGroup-sizing-sm">
									</div>
								</div>
								<div class="col-auto">
									<button onclick="plusCode()" type="button"
										class="btn btn-sm">추가</button>
									<button onclick="deleteRow()" type="button" class="btn btn-sm">삭제</button>
									<button onclick="save()" type="button" class="btn btn-sm">저장</button>
								</div>

							</div>

							<div class="row">
								<div class="col">
									<table class="table table-hover caption-top table-sm">
										<caption class="ps-2" style="font-size: 0.8rem;">
											코드내역 <span id="contentCount"></span>
										</caption>
										<thead>
											<tr id="codeContentHead" class="text-center">
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

		</main>

	</div>

	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>