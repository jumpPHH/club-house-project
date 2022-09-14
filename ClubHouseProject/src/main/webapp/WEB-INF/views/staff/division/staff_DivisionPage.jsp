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


function temp(){
	var count = document.getElementsByClassName("newRow").length;
	var totalCount = document.getElementsByClassName("contentRow").length;
	
	for(let i = 0 ; i < totalCount ; i++){
		if($(".contentRow").children(".NOTI_DIV_NAME:eq("+i+")").text() != 0){
		}else{
			alert("코드명은 필수 사항입니다.")
			return;
		}	
	}
	
	
	for(let i = 0 ; i < count ; i++){
		var NOTI_DIV_NAME = $(".newRow").children(".NOTI_DIV_NAME:eq("+i+")").text();
		var NOTI_DIV_STATE = $(".newRow").children(".stateCheck").children("input").val()
		console.log(NOTI_DIV_NAME)
		var jsonObj = {
			"DIV": "신규",
			"NOTI_DIV_NAME":NOTI_DIV_NAME,
			"NOTI_DIV_STATE":NOTI_DIV_STATE
		}
		data.push(jsonObj)
	}
	
	
	
	
}


function test(){
	
	
	
	
var data2 = JSON.stringify(data);
console.log(data2)
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
   		 xhr.onreadystatechange = function () {
     	if(xhr.readyState == 4 && xhr.status == 200){
         var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
		
		}      
    }	
	xhr.open("post","../restDivision/test",false);
	xhr.setRequestHeader("Content-type","application/json");
	xhr.send(data2); 
		

	
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
		td1.classList.add("NOTI_DIV_NAME");
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
		checkBox.setAttribute("type","checkBox")
		checkBox.setAttribute("value","1")
		checkBox.setAttribute("checked","checked")
		td4.appendChild(checkBox);
		
	
	}
	
function innerTextPlus(e){
	var text = $("#edit").val()
	var NOTI_DIV_NO = $("#edit").closest(".contentRow").children(".NOTI_DIV_NO").text()
	var NOTI_DIV_NAME = text
	var NOTI_DIV_STATE = $("#edit").closest(".contentRow").children(".stateCheck").children("input").val();
	var jsonObj = {
			"DIV": "수정",
			"NOTI_DIV_NO":NOTI_DIV_NO,
			"NOTI_DIV_NAME":NOTI_DIV_NAME,
			"NOTI_DIV_STATE":NOTI_DIV_STATE
		}
	data.push(jsonObj)
	
	$("#edit").parent().text(text);
}

function stateCheck(e){
	if(e.getAttribute("value") == 1){
		e.setAttribute("value","2")
	}else{
		e.setAttribute("value","1")
	}
	var NOTI_DIV_NO = e.closest(".contentRow").querySelector(".NOTI_DIV_NO").innerText;
	var NOTI_DIV_NAME = e.closest(".contentRow").querySelector(".NOTI_DIV_NAME").innerText;
	var NOTI_DIV_STATE = e.value;
	var jsonObj = {
			"DIV": "수정",
			"NOTI_DIV_NO":NOTI_DIV_NO,
			"NOTI_DIV_NAME":NOTI_DIV_NAME,
			"NOTI_DIV_STATE":NOTI_DIV_STATE
		}
	data.push(jsonObj)
	
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
 		
 		for(var i = 0 ; i < count ; i++){
 			var NOTI_DIV_NO = $(".checkedDelte").closest(".contentRow").children(".NOTI_DIV_NO:eq("+i+")").text();
 	 		var NOTI_DIV_NAME = $(".checkedDelte").closest(".contentRow").children(".NOTI_DIV_NAME:eq("+i+")").text()
 	 		var NOTI_DIV_STATE = $(".checkedDelte").closest(".contentRow").children(".stateCheck:eq("+i+")").children("input").val();
 	 		if(NOTI_DIV_NO){
 	 			var jsonObj = {
 	 					"DIV": "삭제",
 	 					"NOTI_DIV_NO":NOTI_DIV_NO,
 	 					"NOTI_DIV_NAME":NOTI_DIV_NAME,
 	 					"NOTI_DIV_STATE":NOTI_DIV_STATE
 	 				}
 	 			data.push(jsonObj)
 	 			
 	 			$(".checkedDelte").closest(".contentRow").remove();		
 	 			
 	 		}else{
 	 			$(".checkedDelte").closest(".contentRow").remove();
 	 		}	
 			
 		}
 		
 		
		
 	}
 	
 	function totalCheck(){
 		$(".check").click();
 		
 	}
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
									<button onclick="temp()" type="button" class="btn btn-sm">저장</button>
								</div>

							</div>
							<div class="row">
								<div class="col-2 me-3 px-0"
									style="height: 75vh; border: 1px solid;">
									<table class="table table-hover caption-top table-sm">
										<caption>
											코드정보 <span>7 건</span>
										</caption>
										<thead>
											<tr class="text-center">
												<th scope="col">코드구분</th>
												<th scope="col">코드명</th>
											</tr>
										</thead>
										<tbody class="text-center">
											<tr class="table-active">
												<th scope="row" class="text-center">SS0010</th>
												<td>공지구분</td>
											</tr>
											<tr>
												<th scope="row" class="text-center">SS0020</th>
												<td>봉사구분</td>
											</tr>
											<tr>
												<th scope="row" class="text-center">SS0030</th>
												<td colspan="2">직책구분</td>
											</tr>
											<tr>
												<th scope="row" class="text-center">SS0040</th>
												<td colspan="2">결재구분</td>
											</tr>
											<tr>
												<th scope="row" class="text-center">SS0050</th>
												<td colspan="2">알람구분</td>
											</tr>
											<tr>
												<th scope="row" class="text-center">SS0060</th>
												<td colspan="2">동아리구분</td>
											</tr>
											<tr>
												<th scope="row" class="text-center">SS0070</th>
												<td colspan="2">동아리카테고리</td>
											</tr>


										</tbody>
									</table>

								</div>
								<div class="col px-0" style="height: 75vh; border: 1px solid;">

									<table class="table table-hover caption-top table-sm">
										<caption>
											코드내역 <span>0 건</span>
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
											<c:forEach items="${data }" var="data">
										
												<tr class="text-center contentRow">
												<td class="col-1"><input class="check form-check-input" onclick="deleteValuetoggle(this)" type="checkbox"  class="form-check-input"> </td>
													<th class="col-1 NOTI_DIV_NO"  >${data.NOTI_DIV_NO }</th>
													<td class="col-3 NOTI_DIV_NAME" ondblclick="inputBox(this)">${data.NOTI_DIV_NAME }</td>
													<td class="col-3" ondblclick="inputBox(this)"></td>
													<td class="col-3" ondblclick="inputBox(this)"></td>
													<td class="col-1 stateCheck" class="text-center"><c:choose>
															<c:when test="${data.NOTI_DIV_STATE eq '1' }">
																<input onclick="stateCheck(this)" value="1" class="NOTI_DIV_STATE form-check-input" type="checkbox" 
																	checked="checked">
															</c:when>
															<c:otherwise>
																<input onclick="stateCheck(this)" value="2" class="NOTI_DIV_STATE form-check-input" type="checkbox">
															</c:otherwise>
														</c:choose></td>
												</tr>
											</c:forEach>

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