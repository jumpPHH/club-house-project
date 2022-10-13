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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script
	src="https://cdn.tiny.cloud/1/bdorzubong3byjkwg9kl0ayxl92mhi8e0f24djie6ukepumt/tinymce/6/tinymce.min.js"
	referrerpolicy="origin"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<style type="text/css">
.selectDiv{
color: #FA5858;
font-size: 1.2rem;
font-weight: bold;
}
.form-check-input:focus {
    border-color: #FA5858;
    outline: 0;
    box-shadow: 0 0 0 0;
}
.form-check-input:checked {
    border-color:#FA5858;
    background-color: #FA5858;
 }
 .form-check-input{
  border-color:#FA5858;
 }
</style>
<script type="text/javascript">


tinymce.init({
	selector : 'textarea#modalBody',
	statusbar : false,
	height : 1140,
	language : 'ko_KR',
	skin: 'bootstrap',
	icons: 'bootstrap',
	font_family_formats : '맑은고딕=맑은고딕; 궁서체=궁서체;',
	plugins : [ 'advlist', 'autolink', 'lists',
			'link', 'image', 'charmap',
			'preview', 'anchor',
			'searchreplace', 'visualblocks',
			'code', 'fullscreen',
			'insertdatetime', 'media', 'table',
			'help', 'wordcount' ],
	toolbar : ' | blocks fontfamily| '
			+ 'bold italic backcolor | alignleft aligncenter '
			+ 'alignright alignjustify | bullist numlist outdent indent | '
			+ 'removeformat table| help',
	content_style : 'body { font-family: 맑은고딕,Arial,sans-serif; font-size:16px }',
	 setup: (editor) => {
		    editor.on('init', () => {
		      editor.getContainer().style.transition='border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out';
		    });
		    editor.on('focus', () => {
		      editor.getContainer().style.boxShadow='0 0 0 .2rem rgba(0, 123, 255, .25)';
		      editor.getContainer().style.borderColor='#80bdff';
		    });
		    editor.on('blur', () => {
		      editor.getContainer().style.boxShadow='';
		      editor.getContainer().style.borderColor='';
		    });
		  }

});
var data = new Array();


function save(){
	var count = document.getElementsByClassName("newRow").length;
	var totalCount = document.getElementsByClassName("contentRow").length;
	var TABLE = $("#TABLE").val();
	
	
	for(let i = 0 ; i < totalCount ; i++){
		if($(".contentRow").children(".NAME:eq("+i+")").text() != 0){
		}else{
			swal("","코드명은 필수 사항입니다.","info")
			return;
		}	
	}
	
	if(TABLE != "동아리카테고리"){
	for(let i = 0 ; i < count ; i++){
		var NAME = $(".newRow").children(".NAME:eq("+i+")").text();
		var STATE = $(".newRow").children(".stateCheck").children(".STATE:eq("+i+")").val()
		var ENG = $(".newRow").children(".ENG:eq("+i+")").text()
		var ABRVT = $(".newRow").children(".ABRVT:eq("+i+")").text()
		
		var jsonObj = {
			"TABLE" : TABLE,
			"DIV": "신규",
			"NAME":NAME,
			"ENG" : ENG,
			"ABRVT" : ABRVT,
			"STATE":STATE
		}
		data.push(jsonObj)
	}
	}else{
		for(let i = 0 ; i < count ; i++){
			var NAME = $(".newRow").children(".NAME:eq("+i+")").text();
			var STATE = $(".newRow").children(".stateCheck").children(".STATE:eq("+i+")").val()
			if($(".newRow").children(".DESCRIPTION:eq("+i+")").text()){
				var DESCRIPTION = $(".newRow").children(".DESCRIPTION:eq("+i+")").text();
			}
			if($(".newRow").children(".ENG:eq("+i+")").text()){
				var ENG = $(".newRow").children(".ENG:eq("+i+")").text();
			}
			var jsonObj = {
				"TABLE" : TABLE,
				"DIV": "신규",
				"NAME":NAME,
				"ENG" : ENG,
				"DESCRIPTION" : DESCRIPTION,
				"STATE":STATE
			}
			data.push(jsonObj)
		}
		
		
		
	}
	
	
	if(data.length == 0){
		swal("","수정된부분이 없습니다.","info")
		return;
	}
	var data2 = JSON.stringify(data);
	
	var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		 xhr.onreadystatechange = function () {
	if(xhr.readyState == 4 && xhr.status == 200){
    var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
	data = [];
	swal("","저장완료.","success")
    getDivisionList(TABLE)
	
		}      
	}	
	xhr.open("post","../restDivision/saveDivision",false);
	xhr.setRequestHeader("Content-type","application/json");
	xhr.send(data2); 
}

