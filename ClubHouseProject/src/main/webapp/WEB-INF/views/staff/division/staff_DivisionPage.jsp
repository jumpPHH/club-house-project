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

<script type="text/javascript">

var data = new Array();


function save(){
	var count = document.getElementsByClassName("newRow").length;
	var totalCount = document.getElementsByClassName("contentRow").length;
	
	
	for(let i = 0 ; i < totalCount ; i++){
		if($(".contentRow").children(".NAME:eq("+i+")").text() != 0){
		}else{
			alert("코드명은 필수 사항입니다.")
			return;
		}	
	}
	
	
	for(let i = 0 ; i < count ; i++){
		var TABLE = $("#TABLE").val();
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
	$("#TABLE").val(table);
	$(".divisionTab").removeClass("table-active");
	if(e){
		e.classList.add("table-active")
	}
	
	
	var xhr = new XMLHttpRequest(); //AJAX 객체 생성
	 xhr.onreadystatechange = function () {
	if(xhr.readyState == 4 && xhr.status == 200){
	var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)

		$("#contentCount").text(result.count +"건");
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
		var codeBody = $('#codeBody')[0]
		
		var tr = document.createElement("tr");
		tr.classList.add("text-center");
		tr.classList.add("newRow");
		tr.classList.add("contentRow");
		codeBody.appendChild(tr);
		
		var tdd = document.createElement("th");
		tdd.classList.add("col-1");
		tdd.classList.add("NO");
		tr.appendChild(tdd);
		
		var inputCheck = document.createElement("input")
		inputCheck.classList.add("form-check-input");
		inputCheck.classList.add("check");
		inputCheck.setAttribute("onclick","deleteValuetoggle(this)")
		inputCheck.setAttribute("type","checkBox")
		tdd.appendChild(inputCheck);
		
		var th = document.createElement("th");
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
		
	
	}
	
function innerTextPlus(e){
	var text = $("#edit").val()
	var TABLE = $("#TABLE").val();
	var NO = $("#edit").closest(".contentRow").children(".NO").text()
	var NAME = text
	var STATE = $("#edit").closest(".contentRow").children(".stateCheck").children(".STATE").val();
	
	if(NO){
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
	var STATE = e.value;
	if(NO){
	var jsonObj = {
			"TABLE":TABLE,
			"DIV": "수정",
			"NO":NO,
			"NAME":NAME,
			"STATE":STATE
		}
	data.push(jsonObj)
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
 				console.log("몇번")
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
 	
 	window.addEventListener('DOMContentLoaded', function(){
 		$("#index").click();
	   });
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/staff_common/staff_header.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/staff_common/staff_sidevar.jsp"></jsp:include>

	<div
		style="position: absolute; left: 13.5%; width: 86.5%; top: 14vh; height: 86vh; overflow-y: auto; word-break: break-all">
		<div class="container-fluid">
			<div class="row">
				<div class="col">

					<!-- 여기다 작성하세요 -->
					<div class="row mt-1 mb-3">
						<div class="col"
							style="font-size: 1.6em; font-weight: bold; color: #C4073D">코드관리</div>

					</div>


					<div class="row px-3">
						<div class="col">

							<div class="row justify-content-between mb-2">
								<div class="col-auto ps-0">
									<div class="input-group input-group-sm">
										<div class="btn-group">
											<button id="codeSelectBox"
												class="btn btn-secondary btn-sm dropdown-toggle"
												type="button" data-bs-toggle="dropdown"
												aria-expanded="false">전체</button>
											<ul class="dropdown-menu">
												<li class="dropdown-item" onclick="codeClick(this)">전체</li>
												<li class="dropdown-item" onclick="codeClick(this)">공지</li>
												<li class="dropdown-item" onclick="codeClick(this)">봉사</li>
												<li class="dropdown-item" onclick="codeClick(this)">직책</li>
												<li class="dropdown-item" onclick="codeClick(this)">결재</li>
												<li class="dropdown-item" onclick="codeClick(this)">알람</li>
												<li class="dropdown-item" onclick="codeClick(this)">동아리</li>
												<li class="dropdown-item" onclick="codeClick(this)">동아리카테고리</li>
											</ul>
										</div>
										<input type="text" class="form-control"
											aria-label="Sizing example input"
											aria-describedby="inputGroup-sizing-sm">
									</div>
								</div>
								<div class="col-auto pe-0">
									<button onclick="plusCode()" type="button" class="btn btn-sm">추가</button>
									<button onclick="deleteRow()" type="button" class="btn btn-sm">삭제</button>
									<button onclick="save()" type="button" class="btn btn-sm">저장</button>
								</div>

							</div>
							<div class="row">
							
								<div class="col-2 me-3 px-0"
									style="height: 75vh; border: 1px solid;">
									<table class="table table-hover caption-top table-sm">
										<caption>
											코드정보 <span >7 건</span>
										</caption>
										<thead>
											<tr class="text-center">
												<th scope="col">코드구분</th>
												<th scope="col">코드명</th>
											</tr>
										</thead>
										<tbody class="text-center">
											<tr id="index"class="table-active divisionTab" onclick="getDivisionList('공지',this)">
												<th scope="row" class="text-center">SS0010</th>
												<td>공지구분</td>
											</tr>
											<tr class="divisionTab" onclick="getDivisionList('봉사',this)">
												<th scope="row" class="text-center">SS0020</th>
												<td>봉사구분</td>
											</tr>
											<tr class="divisionTab" onclick="getDivisionList('직책',this)">
												<th scope="row" class="text-center">SS0030</th>
												<td colspan="2">직책구분</td>
											</tr>
											<tr class="divisionTab" onclick="getDivisionList('결재',this)">
												<th scope="row" class="text-center">SS0040</th>
												<td colspan="2">결재구분</td>
											</tr>
											<tr class="divisionTab" onclick="getDivisionList('알람',this)">
												<th scope="row" class="text-center">SS0050</th>
												<td colspan="2">알람구분</td>
											</tr>
											<tr class="divisionTab" onclick="getDivisionList('동아리',this)">
												<th scope="row" class="text-center">SS0060</th>
												<td colspan="2">동아리구분</td>
											</tr>
											<tr class="divisionTab" onclick="getDivisionList('동아리카테고리',this)">
												<th scope="row" class="text-center">SS0070</th>
												<td colspan="2">동아리카테고리</td>
											</tr>


										</tbody>
									</table>

								</div>
								<div class="col px-0" style="height: 75vh; border: 1px solid;">
	<input id="TABLE" type="hidden" value="공지">
									<table class="table table-hover caption-top table-sm">
										<caption>
											코드내역 <span id="contentCount"></span>
										</caption>
										<thead>
											<tr class="text-center">
											<th class="col-1"><input onclick="totalCheck()" type="checkbox" class="form-check-input"></th>
												<th class="col-1">코드</th>
												<th class="col-3">코드명(국문)</th>
												<th class="col-3">약어명(국문)</th>
												<th class="col-3">코드명(영문)</th>
												<th class="col-1">사용여부</th>
											</tr>
										</thead>
										
										<tbody id="codeBody">

										</tbody>
									</table>


								</div>

							</div>
						</div>
					</div>

					<!-- 여기다 작성하세요 -->




				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>