function getDivisionList(table,e){
	if(data.length != 0){
	swal({
		  text: "구분 이동시 수정된 부분은 저장되지 않습니다.",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
			  DivisionList(table,e)
		  } else {
		 
		  
		  }
		});
	}else{
		DivisionList(table,e)
	}
}


function DivisionList(table,e){
	data = [];
	var NAME = NAME;
	var TABLE = document.getElementById("TABLE")
	TABLE.setAttribute("value",table);
	if(e){
	$(".selectDiv").removeClass("selectDiv");
	e.classList.toggle('selectDiv');
	}
	
	
	
	var xhr = new XMLHttpRequest(); //AJAX 객체 생성
	 xhr.onreadystatechange = function () {
	if(xhr.readyState == 4 && xhr.status == 200){
	var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
	if((table != '동아리카테고리') && (table != '결재')){
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
			th4.classList.add("ENG");
			th4.setAttribute("ondblclick","inputBox(this)")
			if(data.ENG != undefined){
			th4.innerText = data.ENG;
			}
			contentRow.appendChild(th4);
			
			
			var th5 = document.createElement("td");
			th5.classList.add("col-3");
			th5.classList.add("ABRVT");
			th5.setAttribute("ondblclick","inputBox(this)")
			if(data.ABRVT != undefined){
			th5.innerText = data.ABRVT;
			}
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
		td4.classList.add("ENG");
		td4.setAttribute("ondblclick","inputBox(this)")
		if(data.ENG != undefined){
		td4.innerText = data.ENG;
		}
		tr.appendChild(td4);
		
		
		var td5 = document.createElement("td");
		td5.classList.add("col-4");
		td5.classList.add("DESCRIPTION");
		td5.setAttribute("ondblclick","inputBox(this)")
		if(data.DESCRIPTION != undefined){
		td5.innerText=data.DESCRIPTION
		}
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
	}else if(table == '결재'){
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
		headTh5.classList.add("col-1");
		headTh5.innerText = "약어명"
		codeContentHead.appendChild(headTh5);
		
		var headTh5_1 = document.createElement("th");
		headTh5_1.classList.add("col-1");
		headTh5_1.innerText = "양식"
		codeContentHead.appendChild(headTh5_1);
		
		var headTh6 = document.createElement("th");
		headTh6.classList.add("col-2");
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
		td4.classList.add("col-3");
		td4.classList.add("ENG");
		if(data.ENG){
		td4.innerText = data.ENG
		}
		td4.setAttribute("ondblclick","inputBox(this)")
		tr.appendChild(td4);
		
		
		var td5 = document.createElement("td");
		td5.classList.add("col-1");
		td5.classList.add("ABRVT");
		td5.setAttribute("ondblclick","inputBox(this)")
		if(data.ABRVT){
		td5.innerText=data.ABRVT
		}
		tr.appendChild(td5);
		
		var td5_1 = document.createElement("td");
		td5_1.classList.add("col-1");
		td5_1.classList.add("FORMBUTTON");
		td5_1.setAttribute("style","cursor: pointer;color: #FA5858;")
		td5_1.setAttribute("onclick","viewForm("+data.NO+",'"+data.NAME+"')")
		td5_1.innerText = "보기"
		tr.appendChild(td5_1);
	
		var td6 = document.createElement("td");
		td6.classList.add("col-2");
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
		
		if((TABLE != '동아리카테고리') && (TABLE != '결재')){
		
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
		td2.classList.add("ENG");
		td2.setAttribute("ondblclick","inputBox(this)")
		tr.appendChild(td2);
		
		var td3 = document.createElement("td");
		td3.classList.add("col-3");
		td3.classList.add("ABRVT");
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
		
		}else if(TABLE == '동아리카테고리'){
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
			td2.classList.add("ENG");
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
		}else if(TABLE == '결재'){
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
			td2.classList.add("col-3");
			td2.classList.add("ENG");
			td2.setAttribute("ondblclick","inputBox(this)")
			tr.appendChild(td2);
			
			var td3 = document.createElement("td");
			td3.classList.add("col-1");
			td3.classList.add("ABRBT");
			td3.setAttribute("ondblclick","inputBox(this)")
			tr.appendChild(td3);
			
			var td3_1 = document.createElement("td");
			td3_1.classList.add("col-1");
			td3_1.classList.add("FORMBUTTON");
			td3_1.setAttribute("style","cursor: pointer;")
			td3_1.innerText = "보기"
			tr.appendChild(td3_1);
			
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
	var ENG;
	var ABRVT;
	var DESCRIPTION;
	var NO = $("#edit").closest(".contentRow").children(".NO").text()
	if($("#edit").parent().hasClass("NAME")){
		NAME = text
		if($("#edit").closest(".contentRow").children(".DESCRIPTION").text()){
			DESCRIPTION = $("#edit").closest(".contentRow").children(".DESCRIPTION").text()
		}
		if($("#edit").closest(".contentRow").children(".ENG").text()){
			ENG = $("#edit").closest(".contentRow").children(".ENG").text();
		}
		if($("#edit").closest(".contentRow").children(".ABRVT").text()){
			ABRVT = $("#edit").closest(".contentRow").children(".ABRVT").text();
		}
	}else if($("#edit").parent().hasClass("DESCRIPTION")){
		DESCRIPTION = text
		if($("#edit").closest(".contentRow").children(".NAME").text()){
			NAME = $("#edit").closest(".contentRow").children(".NAME").text();
		}
		if($("#edit").closest(".contentRow").children(".ENG").text()){
			ENG = $("#edit").closest(".contentRow").children(".ENG").text();
		}
		if($("#edit").closest(".contentRow").children(".ABRVT").text()){
			ABRVT = $("#edit").closest(".contentRow").children(".ABRVT").text();
		}
	}else if($("#edit").parent().hasClass("ENG")){
		ENG =text;
		if($("#edit").closest(".contentRow").children(".NAME").text()){
			NAME = $("#edit").closest(".contentRow").children(".NAME").text();
		}
		if($("#edit").closest(".contentRow").children(".DESCRIPTION").text()){
			DESCRIPTION = $("#edit").closest(".contentRow").children(".DESCRIPTION").text()
		}
		if($("#edit").closest(".contentRow").children(".ABRVT").text()){
			ABRVT = $("#edit").closest(".contentRow").children(".ABRVT").text();
		}
	}else if($("#edit").parent().hasClass("ABRVT")){
		ABRVT = text;
		if($("#edit").closest(".contentRow").children(".ENG").text()){
			ENG = $("#edit").closest(".contentRow").children(".ENG").text();
		}
		if($("#edit").closest(".contentRow").children(".DESCRIPTION").text()){
			DESCRIPTION = $("#edit").closest(".contentRow").children(".DESCRIPTION").text()
		}
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
				"ENG" : ENG,
				"ABRVT" : ABRVT,
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
					"ENG" : ENG,
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

 	
 	window.addEventListener('DOMContentLoaded', function(){
		$("#noti").click();
		var navtab = document.getElementById("code")
		navtab.setAttribute("style", "border-right: 5px solid #FA5858");
	   });
</script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/staff_common/staff_sidevar.jsp"></jsp:include>

	<!-- 페이지 내용 부분 시작 (이 부분만 카피해서 사용할것. 카피 후 삭제) -->
	<div class="page-content p-5 pt-4" id="content">
		<!-- 토글 버튼 -->
		<button id="sidebarCollapse" type="button"
			class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-3" style="color: #FA5858">
			<i class="fa fa-bars mr-2"></i><small
				class="text-uppercase font-weight-bold">MENU</small>
		</button>

		<!-- 여기다 작성하세요 -->



		<div class="row px-3 mt-4">
			<div class="col">
				<div class="row ps-1 p-2 mb-3 box" style="height: 45px; align-items: center">
					
					<div  class="col text-center" style="border-right: 2px solid #ededed;">
						<div class="row" style="justify-content: center">
							<div id="noti" class="col-auto px-3" style="cursor: pointer; border-radius: 2rem;" onclick="getDivisionList('공지',this)">
							 공지구분
							</div>
						</div>
					</div>
					
					<div  class="col text-center"	style="border-right: 2px solid #ededed;">
						<div class="row" style="justify-content: center">
							<div id="vlntr" class="col-auto px-3" style="cursor: pointer; border-radius: 2rem;" onclick="getDivisionList('봉사',this)">
							봉사구분
							</div>
						</div>
					</div>
					
					<div  class="col text-center" style=" border-right: 2px solid #ededed;">
						<div class="row" style="justify-content: center">
							<div id="pstn" class="col-auto px-3" style="cursor: pointer; border-radius: 2rem;" onclick="getDivisionList('직책',this)">
							직책구분
							</div>
						</div>
					</div>
					
					<div  class="col text-center" style="border-right: 2px solid #ededed;">
						<div class="row" style="justify-content: center">
							<div id="apv" class="col-auto px-3" style="cursor: pointer; border-radius: 2rem;" onclick="getDivisionList('결재',this)">
							결재구분
							</div>
						</div>
					</div>
					
					<div class="col text-center"	style="border-right: 2px solid #ededed;">
						<div class="row" style="justify-content: center">
							<div  id="alarm" class="col-auto px-3" style="cursor: pointer; border-radius: 2rem;" onclick="getDivisionList('알람',this)">
							알람구분
							</div>
						</div>
					</div>
					
					<div class="col text-center" style="border-right: 2px solid #ededed;">
						<div class="row" style="justify-content: center">
							<div id="clubDivision" class="col-auto px-3" style="cursor: pointer; border-radius: 2rem;" onclick="getDivisionList('동아리',this)">
							동아리구분
							</div>
						</div>
					</div>
					
					<div class="col text-center">
						<div class="row" style="justify-content: center">
							<div id="clubDeptCategory" class="col-auto px-3" style="cursor: pointer; border-radius: 2rem;" onclick="getDivisionList('동아리카테고리',this)">
							동아리카테고리
							</div>
						</div>
					</div>
				</div>

				<div class="row box p-3" style="height: 77vh;">

					<div class="col px-0">
						<input id="TABLE" type="hidden" value="공지">
						<div class="row justify-content-end">
					
							<div class="col-auto">
								<button onclick="plusCode()" type="button"
									class="btn btn-sm border-0" style="color: blue">추가</button>
								<button onclick="deleteRow()" type="button"
									class="btn btn-sm border-0" style="color: red">삭제</button>
								<button onclick="save()" type="button"
									class="btn btn-sm border-0">저장</button>
							</div>

						</div>

						<div class="row">
							<div class="col">
								<table class="table table-hover caption-top table-sm">
									<caption class="ps-2" style="font-size: 0.8rem;">
										코드내역 <span id="contentCount"></span>
									</caption>
									<thead style="background-color: rgb(252, 243, 243)">
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

	</div>
	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-xl">
			<div class="modal-content">
				<div class="modal-header" id="modalHead">
					<button type="button" class="btn" id="saveApvFormButton">저장</button>
					<button onclick="modalClosesss()" type="button" class="btn-close"></button>
				</div>
				<div class="row">
					<div class="col text-center" style="font-size: 1.5em; font-weight: bold;" id="title"></div>
				</div>
				<div class="modal-body">
					<div id="modalBodyRow" class="row">
						<div class="col" >
							<textarea id="modalBody"></textarea>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
	var myModal = new bootstrap.Modal(document.getElementById('staticBackdrop'))
	function viewForm(NO,NAME){
		var title = document.getElementById("title");
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		 xhr.onreadystatechange = function () {
		if(xhr.readyState == 4 && xhr.status == 200){
		var result = JSON.parse(xhr.responseText);
		title.innerText = NAME;
		var modalBody = document.getElementById("modalBody")
		var saveApvFormButton = document.getElementById("saveApvFormButton");
		saveApvFormButton.setAttribute("onclick","saveApvForm("+NO+")")
		tinyMCE.activeEditor.resetContent()
		
		if(result.FORM == null){
		}else{
			tinyMCE.activeEditor.setContent(result.FORM);
		}
		myModal.show();
			}      
		}	
		xhr.open("post","../restDivision/getApvForm",false);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("NO=" + NO);
	}
		
		
	function saveApvForm(NO){
		var FORM = tinyMCE.activeEditor.getContent();
		var ApvForm = {
				"FORM" : FORM,
				"NO":NO
			}
		var ApvFormData = JSON.stringify(ApvForm);
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		 xhr.onreadystatechange = function () {
		if(xhr.readyState == 4 && xhr.status == 200){
		var result = JSON.parse(xhr.responseText);
		swal("","저장완료","success")
		}      
		}	
		xhr.open("post","../restDivision/saveApvForm",false);
		xhr.setRequestHeader("Content-type","application/json");
		xhr.send(ApvFormData);
	}
	
	function modalClosesss(){
		myModal.hide()
	}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/@tinymce/tinymce-webcomponent@2/dist/tinymce-webcomponent.min.js"></script>

</body>
</html>