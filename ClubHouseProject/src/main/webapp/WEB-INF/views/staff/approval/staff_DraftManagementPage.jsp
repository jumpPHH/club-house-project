<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기안서작성 페이지</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="/cbh/resources/css/staff_MainPage.css">
<script
	src="https://cdn.tiny.cloud/1/bdorzubong3byjkwg9kl0ayxl92mhi8e0f24djie6ukepumt/tinymce/6/tinymce.min.js"
	referrerpolicy="origin"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
body{
font-family: 'Noto Sans KR', sans-serif;


}
   main>div>div>div{
      margin:2vh;
      border: 0px solid black;
      border-radius: 20px 20px 20px 20px;
      padding: 17px;
       background-color: white
/*       background-color:#EBF7FF; */
   }
</style>

<script type="text/javascript">
	function getRequestedApvList(type,e){
		$("#type").val(type)
		$(".divisionTab").removeClass("table-active");
		if(e){
			e.classList.add("table-active")
		}
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		 xhr.onreadystatechange = function () {
		if(xhr.readyState == 4 && xhr.status == 200){
 		 var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON
		
			var ApvHead = document.getElementById("ApvHead");
			ApvHead.innerHTML =""
			
  		 	var th1 =  document.createElement("th");
  		 	th1.classList.add("col-1");
  		 	th1.innerText="기안번호"
  		 	ApvHead.appendChild(th1);

  		 	var th2 =  document.createElement("th");
  		 	th2.classList.add("col-1");
  		 	th2.innerText="구분"
  		 	ApvHead.appendChild(th2);
  
  		 	var th3 =  document.createElement("th");
  		 	th3.classList.add("col-7");
  		 	th3.innerText="제목"
  		 	ApvHead.appendChild(th3);

  		 	var th4 =  document.createElement("th");
  		 	th4.classList.add("col-1");
  		 	th4.innerText="기안자"
  		 	ApvHead.appendChild(th4);
  		 
  		 	var th5 =  document.createElement("th");
  		 	th5.classList.add("col-1");
  		 	th5.innerText="상태"
  		 	ApvHead.appendChild(th5);
  		 
  		 	var th6 =  document.createElement("th");
  		 	th6.classList.add("col-1");
  		 	th6.innerText="상세"
  		 	ApvHead.appendChild(th6);
  		 		 
  		 	var ApvBody = document.getElementById("ApvBody");
  		 	ApvBody.innerHTML="";
  		 	
  		 	for(var Apv of result.ApvList){
  		 	if((Apv.STAFF_MID_ID != result.staffVO.staff_id) && (Apv.APV_REJECT_DATE != undefined)){
  		 		
  		 	}else{
  		 		var tr = document.createElement("tr");
  		 		tr.classList.add("text-center");
  		 		ApvBody.appendChild(tr);
  		 		
  		 		
  		 		var td1 = document.createElement("td");
  		 		td1.classList.add("col-1");
  		 		td1.innerText = Apv.APV_NO
  		 		tr.appendChild(td1);
  		 		
  		 		
  		 		var td2 = document.createElement("td");
  		 		td2.classList.add("col-1");
  		 		td2.innerText = Apv.APV_DIV_NAME
  		 		tr.appendChild(td2);
  		 		
  		 		
  		 		var td3 = document.createElement("td");
  		 		td3.classList.add("col-7");
  		 		td3.classList.add("text-start");
  		 		td3.innerText = Apv.APV_TITLE
  		 		tr.appendChild(td3);
  		 		
	 			var td4 = document.createElement("td");
  		 		td4.classList.add("col-1");
  		 		td4.innerText = Apv.STAFF_NAME;
  		 		tr.appendChild(td4);	
  		 		if(Apv.STAFF_MID_ID == result.staffVO.staff_id){
  		 			if((Apv.APV_MID_DATE == undefined) && (Apv.APV_REJECT_DATE == undefined)){
  		 				var td5 = document.createElement("td");
  		  		 		td5.classList.add("col-1");
  		  		 		td5.innerText = "미결재"
  		  		 		tr.appendChild(td5);
  		 			}else if((Apv.APV_MID_DATE == undefined) && (Apv.APV_REJECT_DATE != undefined)){
  		 				var td5 = document.createElement("td");
  		  		 		td5.classList.add("col-1");
  		  		 		td5.innerText = "반려"
  		  		 		tr.appendChild(td5);
  		 			}else if(Apv.APV_MID_DATE != undefined){
  		 				var td5 = document.createElement("td");
  		  		 		td5.classList.add("col-1");
  		  		 		td5.innerText = "결재"
  		  		 		tr.appendChild(td5);
  		 			}
  		 			
  		 		}else if(Apv.STAFF_FNL_ID == result.staffVO.staff_id){
  		 			if((Apv.APV_FNL_DATE == undefined) && (Apv.APV_REJECT_DATE == undefined)){
  		 				var td5 = document.createElement("td");
  		  		 		td5.classList.add("col-1");
  		  		 		td5.innerText = "미결재"
  		  		 		tr.appendChild(td5);
  		 				
  		 			}else if((Apv.APV_FNL_DATE == undefined) && (Apv.APV_REJECT_DATE != undefined)){
  		 				var td5 = document.createElement("td");
  		  		 		td5.classList.add("col-1");
  		  		 		td5.innerText = "반려"
  		  		 		tr.appendChild(td5);
  		 			}else if(Apv.APV_FNL_DATE != undefined){
  		 				var td5 = document.createElement("td");
  		  		 		td5.classList.add("col-1");
  		  		 		td5.innerText = "결재"
  		  		 		tr.appendChild(td5);
  		 			}
  		 			
  		 		}
  		 		
  		 		var td6 = document.createElement("td");
  		 		td6.classList.add("col-1");
  		 		td6.setAttribute("onclick","getApv('"+Apv.APV_NO+"','Requested')")
  		 		td6.innerText = "보기"
  		 		tr.appendChild(td6);
  		 	}
  		 	}
		}      
			}	
		xhr.open("post","../restApproval/getRequestedApvList",false);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("type=" + type);
	}
	
	function getMyApvList(type,e){
		
		$("#type").val(type)
		$(".divisionTab").removeClass("table-active");
		if(e){
			e.classList.add("table-active")
		}
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		 xhr.onreadystatechange = function () {
		if(xhr.readyState == 4 && xhr.status == 200){
  		 var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
			var ApvHead = document.getElementById("ApvHead");
			ApvHead.innerHTML =""
			
  		 	var th1 =  document.createElement("th");
  		 	th1.classList.add("col-1");
  		 	th1.innerText="기안번호"
  		 	ApvHead.appendChild(th1);

  		 	var th2 =  document.createElement("th");
  		 	th2.classList.add("col-1");
  		 	th2.innerText="구분"
  		 	ApvHead.appendChild(th2);
  
  		 	var th3 =  document.createElement("th");
  		 	th3.classList.add("col-7");
  		 	th3.innerText="제목"
  		 	ApvHead.appendChild(th3);

  		 	var th4 =  document.createElement("th");
  		 	th4.classList.add("col-1");
  		 	th4.innerText="결재자"
  		 	ApvHead.appendChild(th4);
  		 
  		 	var th5 =  document.createElement("th");
  		 	th5.classList.add("col-1");
  		 	th5.innerText="상태"
  		 	ApvHead.appendChild(th5);
  		 
  		 	var th6 =  document.createElement("th");
  		 	th6.classList.add("col-1");
  		 	th6.innerText="상세"
  		 	ApvHead.appendChild(th6);
  		 
  		 
  		 
  		 
  		 
			var ApvBody = document.getElementById("ApvBody");
  		 	ApvBody.innerHTML="";
  		 
  		 	for(var Apv of result.ApvList){
  		 		
  		 		var tr = document.createElement("tr");
  		 		tr.classList.add("text-center");
  		 		ApvBody.appendChild(tr);
  		 		
  		 		
  		 		var td1 = document.createElement("td");
  		 		td1.classList.add("col-1");
  		 		td1.innerText = Apv.APV_NO
  		 		tr.appendChild(td1);
  		 		
  		 		
  		 		var td2 = document.createElement("td");
  		 		td2.classList.add("col-1");
  		 		td2.innerText = Apv.APV_DIV_NAME
  		 		tr.appendChild(td2);
  		 		
  		 		
  		 		var td3 = document.createElement("td");
  		 		td3.classList.add("col-7");
  		 		td3.classList.add("text-start");
  		 		td3.innerText = Apv.APV_TITLE
  		 		tr.appendChild(td3);
  		 		
  		 		if((Apv.STAFF_MID_NAME != undefined) && (Apv.APV_MID_DATE == undefined) ){
  		 			var td4 = document.createElement("td");
  	  		 		td4.classList.add("col-1");
  	  		 		td4.innerText = Apv.STAFF_MID_NAME;
  	  		 		tr.appendChild(td4);	
  		 		}else if(Apv.STAFF_MID_NAME == undefined){
  		 			var td4 = document.createElement("td");
  		 			td4.classList.add("col-1");
  		 			td4.innerText = Apv.STAFF_FNL_NAME;
  		 			tr.appendChild(td4);
  		 		}else if(Apv.STAFF_MID_NAME != undefined && Apv.APV_MID_DATE != undefined){
  		 			var td4 = document.createElement("td");
  		 			td4.classList.add("col-1");
  		 			td4.innerText = Apv.STAFF_FNL_NAME;
  		 			tr.appendChild(td4);
  		 		}
  		 		
  				if(Apv.STAFF_MID_NAME != undefined){
  		 			if((Apv.APV_MID_DATE == undefined) && (Apv.APV_REJECT_DATE == undefined)){
  		  		 		var td5 = document.createElement("td");
  		  		 		td5.classList.add("col-1");
  		  		 		td5.innerText = "진행중"
  		  		 		tr.appendChild(td5);
  		  		 	}else if((Apv.APV_MID_DATE != undefined) && (Apv.APV_REJECT_DATE == undefined)){
  		  		 			var td5 = document.createElement("td");
  		  	  		 		td5.classList.add("col-1");
  		  	  		 		td5.innerText = "결재완료"
  		  	  		 		tr.appendChild(td5);
  		  		 	}else if((Apv.APV_MID_DATE == undefined) && (Apv.APV_REJECT_DATE != undefined)){
  		  		 			var td5 = document.createElement("td");
  		  	  		 		td5.classList.add("col-1");
  		  	  		 		td5.innerText = "반려"
  		  	  		 		tr.appendChild(td5);
  		  		 	}
  		 			
  		 		}else if(Apv.STAFF_FNL_NAME != undefined){
  		 			if((Apv.APV_FNL_DATE == undefined) && (Apv.APV_REJECT_DATE == undefined)){
  		  		 		var td5 = document.createElement("td");
  		  		 		td5.classList.add("col-1");
  		  		 		td5.innerText = "진행중"
  		  		 		tr.appendChild(td5);
  		  		 	}else if((Apv.APV_FNL_DATE != undefined) && (Apv.APV_REJECT_DATE == undefined)){
  		  		 			var td5 = document.createElement("td");
  		  	  		 		td5.classList.add("col-1");
  		  	  		 		td5.innerText = "결재완료"
  		  	  		 		tr.appendChild(td5);
  		  		 	}else if((Apv.APV_FNL_DATE == undefined) && (Apv.APV_REJECT_DATE != undefined)){
  		  		 			var td5 = document.createElement("td");
  		  	  		 		td5.classList.add("col-1");
  		  	  		 		td5.innerText = "반려"
  		  	  		 		tr.appendChild(td5);
  		  		 	}
  		 			
  		 		}
  		 		
  		 		var td6 = document.createElement("td");
  		 		td6.classList.add("col-1");
  		 		td6.setAttribute("onclick","getApv('"+Apv.APV_NO+"','My')")
  		 		td6.innerText = "보기"
  		 		tr.appendChild(td6);
  		 	}
  		 
			}      
		}	
		xhr.open("post","../restApproval/getMyApvList",false);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("type=" + type); 
		
	}
	
	function getApv(e,division){
		var APV_NO = e;
		var myModal = new bootstrap.Modal(document.getElementById('staticBackdrop'))
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		 xhr.onreadystatechange = function () {
		if(xhr.readyState == 4 && xhr.status == 200){
 		 var result = JSON.parse(xhr.responseText);
 		
 		 var apvNo = document.getElementById("apvNo");
 		 apvNo.innerText = result.Apv.APV_NO;
 		 
 		 var apvContent = document.getElementById("apvContent");
 		 apvContent.innerText = result.Apv.APV_TITLE;
 		 
 		var APPROVAL_NAMES = document.getElementById("APPROVAL_NAMES");
 		APPROVAL_NAMES.innerHTML = "";
 		var APPROVAL_IMG = document.getElementById("APPROVAL_IMG");
 		APPROVAL_IMG.innerHTML = "";
 		var APPROVAL_DATE = document.getElementById("APPROVAL_DATE");
 		APPROVAL_DATE.innerHTML = "";
 		
 		var STAFF_FIS_NAME = document.createElement("div");
 		STAFF_FIS_NAME.classList.add("col-2");
 		STAFF_FIS_NAME.classList.add("border");
 		STAFF_FIS_NAME.classList.add("text-center");
 		STAFF_FIS_NAME.setAttribute("style","width:5rem;")
		STAFF_FIS_NAME.innerText = result.Apv.STAFF_FIS_NAME;
		APPROVAL_NAMES.appendChild(STAFF_FIS_NAME);
 		
		var APV_FIS_IMG_DIV = document.createElement("div") 
		APV_FIS_IMG_DIV.classList.add("col-2");
		APV_FIS_IMG_DIV.classList.add("py-1");
		APV_FIS_IMG_DIV.classList.add("border");
		APV_FIS_IMG_DIV.classList.add("text-center");
		APV_FIS_IMG_DIV.setAttribute("style","width:5rem;");
		APPROVAL_IMG.appendChild(APV_FIS_IMG_DIV);
			
		var APV_FIS_IMG = document.createElement("img");
		APV_FIS_IMG.classList.add("img-fluid");
		APV_FIS_IMG.setAttribute("src","/cbh/resources/img/staff/approval.png");
		APV_FIS_IMG_DIV.appendChild(APV_FIS_IMG);
 		
		var APV_FIS_DATE = document.createElement("div")
		APV_FIS_DATE.classList.add("col-2");
		APV_FIS_DATE.classList.add("border");
		APV_FIS_DATE.classList.add("text-center");
		APV_FIS_DATE.setAttribute("style","width:5rem;");
		APV_FIS_DATE.innerText = moment(result.Apv.APV_WRITEDATE).format('YYYY/MM/DD')
		APPROVAL_DATE.appendChild(APV_FIS_DATE);
		
		
 		if(result.Apv.STAFF_MID_NAME != undefined){
 			var STAFF_MID_NAME = document.createElement("div");
 			STAFF_MID_NAME.classList.add("col-2");
 			STAFF_MID_NAME.classList.add("border");
 			STAFF_MID_NAME.classList.add("text-center");
 			STAFF_MID_NAME.setAttribute("style","width:5rem;")
 			STAFF_MID_NAME.innerText = result.Apv.STAFF_MID_NAME;
 			APPROVAL_NAMES.appendChild(STAFF_MID_NAME);
 			if(result.Apv.APV_MID_DATE != undefined){
 				var APV_MID_IMG_DIV = document.createElement("div") 
 				APV_MID_IMG_DIV.classList.add("col-2");
 				APV_MID_IMG_DIV.classList.add("py-1");
 				APV_MID_IMG_DIV.classList.add("border");
 				APV_MID_IMG_DIV.classList.add("text-center");
 				APV_MID_IMG_DIV.setAttribute("style","width:5rem;");
 				APPROVAL_IMG.appendChild(APV_MID_IMG_DIV);
 				
 				var APV_MID_IMG = document.createElement("img");
 				APV_MID_IMG.classList.add("img-fluid");
 				APV_MID_IMG.setAttribute("src","/cbh/resources/img/staff/approval.png");
 				APV_MID_IMG_DIV.appendChild(APV_MID_IMG);
 			
 				var APV_MID_DATE = document.createElement("div")
 				APV_MID_DATE.classList.add("col-2");
 				APV_MID_DATE.classList.add("border");
 				APV_MID_DATE.classList.add("text-center");
 				APV_MID_DATE.setAttribute("style","width:5rem;");
 				APV_MID_DATE.innerText= moment(result.Apv.APV_MID_DATE).format('YYYY/MM/DD')
 				APPROVAL_DATE.appendChild(APV_MID_DATE);
 				
 				if(result.Apv.APV_FNL_DATE != undefined){
 					var STAFF_FNL_NAME = document.createElement("div");
 					STAFF_FNL_NAME.classList.add("col-2");
 					STAFF_FNL_NAME.classList.add("border");
 					STAFF_FNL_NAME.classList.add("text-center");
 					STAFF_FNL_NAME.setAttribute("style","width:5rem;")
 		 			STAFF_FNL_NAME.innerText = result.Apv.STAFF_FNL_NAME;
 		 			APPROVAL_NAMES.appendChild(STAFF_FNL_NAME);
 					
 					var APV_FML_IMG_DIV = document.createElement("div") 
 	 				APV_FML_IMG_DIV.classList.add("col-2");
 					APV_FML_IMG_DIV.classList.add("py-1");
 					APV_FML_IMG_DIV.classList.add("border");
 					APV_FML_IMG_DIV.classList.add("text-center");
 					APV_FML_IMG_DIV.setAttribute("style","width:5rem;");
 	 				APPROVAL_IMG.appendChild(APV_FML_IMG_DIV);
 	 				
 	 				var APV_FML_IMG = document.createElement("img");
 	 				APV_FML_IMG.classList.add("img-fluid");
 	 				APV_FML_IMG.setAttribute("src","/cbh/resources/img/staff/approval.png");
 	 				APV_FML_IMG_DIV.appendChild(APV_FML_IMG);
 	 			
 	 				var APV_FNL_DATE = document.createElement("div")
 	 				APV_FNL_DATE.classList.add("col-2");
 	 				APV_FNL_DATE.classList.add("border");
 	 				APV_FNL_DATE.classList.add("text-center");
 	 				APV_FNL_DATE.setAttribute("style","width:5rem;");
 	 				APV_FNL_DATE.innerText= moment(result.Apv.APV_FNL_DATE).format('YYYY/MM/DD')
 	 				APPROVAL_DATE.appendChild(APV_FNL_DATE);
 				}else{
 					var STAFF_FNL_NAME = document.createElement("div");
 					STAFF_FNL_NAME.classList.add("col-2");
 					STAFF_FNL_NAME.classList.add("border");
 					STAFF_FNL_NAME.classList.add("text-center");
 					STAFF_FNL_NAME.setAttribute("style","width:5rem;")
 		 			STAFF_FNL_NAME.innerText = result.Apv.STAFF_FNL_NAME;
 		 			APPROVAL_NAMES.appendChild(STAFF_FNL_NAME);
 					
 					var APV_FML_IMG_DIV = document.createElement("div") 
 	 				APV_FML_IMG_DIV.classList.add("col-2");
 					APV_FML_IMG_DIV.classList.add("py-1");
 					APV_FML_IMG_DIV.classList.add("border");
 					APV_FML_IMG_DIV.classList.add("text-center");
 					APV_FML_IMG_DIV.setAttribute("style","width:5rem;");
 	 				APPROVAL_IMG.appendChild(APV_FML_IMG_DIV);
 	 				
 	 				var APV_FNL_DATE = document.createElement("div")
 	 				APV_FNL_DATE.classList.add("col-2");
 	 				APV_FNL_DATE.classList.add("border");
 	 				APV_FNL_DATE.classList.add("text-center");
 	 				APV_FNL_DATE.setAttribute("style","width:5rem;");
 	 				APPROVAL_DATE.appendChild(APV_FNL_DATE);
 				}
 			}else if((result.Apv.APV_MID_DATE == undefined) && (result.Apv.APV_REJECT_DATE == undefined)){
 				var APV_MID_IMG_DIV = document.createElement("div") 
 				APV_MID_IMG_DIV.classList.add("col-2");
 				APV_MID_IMG_DIV.classList.add("py-1");
 				APV_MID_IMG_DIV.classList.add("border");
 				APV_MID_IMG_DIV.classList.add("text-center");
 				APV_MID_IMG_DIV.setAttribute("style","width:5rem;");
 				APPROVAL_IMG.appendChild(APV_MID_IMG_DIV);
 			
 				var APV_MID_DATE = document.createElement("div")
 				APV_MID_DATE.classList.add("col-2");
 				APV_MID_DATE.classList.add("border");
 				APV_MID_DATE.classList.add("text-center");
 				APV_MID_DATE.setAttribute("style","width:5rem;");
 				APPROVAL_DATE.appendChild(APV_MID_DATE);
 			
 				var STAFF_FNL_NAME = document.createElement("div");
				STAFF_FNL_NAME.classList.add("col-2");
				STAFF_FNL_NAME.classList.add("border");
				STAFF_FNL_NAME.classList.add("text-center");
				STAFF_FNL_NAME.setAttribute("style","width:5rem;")
		 		STAFF_FNL_NAME.innerText = result.Apv.STAFF_FNL_NAME;
		 		APPROVAL_NAMES.appendChild(STAFF_FNL_NAME);
					
				var APV_FML_IMG_DIV = document.createElement("div") 
 				APV_FML_IMG_DIV.classList.add("col-2");
				APV_FML_IMG_DIV.classList.add("py-1");
				APV_FML_IMG_DIV.classList.add("border");
				APV_FML_IMG_DIV.classList.add("text-center");
				APV_FML_IMG_DIV.setAttribute("style","width:5rem;");
 				APPROVAL_IMG.appendChild(APV_FML_IMG_DIV);
 				
 				var APV_FNL_DATE = document.createElement("div")
 				APV_FNL_DATE.classList.add("col-2");
 				APV_FNL_DATE.classList.add("border");
 				APV_FNL_DATE.classList.add("text-center");
 				APV_FNL_DATE.setAttribute("style","width:5rem;");
 				APPROVAL_DATE.appendChild(APV_FNL_DATE);
 			}else if((result.Apv.APV_MID_DATE == undefined) && (result.Apv.APV_REJECT_DATE != undefined)){
 				var APV_REJECT_IMG_DIV = document.createElement("div") 
 				APV_REJECT_IMG_DIV.classList.add("col-2");
 				APV_REJECT_IMG_DIV.classList.add("py-1");
 				APV_REJECT_IMG_DIV.classList.add("border");
 				APV_REJECT_IMG_DIV.classList.add("text-center");
 				APV_REJECT_IMG_DIV.setAttribute("style","width:5rem;");
 				APPROVAL_IMG.appendChild(APV_REJECT_IMG_DIV);
 				
 				var APV_REJECT_IMG = document.createElement("img");
 				APV_REJECT_IMG.classList.add("img-fluid");
 				APV_REJECT_IMG.setAttribute("src","/cbh/resources/img/staff/reject.png");
 				APV_REJECT_IMG_DIV.appendChild(APV_REJECT_IMG);
 			
 				var APV_REJECT_DATE = document.createElement("div")
 				APV_REJECT_DATE.classList.add("col-2");
 				APV_REJECT_DATE.classList.add("border");
 				APV_REJECT_DATE.classList.add("text-center");
 				APV_REJECT_DATE.setAttribute("style","width:5rem;");
 				APV_REJECT_DATE.innerText= moment(result.Apv.APV_REJECT_DATE).format('YYYY/MM/DD')
 				APPROVAL_DATE.appendChild(APV_REJECT_DATE);
 				
 				var STAFF_FNL_NAME = document.createElement("div");
				STAFF_FNL_NAME.classList.add("col-2");
				STAFF_FNL_NAME.classList.add("border");
				STAFF_FNL_NAME.classList.add("text-center");
				STAFF_FNL_NAME.setAttribute("style","width:5rem;")
		 		STAFF_FNL_NAME.innerText = result.Apv.STAFF_FNL_NAME;
		 		APPROVAL_NAMES.appendChild(STAFF_FNL_NAME);
					
				var APV_FML_IMG_DIV = document.createElement("div") 
 				APV_FML_IMG_DIV.classList.add("col-2");
				APV_FML_IMG_DIV.classList.add("py-1");
				APV_FML_IMG_DIV.classList.add("border");
				APV_FML_IMG_DIV.classList.add("text-center");
				APV_FML_IMG_DIV.setAttribute("style","width:5rem;");
 				APPROVAL_IMG.appendChild(APV_FML_IMG_DIV);
 				
 				var APV_FNL_DATE = document.createElement("div")
 				APV_FNL_DATE.classList.add("col-2");
 				APV_FNL_DATE.classList.add("border");
 				APV_FNL_DATE.classList.add("text-center");
 				APV_FNL_DATE.setAttribute("style","width:5rem;");
 				APPROVAL_DATE.appendChild(APV_FNL_DATE);
 			}
 		}else {
 			var STAFF_FNL_NAME = document.createElement("div");
 			STAFF_FNL_NAME.classList.add("col-2");
 			STAFF_FNL_NAME.classList.add("border");
 			STAFF_FNL_NAME.classList.add("text-center");
 			STAFF_FNL_NAME.setAttribute("style","width:5rem;")
 			STAFF_FNL_NAME.innerText = result.Apv.STAFF_FNL_NAME;
 			APPROVAL_NAMES.appendChild(STAFF_FNL_NAME);
 			
 			if(result.Apv.APV_FNL_DATE != undefined){
 				var APV_FML_IMG_DIV = document.createElement("div") 
 				APV_FML_IMG_DIV.classList.add("col-2");
				APV_FML_IMG_DIV.classList.add("py-1");
				APV_FML_IMG_DIV.classList.add("border");
				APV_FML_IMG_DIV.classList.add("text-center");
				APV_FML_IMG_DIV.setAttribute("style","width:5rem;");
 				APPROVAL_IMG.appendChild(APV_FML_IMG_DIV);
 				
 				var APV_FML_IMG = document.createElement("img");
 				APV_FML_IMG.classList.add("img-fluid");
 				APV_FML_IMG.setAttribute("src","/cbh/resources/img/staff/approval.png");
 				APV_FML_IMG_DIV.appendChild(APV_FML_IMG);
 			
 				var APV_FNL_DATE = document.createElement("div")
 				APV_FNL_DATE.classList.add("col-2");
 				APV_FNL_DATE.classList.add("border");
 				APV_FNL_DATE.classList.add("text-center");
 				APV_FNL_DATE.setAttribute("style","width:5rem;");
 				APV_FNL_DATE.innerText= moment(result.Apv.APV_FNL_DATE).format('YYYY/MM/DD')
 				APPROVAL_DATE.appendChild(APV_FNL_DATE);
 			}else if((result.Apv.APV_FNL_DATE == undefined) && (result.Apv.APV_REJECT_DATE == undefined)){
 				var APV_FML_IMG_DIV = document.createElement("div") 
 				APV_FML_IMG_DIV.classList.add("col-2");
				APV_FML_IMG_DIV.classList.add("py-1");
				APV_FML_IMG_DIV.classList.add("border");
				APV_FML_IMG_DIV.classList.add("text-center");
				APV_FML_IMG_DIV.setAttribute("style","width:5rem;");
 				APPROVAL_IMG.appendChild(APV_FML_IMG_DIV);
 				
 				var APV_FNL_DATE = document.createElement("div")
 				APV_FNL_DATE.classList.add("col-2");
 				APV_FNL_DATE.classList.add("border");
 				APV_FNL_DATE.classList.add("text-center");
 				APV_FNL_DATE.setAttribute("style","width:5rem;");
 				APPROVAL_DATE.appendChild(APV_FNL_DATE);
 			}else if((result.Apv.APV_FNL_DATE == undefined) && (result.Apv.APV_REJECT_DATE != undefined)){
 				var APV_REJECT_IMG_DIV = document.createElement("div") 
 				APV_REJECT_IMG_DIV.classList.add("col-2");
				APV_REJECT_IMG_DIV.classList.add("py-1");
				APV_REJECT_IMG_DIV.classList.add("border");
				APV_REJECT_IMG_DIV.classList.add("text-center");
				APV_REJECT_IMG_DIV.setAttribute("style","width:5rem;");
 				APPROVAL_IMG.appendChild(APV_REJECT_IMG_DIV);
 				
 				var APV_REJECT_IMG = document.createElement("img");
 				APV_REJECT_IMG.classList.add("img-fluid");
 				APV_REJECT_IMG.setAttribute("src","/cbh/resources/img/staff/reject.png");
 				APV_REJECT_IMG_DIV.appendChild(APV_REJECT_IMG);
 			
 				var APV_REJECT_DATE = document.createElement("div")
 				APV_REJECT_DATE.classList.add("col-2");
 				APV_REJECT_DATE.classList.add("border");
 				APV_REJECT_DATE.classList.add("text-center");
 				APV_REJECT_DATE.setAttribute("style","width:5rem;");
 				APV_REJECT_DATE.innerText= moment(result.Apv.APV_REJECT_DATE).format('YYYY/MM/DD')
 				APPROVAL_DATE.appendChild(APV_REJECT_DATE);
 				
 				
 			}
 		}
 		
 		var rejectTitle = document.getElementById("rejectTitle")
 		var reject = document.getElementById("reject");
 		rejectTitle.innerHTML="";
 		reject.innerHTML="";
 		if(division == 'My'){
 			var approvalButtonCol = document.getElementById("approvalButtonCol");
 			approvalButtonCol.innerHTML = "";
 			
 			if(result.Apv.APV_REJECT_RSN != undefined){
				rejectTitle.innerText = "반려사유"
		
				reject.innerText = result.Apv.APV_REJECT_RSN;
 			}
 		}else if(division == 'Requested'){
	 					var approvalButtonCol = document.getElementById("approvalButtonCol");
	 		 			approvalButtonCol.innerHTML = "";
 			if(result.Apv.STAFF_MID_ID == result.staffVO.staff_id){
 				if((result.Apv.APV_MID_DATE == undefined) && (result.Apv.APV_REJECT_DATE == undefined)){
 					rejectTitle.innerText = "반려사유"
 						
 						var rejectTextarea = document.createElement("textarea")
 						rejectTextarea.classList.add("form-control");
 					rejectTextarea.setAttribute("id","CONTENT");
 						reject.appendChild(rejectTextarea);
	 		 			
 						var approvalButten = document.createElement("button")
	 		 			approvalButten.classList.add("btn");
	 		 			approvalButten.setAttribute("type","button");
	 		 			approvalButten.setAttribute("onclick","approval('"+result.Apv.APV_NO+"','MID')");
	 		 			approvalButten.innerText = "결재"
	 		 			approvalButtonCol.appendChild(approvalButten);
	 		 			
	 		 			var rejectButten = document.createElement("button")
	 		 			rejectButten.classList.add("btn");
	 		 			rejectButten.setAttribute("onclick","reject('"+result.Apv.APV_NO+"')");
	 		 			rejectButten.setAttribute("type","button");
	 		 			rejectButten.innerText = "반려"
	 		 			approvalButtonCol.appendChild(rejectButten);
		 			}else if((result.Apv.APV_MID_DATE == undefined) && (result.Apv.APV_REJECT_DATE != undefined)){
		 				if(result.Apv.APV_REJECT_RSN != undefined){
	 					rejectTitle.innerText = "반려사유"
	 			
	 					reject.innerText = result.Apv.APV_REJECT_RSN;
	 	 				}	
		 			}else if(reslut.Apv.APV_MID_DATE != undefined){
		 				
		 			}
 		
 			}else if(result.Apv.STAFF_FNL_ID == result.staffVO.staff_id){
  		 			if((result.Apv.APV_FNL_DATE == undefined) && (result.Apv.APV_REJECT_DATE == undefined)){
						rejectTitle.innerText = "반려사유"
	 						
	 						var rejectTextarea = document.createElement("textarea")
	 						rejectTextarea.classList.add("form-control");
						rejectTextarea.setAttribute("id","CONTENT");
	 						reject.appendChild(rejectTextarea);
  		 				
  		 				var approvalButten = document.createElement("button")
	 		 			approvalButten.classList.add("btn");
	 		 			approvalButten.setAttribute("type","button");
	 		 			approvalButten.setAttribute("onclick","approval('"+result.Apv.APV_NO+"','FNL')");
	 		 			approvalButten.innerText = "결재"
	 		 			approvalButtonCol.appendChild(approvalButten);
	 		 			
	 		 			var rejectButten = document.createElement("button")
	 		 			rejectButten.classList.add("btn");
	 		 			rejectButten.setAttribute("onclick","reject('"+result.Apv.APV_NO+"')");
	 		 			rejectButten.setAttribute("type","button");
	 		 			rejectButten.innerText = "반려"
	 		 			approvalButtonCol.appendChild(rejectButten);
  		 				
  		 			}else if((result.Apv.APV_FNL_DATE == undefined) && (result.Apv.APV_REJECT_DATE != undefined)){
  		 				if(result.Apv.APV_REJECT_RSN != undefined){
  		 					rejectTitle.innerText = "반려사유"
  		 					reject.innerText = result.Apv.APV_REJECT_RSN;
  		 	 				}	
  		 			}else if(result.Apv.APV_FNL_DATE != undefined){
  		 				
  		 			}
  		 			
  		 	}
 			
 		}
 		
 		var modalBody = document.getElementById("modalBody")
 		tinyMCE.activeEditor.setContent(result.Apv.APV_CONTENT);
 		 
		myModal.show();
			}      
		}	
		xhr.open("post","../restApproval/getApv");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("APV_NO=" + APV_NO); 
		
	}
	
	function approval(APV_NO, div){
		var division = div;
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		 xhr.onreadystatechange = function () {
		if(xhr.readyState == 4 && xhr.status == 200){
		 var result = JSON.parse(xhr.responseText);
		
		 var APPROVAL_NAMES = document.getElementById("APPROVAL_NAMES");
	 		APPROVAL_NAMES.innerHTML = "";
	 		var APPROVAL_IMG = document.getElementById("APPROVAL_IMG");
	 		APPROVAL_IMG.innerHTML = "";
	 		var APPROVAL_DATE = document.getElementById("APPROVAL_DATE");
	 		APPROVAL_DATE.innerHTML = "";
	 		
	 		var STAFF_FIS_NAME = document.createElement("div");
	 		STAFF_FIS_NAME.classList.add("col-2");
	 		STAFF_FIS_NAME.classList.add("border");
	 		STAFF_FIS_NAME.classList.add("text-center");
	 		STAFF_FIS_NAME.setAttribute("style","width:5rem;")
			STAFF_FIS_NAME.innerText = result.Apv.STAFF_FIS_NAME;
			APPROVAL_NAMES.appendChild(STAFF_FIS_NAME);
	 		
			var APV_FIS_IMG_DIV = document.createElement("div") 
			APV_FIS_IMG_DIV.classList.add("col-2");
			APV_FIS_IMG_DIV.classList.add("py-1");
			APV_FIS_IMG_DIV.classList.add("border");
			APV_FIS_IMG_DIV.classList.add("text-center");
			APV_FIS_IMG_DIV.setAttribute("style","width:5rem;");
			APPROVAL_IMG.appendChild(APV_FIS_IMG_DIV);
				
			var APV_FIS_IMG = document.createElement("img");
			APV_FIS_IMG.classList.add("img-fluid");
			APV_FIS_IMG.setAttribute("src","/cbh/resources/img/staff/approval.png");
			APV_FIS_IMG_DIV.appendChild(APV_FIS_IMG);
	 		
			var APV_FIS_DATE = document.createElement("div")
			APV_FIS_DATE.classList.add("col-2");
			APV_FIS_DATE.classList.add("border");
			APV_FIS_DATE.classList.add("text-center");
			APV_FIS_DATE.setAttribute("style","width:5rem;");
			APV_FIS_DATE.innerText = moment(result.Apv.APV_WRITEDATE).format('YYYY/MM/DD')
			APPROVAL_DATE.appendChild(APV_FIS_DATE);
			
			
	 		if(result.Apv.STAFF_MID_NAME != undefined){
	 			var STAFF_MID_NAME = document.createElement("div");
	 			STAFF_MID_NAME.classList.add("col-2");
	 			STAFF_MID_NAME.classList.add("border");
	 			STAFF_MID_NAME.classList.add("text-center");
	 			STAFF_MID_NAME.setAttribute("style","width:5rem;")
	 			STAFF_MID_NAME.innerText = result.Apv.STAFF_MID_NAME;
	 			APPROVAL_NAMES.appendChild(STAFF_MID_NAME);
	 			if(result.Apv.APV_MID_DATE != undefined){
	 				var APV_MID_IMG_DIV = document.createElement("div") 
	 				APV_MID_IMG_DIV.classList.add("col-2");
	 				APV_MID_IMG_DIV.classList.add("py-1");
	 				APV_MID_IMG_DIV.classList.add("border");
	 				APV_MID_IMG_DIV.classList.add("text-center");
	 				APV_MID_IMG_DIV.setAttribute("style","width:5rem;");
	 				APPROVAL_IMG.appendChild(APV_MID_IMG_DIV);
	 				
	 				var APV_MID_IMG = document.createElement("img");
	 				APV_MID_IMG.classList.add("img-fluid");
	 				APV_MID_IMG.setAttribute("src","/cbh/resources/img/staff/approval.png");
	 				APV_MID_IMG_DIV.appendChild(APV_MID_IMG);
	 			
	 				var APV_MID_DATE = document.createElement("div")
	 				APV_MID_DATE.classList.add("col-2");
	 				APV_MID_DATE.classList.add("border");
	 				APV_MID_DATE.classList.add("text-center");
	 				APV_MID_DATE.setAttribute("style","width:5rem;");
	 				APV_MID_DATE.innerText= moment(result.Apv.APV_MID_DATE).format('YYYY/MM/DD')
	 				APPROVAL_DATE.appendChild(APV_MID_DATE);
	 				
	 				if(result.Apv.APV_FNL_DATE != undefined){
	 					var STAFF_FNL_NAME = document.createElement("div");
	 					STAFF_FNL_NAME.classList.add("col-2");
	 					STAFF_FNL_NAME.classList.add("border");
	 					STAFF_FNL_NAME.classList.add("text-center");
	 					STAFF_FNL_NAME.setAttribute("style","width:5rem;")
	 		 			STAFF_FNL_NAME.innerText = result.Apv.STAFF_FNL_NAME;
	 		 			APPROVAL_NAMES.appendChild(STAFF_FNL_NAME);
	 					
	 					var APV_FML_IMG_DIV = document.createElement("div") 
	 	 				APV_FML_IMG_DIV.classList.add("col-2");
	 					APV_FML_IMG_DIV.classList.add("py-1");
	 					APV_FML_IMG_DIV.classList.add("border");
	 					APV_FML_IMG_DIV.classList.add("text-center");
	 					APV_FML_IMG_DIV.setAttribute("style","width:5rem;");
	 	 				APPROVAL_IMG.appendChild(APV_FML_IMG_DIV);
	 	 				
	 	 				var APV_FML_IMG = document.createElement("img");
	 	 				APV_FML_IMG.classList.add("img-fluid");
	 	 				APV_FML_IMG.setAttribute("src","/cbh/resources/img/staff/approval.png");
	 	 				APV_FML_IMG_DIV.appendChild(APV_FML_IMG);
	 	 			
	 	 				var APV_FNL_DATE = document.createElement("div")
	 	 				APV_FNL_DATE.classList.add("col-2");
	 	 				APV_FNL_DATE.classList.add("border");
	 	 				APV_FNL_DATE.classList.add("text-center");
	 	 				APV_FNL_DATE.setAttribute("style","width:5rem;");
	 	 				APV_FNL_DATE.innerText= moment(result.Apv.APV_FNL_DATE).format('YYYY/MM/DD')
	 	 				APPROVAL_DATE.appendChild(APV_FNL_DATE);
	 				}else{
	 					var STAFF_FNL_NAME = document.createElement("div");
	 					STAFF_FNL_NAME.classList.add("col-2");
	 					STAFF_FNL_NAME.classList.add("border");
	 					STAFF_FNL_NAME.classList.add("text-center");
	 					STAFF_FNL_NAME.setAttribute("style","width:5rem;")
	 		 			STAFF_FNL_NAME.innerText = result.Apv.STAFF_FNL_NAME;
	 		 			APPROVAL_NAMES.appendChild(STAFF_FNL_NAME);
	 					
	 					var APV_FML_IMG_DIV = document.createElement("div") 
	 	 				APV_FML_IMG_DIV.classList.add("col-2");
	 					APV_FML_IMG_DIV.classList.add("py-1");
	 					APV_FML_IMG_DIV.classList.add("border");
	 					APV_FML_IMG_DIV.classList.add("text-center");
	 					APV_FML_IMG_DIV.setAttribute("style","width:5rem;");
	 	 				APPROVAL_IMG.appendChild(APV_FML_IMG_DIV);
	 	 				
	 	 				var APV_FNL_DATE = document.createElement("div")
	 	 				APV_FNL_DATE.classList.add("col-2");
	 	 				APV_FNL_DATE.classList.add("border");
	 	 				APV_FNL_DATE.classList.add("text-center");
	 	 				APV_FNL_DATE.setAttribute("style","width:5rem;");
	 	 				APPROVAL_DATE.appendChild(APV_FNL_DATE);
	 				}
	 			}else if((result.Apv.APV_MID_DATE == undefined) && (result.Apv.APV_REJECT_DATE == undefined)){
	 				var APV_MID_IMG_DIV = document.createElement("div") 
	 				APV_MID_IMG_DIV.classList.add("col-2");
	 				APV_MID_IMG_DIV.classList.add("py-1");
	 				APV_MID_IMG_DIV.classList.add("border");
	 				APV_MID_IMG_DIV.classList.add("text-center");
	 				APV_MID_IMG_DIV.setAttribute("style","width:5rem;");
	 				APPROVAL_IMG.appendChild(APV_MID_IMG_DIV);
	 			
	 				var APV_MID_DATE = document.createElement("div")
	 				APV_MID_DATE.classList.add("col-2");
	 				APV_MID_DATE.classList.add("border");
	 				APV_MID_DATE.classList.add("text-center");
	 				APV_MID_DATE.setAttribute("style","width:5rem;");
	 				APPROVAL_DATE.appendChild(APV_MID_DATE);
	 			
	 				var STAFF_FNL_NAME = document.createElement("div");
					STAFF_FNL_NAME.classList.add("col-2");
					STAFF_FNL_NAME.classList.add("border");
					STAFF_FNL_NAME.classList.add("text-center");
					STAFF_FNL_NAME.setAttribute("style","width:5rem;")
			 		STAFF_FNL_NAME.innerText = result.Apv.STAFF_FNL_NAME;
			 		APPROVAL_NAMES.appendChild(STAFF_FNL_NAME);
						
					var APV_FML_IMG_DIV = document.createElement("div") 
	 				APV_FML_IMG_DIV.classList.add("col-2");
					APV_FML_IMG_DIV.classList.add("py-1");
					APV_FML_IMG_DIV.classList.add("border");
					APV_FML_IMG_DIV.classList.add("text-center");
					APV_FML_IMG_DIV.setAttribute("style","width:5rem;");
	 				APPROVAL_IMG.appendChild(APV_FML_IMG_DIV);
	 				
	 				var APV_FNL_DATE = document.createElement("div")
	 				APV_FNL_DATE.classList.add("col-2");
	 				APV_FNL_DATE.classList.add("border");
	 				APV_FNL_DATE.classList.add("text-center");
	 				APV_FNL_DATE.setAttribute("style","width:5rem;");
	 				APPROVAL_DATE.appendChild(APV_FNL_DATE);
	 			}else if((result.Apv.APV_MID_DATE == undefined) && (result.Apv.APV_REJECT_DATE != undefined)){
	 				var APV_REJECT_IMG_DIV = document.createElement("div") 
	 				APV_REJECT_IMG_DIV.classList.add("col-2");
	 				APV_REJECT_IMG_DIV.classList.add("py-1");
	 				APV_REJECT_IMG_DIV.classList.add("border");
	 				APV_REJECT_IMG_DIV.classList.add("text-center");
	 				APV_REJECT_IMG_DIV.setAttribute("style","width:5rem;");
	 				APPROVAL_IMG.appendChild(APV_REJECT_IMG_DIV);
	 				
	 				var APV_REJECT_IMG = document.createElement("img");
	 				APV_REJECT_IMG.classList.add("img-fluid");
	 				APV_REJECT_IMG.setAttribute("src","/cbh/resources/img/staff/reject.png");
	 				APV_REJECT_IMG_DIV.appendChild(APV_REJECT_IMG);
	 			
	 				var APV_REJECT_DATE = document.createElement("div")
	 				APV_REJECT_DATE.classList.add("col-2");
	 				APV_REJECT_DATE.classList.add("border");
	 				APV_REJECT_DATE.classList.add("text-center");
	 				APV_REJECT_DATE.setAttribute("style","width:5rem;");
	 				APV_REJECT_DATE.innerText= moment(result.Apv.APV_REJECT_DATE).format('YYYY/MM/DD')
	 				APPROVAL_DATE.appendChild(APV_REJECT_DATE);
	 				
	 				var STAFF_FNL_NAME = document.createElement("div");
					STAFF_FNL_NAME.classList.add("col-2");
					STAFF_FNL_NAME.classList.add("border");
					STAFF_FNL_NAME.classList.add("text-center");
					STAFF_FNL_NAME.setAttribute("style","width:5rem;")
			 		STAFF_FNL_NAME.innerText = result.Apv.STAFF_FNL_NAME;
			 		APPROVAL_NAMES.appendChild(STAFF_FNL_NAME);
						
					var APV_FML_IMG_DIV = document.createElement("div") 
	 				APV_FML_IMG_DIV.classList.add("col-2");
					APV_FML_IMG_DIV.classList.add("py-1");
					APV_FML_IMG_DIV.classList.add("border");
					APV_FML_IMG_DIV.classList.add("text-center");
					APV_FML_IMG_DIV.setAttribute("style","width:5rem;");
	 				APPROVAL_IMG.appendChild(APV_FML_IMG_DIV);
	 				
	 				var APV_FNL_DATE = document.createElement("div")
	 				APV_FNL_DATE.classList.add("col-2");
	 				APV_FNL_DATE.classList.add("border");
	 				APV_FNL_DATE.classList.add("text-center");
	 				APV_FNL_DATE.setAttribute("style","width:5rem;");
	 				APPROVAL_DATE.appendChild(APV_FNL_DATE);
	 			}
	 		}else {
	 			var STAFF_FNL_NAME = document.createElement("div");
	 			STAFF_FNL_NAME.classList.add("col-2");
	 			STAFF_FNL_NAME.classList.add("border");
	 			STAFF_FNL_NAME.classList.add("text-center");
	 			STAFF_FNL_NAME.setAttribute("style","width:5rem;")
	 			STAFF_FNL_NAME.innerText = result.Apv.STAFF_FNL_NAME;
	 			APPROVAL_NAMES.appendChild(STAFF_FNL_NAME);
	 			
	 			if(result.Apv.APV_FNL_DATE != undefined){
	 				var APV_FML_IMG_DIV = document.createElement("div") 
	 				APV_FML_IMG_DIV.classList.add("col-2");
					APV_FML_IMG_DIV.classList.add("py-1");
					APV_FML_IMG_DIV.classList.add("border");
					APV_FML_IMG_DIV.classList.add("text-center");
					APV_FML_IMG_DIV.setAttribute("style","width:5rem;");
	 				APPROVAL_IMG.appendChild(APV_FML_IMG_DIV);
	 				
	 				var APV_FML_IMG = document.createElement("img");
	 				APV_FML_IMG.classList.add("img-fluid");
	 				APV_FML_IMG.setAttribute("src","/cbh/resources/img/staff/approval.png");
	 				APV_FML_IMG_DIV.appendChild(APV_FML_IMG);
	 			
	 				var APV_FNL_DATE = document.createElement("div")
	 				APV_FNL_DATE.classList.add("col-2");
	 				APV_FNL_DATE.classList.add("border");
	 				APV_FNL_DATE.classList.add("text-center");
	 				APV_FNL_DATE.setAttribute("style","width:5rem;");
	 				APV_FNL_DATE.innerText= moment(result.Apv.APV_FNL_DATE).format('YYYY/MM/DD')
	 				APPROVAL_DATE.appendChild(APV_FNL_DATE);
	 			}else if((result.Apv.APV_FNL_DATE == undefined) && (result.Apv.APV_REJECT_DATE == undefined)){
	 				var APV_FML_IMG_DIV = document.createElement("div") 
	 				APV_FML_IMG_DIV.classList.add("col-2");
					APV_FML_IMG_DIV.classList.add("py-1");
					APV_FML_IMG_DIV.classList.add("border");
					APV_FML_IMG_DIV.classList.add("text-center");
					APV_FML_IMG_DIV.setAttribute("style","width:5rem;");
	 				APPROVAL_IMG.appendChild(APV_FML_IMG_DIV);
	 				
	 				var APV_FNL_DATE = document.createElement("div")
	 				APV_FNL_DATE.classList.add("col-2");
	 				APV_FNL_DATE.classList.add("border");
	 				APV_FNL_DATE.classList.add("text-center");
	 				APV_FNL_DATE.setAttribute("style","width:5rem;");
	 				APPROVAL_DATE.appendChild(APV_FNL_DATE);
	 			}else if((result.Apv.APV_FNL_DATE == undefined) && (result.Apv.APV_REJECT_DATE != undefined)){
	 				var APV_REJECT_IMG_DIV = document.createElement("div") 
	 				APV_REJECT_IMG_DIV.classList.add("col-2");
					APV_REJECT_IMG_DIV.classList.add("py-1");
					APV_REJECT_IMG_DIV.classList.add("border");
					APV_REJECT_IMG_DIV.classList.add("text-center");
					APV_REJECT_IMG_DIV.setAttribute("style","width:5rem;");
	 				APPROVAL_IMG.appendChild(APV_REJECT_IMG_DIV);
	 				
	 				var APV_REJECT_IMG = document.createElement("img");
	 				APV_REJECT_IMG.classList.add("img-fluid");
	 				APV_REJECT_IMG.setAttribute("src","/cbh/resources/img/staff/reject.png");
	 				APV_REJECT_IMG_DIV.appendChild(APV_REJECT_IMG);
	 			
	 				var APV_REJECT_DATE = document.createElement("div")
	 				APV_REJECT_DATE.classList.add("col-2");
	 				APV_REJECT_DATE.classList.add("border");
	 				APV_REJECT_DATE.classList.add("text-center");
	 				APV_REJECT_DATE.setAttribute("style","width:5rem;");
	 				APV_REJECT_DATE.innerText= moment(result.Apv.APV_REJECT_DATE).format('YYYY/MM/DD')
	 				APPROVAL_DATE.appendChild(APV_REJECT_DATE);
	 				
	 				
	 			}
	 		}
		 
	 		var rejectTitle = document.getElementById("rejectTitle")
	 		var reject = document.getElementById("reject");
	 		rejectTitle.innerHTML="";
	 		reject.innerHTML="";
			var approvalButtonCol = document.getElementById("approvalButtonCol");
 			approvalButtonCol.innerHTML = "";
	 			if(result.Apv.STAFF_MID_ID == result.staffVO.staff_id){
	 				if((result.Apv.APV_MID_DATE == undefined) && (result.Apv.APV_REJECT_DATE == undefined)){
	 						rejectTitle.innerText = "반려사유"
	 						
	 						var rejectTextarea = document.createElement("textarea")
	 						rejectTextarea.classList.add("form-control");
	 						rejectTextarea.setAttribute("id","CONTENT");
	 						reject.appendChild(rejectTextarea);
	 						
		 		 			var approvalButten = document.createElement("button")
		 		 			approvalButten.classList.add("btn");
		 		 			approvalButten.setAttribute("type","button");
		 		 			approvalButten.setAttribute("onclick","approval('"+result.Apv.APV_NO+"','MID')");
		 		 			approvalButten.innerText = "결재"
		 		 			approvalButtonCol.appendChild(approvalButten);
		 		 			
		 		 			var rejectButten = document.createElement("button")
		 		 			rejectButten.classList.add("btn");
		 		 			rejectButten.setAttribute("type","button");
		 		 			rejectButten.setAttribute("onclick","reject('"+result.Apv.APV_NO+"')");
		 		 			rejectButten.innerText = "반려"
		 		 			approvalButtonCol.appendChild(rejectButten);
			 			}else if((result.Apv.APV_MID_DATE == undefined) && (result.Apv.APV_REJECT_DATE != undefined)){
			 				if(result.Apv.APV_REJECT_RSN != undefined){
		 					rejectTitle.innerText = "반려사유"
		 			
		 					reject.innerText = result.Apv.APV_REJECT_RSN;
		 	 				}	
			 			}else if(reslut.Apv.APV_MID_DATE != undefined){
			 				
			 			}
	 		
	 			}else if(result.Apv.STAFF_FNL_ID == result.staffVO.staff_id){
	  		 			if((result.Apv.APV_FNL_DATE == undefined) && (result.Apv.APV_REJECT_DATE == undefined)){
	  		 				rejectTitle.innerText = "반려사유"
		 						
		 						var rejectTextarea = document.createElement("textarea")
		 						rejectTextarea.classList.add("form-control");
	  		 				rejectTextarea.setAttribute("id","CONTENT");
		 						reject.appendChild(rejectTextarea);
		 						
	  		 				var approvalButten = document.createElement("button")
		 		 			approvalButten.classList.add("btn");
		 		 			approvalButten.setAttribute("type","button");
		 		 			approvalButten.setAttribute("onclick","approval('"+result.Apv.APV_NO+"','FNL')");
		 		 			approvalButten.innerText = "결재"
		 		 			approvalButtonCol.appendChild(approvalButten);
		 		 			
		 		 			var rejectButten = document.createElement("button")
		 		 			rejectButten.classList.add("btn");
		 		 			rejectButten.setAttribute("type","button");
		 		 			rejectButten.innerText = "반려"
		 		 			approvalButtonCol.appendChild(rejectButten);
	  		 				
	  		 			}else if((result.Apv.APV_FNL_DATE == undefined) && (result.Apv.APV_REJECT_DATE != undefined)){
	  		 				if(result.Apv.APV_REJECT_RSN != undefined){
	  		 					rejectTitle.innerText = "반려사유"
	  		 					reject.innerText = result.Apv.APV_REJECT_RSN;
	  		 	 				}	
	  		 			}else if(result.Apv.APV_FNL_DATE != undefined){
	  		 				
	  		 			}
	  		 			
	  		 	}
	 			
	 		
			}      
		}	
		xhr.open("post","../restApproval/approvalProcess");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("APV_NO=" + APV_NO +"&division=" + division); 
}
	
	function reject(APV_NO){
		var CONTENT = document.getElementById("CONTENT").value;
		
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
		if(xhr.readyState == 4 && xhr.status == 200){
		var result = JSON.parse(xhr.responseText);
		 var APPROVAL_NAMES = document.getElementById("APPROVAL_NAMES");
	 		APPROVAL_NAMES.innerHTML = "";
	 		var APPROVAL_IMG = document.getElementById("APPROVAL_IMG");
	 		APPROVAL_IMG.innerHTML = "";
	 		var APPROVAL_DATE = document.getElementById("APPROVAL_DATE");
	 		APPROVAL_DATE.innerHTML = "";
	 		
	 		var STAFF_FIS_NAME = document.createElement("div");
	 		STAFF_FIS_NAME.classList.add("col-2");
	 		STAFF_FIS_NAME.classList.add("border");
	 		STAFF_FIS_NAME.classList.add("text-center");
	 		STAFF_FIS_NAME.setAttribute("style","width:5rem;")
			STAFF_FIS_NAME.innerText = result.Apv.STAFF_FIS_NAME;
			APPROVAL_NAMES.appendChild(STAFF_FIS_NAME);
	 		
			var APV_FIS_IMG_DIV = document.createElement("div") 
			APV_FIS_IMG_DIV.classList.add("col-2");
			APV_FIS_IMG_DIV.classList.add("py-1");
			APV_FIS_IMG_DIV.classList.add("border");
			APV_FIS_IMG_DIV.classList.add("text-center");
			APV_FIS_IMG_DIV.setAttribute("style","width:5rem;");
			APPROVAL_IMG.appendChild(APV_FIS_IMG_DIV);
				
			var APV_FIS_IMG = document.createElement("img");
			APV_FIS_IMG.classList.add("img-fluid");
			APV_FIS_IMG.setAttribute("src","/cbh/resources/img/staff/approval.png");
			APV_FIS_IMG_DIV.appendChild(APV_FIS_IMG);
	 		
			var APV_FIS_DATE = document.createElement("div")
			APV_FIS_DATE.classList.add("col-2");
			APV_FIS_DATE.classList.add("border");
			APV_FIS_DATE.classList.add("text-center");
			APV_FIS_DATE.setAttribute("style","width:5rem;");
			APV_FIS_DATE.innerText = moment(result.Apv.APV_WRITEDATE).format('YYYY/MM/DD')
			APPROVAL_DATE.appendChild(APV_FIS_DATE);
			
			
	 		if(result.Apv.STAFF_MID_NAME != undefined){
	 			var STAFF_MID_NAME = document.createElement("div");
	 			STAFF_MID_NAME.classList.add("col-2");
	 			STAFF_MID_NAME.classList.add("border");
	 			STAFF_MID_NAME.classList.add("text-center");
	 			STAFF_MID_NAME.setAttribute("style","width:5rem;")
	 			STAFF_MID_NAME.innerText = result.Apv.STAFF_MID_NAME;
	 			APPROVAL_NAMES.appendChild(STAFF_MID_NAME);
	 			if(result.Apv.APV_MID_DATE != undefined){
	 				var APV_MID_IMG_DIV = document.createElement("div") 
	 				APV_MID_IMG_DIV.classList.add("col-2");
	 				APV_MID_IMG_DIV.classList.add("py-1");
	 				APV_MID_IMG_DIV.classList.add("border");
	 				APV_MID_IMG_DIV.classList.add("text-center");
	 				APV_MID_IMG_DIV.setAttribute("style","width:5rem;");
	 				APPROVAL_IMG.appendChild(APV_MID_IMG_DIV);
	 				
	 				var APV_MID_IMG = document.createElement("img");
	 				APV_MID_IMG.classList.add("img-fluid");
	 				APV_MID_IMG.setAttribute("src","/cbh/resources/img/staff/approval.png");
	 				APV_MID_IMG_DIV.appendChild(APV_MID_IMG);
	 			
	 				var APV_MID_DATE = document.createElement("div")
	 				APV_MID_DATE.classList.add("col-2");
	 				APV_MID_DATE.classList.add("border");
	 				APV_MID_DATE.classList.add("text-center");
	 				APV_MID_DATE.setAttribute("style","width:5rem;");
	 				APV_MID_DATE.innerText= moment(result.Apv.APV_MID_DATE).format('YYYY/MM/DD')
	 				APPROVAL_DATE.appendChild(APV_MID_DATE);
	 				
	 				if(result.Apv.APV_FNL_DATE != undefined){
	 					var STAFF_FNL_NAME = document.createElement("div");
	 					STAFF_FNL_NAME.classList.add("col-2");
	 					STAFF_FNL_NAME.classList.add("border");
	 					STAFF_FNL_NAME.classList.add("text-center");
	 					STAFF_FNL_NAME.setAttribute("style","width:5rem;")
	 		 			STAFF_FNL_NAME.innerText = result.Apv.STAFF_FNL_NAME;
	 		 			APPROVAL_NAMES.appendChild(STAFF_FNL_NAME);
	 					
	 					var APV_FML_IMG_DIV = document.createElement("div") 
	 	 				APV_FML_IMG_DIV.classList.add("col-2");
	 					APV_FML_IMG_DIV.classList.add("py-1");
	 					APV_FML_IMG_DIV.classList.add("border");
	 					APV_FML_IMG_DIV.classList.add("text-center");
	 					APV_FML_IMG_DIV.setAttribute("style","width:5rem;");
	 	 				APPROVAL_IMG.appendChild(APV_FML_IMG_DIV);
	 	 				
	 	 				var APV_FML_IMG = document.createElement("img");
	 	 				APV_FML_IMG.classList.add("img-fluid");
	 	 				APV_FML_IMG.setAttribute("src","/cbh/resources/img/staff/approval.png");
	 	 				APV_FML_IMG_DIV.appendChild(APV_FML_IMG);
	 	 			
	 	 				var APV_FNL_DATE = document.createElement("div")
	 	 				APV_FNL_DATE.classList.add("col-2");
	 	 				APV_FNL_DATE.classList.add("border");
	 	 				APV_FNL_DATE.classList.add("text-center");
	 	 				APV_FNL_DATE.setAttribute("style","width:5rem;");
	 	 				APV_FNL_DATE.innerText= moment(result.Apv.APV_FNL_DATE).format('YYYY/MM/DD')
	 	 				APPROVAL_DATE.appendChild(APV_FNL_DATE);
	 				}else{
	 					var STAFF_FNL_NAME = document.createElement("div");
	 					STAFF_FNL_NAME.classList.add("col-2");
	 					STAFF_FNL_NAME.classList.add("border");
	 					STAFF_FNL_NAME.classList.add("text-center");
	 					STAFF_FNL_NAME.setAttribute("style","width:5rem;")
	 		 			STAFF_FNL_NAME.innerText = result.Apv.STAFF_FNL_NAME;
	 		 			APPROVAL_NAMES.appendChild(STAFF_FNL_NAME);
	 					
	 					var APV_FML_IMG_DIV = document.createElement("div") 
	 	 				APV_FML_IMG_DIV.classList.add("col-2");
	 					APV_FML_IMG_DIV.classList.add("py-1");
	 					APV_FML_IMG_DIV.classList.add("border");
	 					APV_FML_IMG_DIV.classList.add("text-center");
	 					APV_FML_IMG_DIV.setAttribute("style","width:5rem;");
	 	 				APPROVAL_IMG.appendChild(APV_FML_IMG_DIV);
	 	 				
	 	 				var APV_FNL_DATE = document.createElement("div")
	 	 				APV_FNL_DATE.classList.add("col-2");
	 	 				APV_FNL_DATE.classList.add("border");
	 	 				APV_FNL_DATE.classList.add("text-center");
	 	 				APV_FNL_DATE.setAttribute("style","width:5rem;");
	 	 				APPROVAL_DATE.appendChild(APV_FNL_DATE);
	 				}
	 			}else if((result.Apv.APV_MID_DATE == undefined) && (result.Apv.APV_REJECT_DATE == undefined)){
	 				var APV_MID_IMG_DIV = document.createElement("div") 
	 				APV_MID_IMG_DIV.classList.add("col-2");
	 				APV_MID_IMG_DIV.classList.add("py-1");
	 				APV_MID_IMG_DIV.classList.add("border");
	 				APV_MID_IMG_DIV.classList.add("text-center");
	 				APV_MID_IMG_DIV.setAttribute("style","width:5rem;");
	 				APPROVAL_IMG.appendChild(APV_MID_IMG_DIV);
	 			
	 				var APV_MID_DATE = document.createElement("div")
	 				APV_MID_DATE.classList.add("col-2");
	 				APV_MID_DATE.classList.add("border");
	 				APV_MID_DATE.classList.add("text-center");
	 				APV_MID_DATE.setAttribute("style","width:5rem;");
	 				APPROVAL_DATE.appendChild(APV_MID_DATE);
	 			
	 				var STAFF_FNL_NAME = document.createElement("div");
					STAFF_FNL_NAME.classList.add("col-2");
					STAFF_FNL_NAME.classList.add("border");
					STAFF_FNL_NAME.classList.add("text-center");
					STAFF_FNL_NAME.setAttribute("style","width:5rem;")
			 		STAFF_FNL_NAME.innerText = result.Apv.STAFF_FNL_NAME;
			 		APPROVAL_NAMES.appendChild(STAFF_FNL_NAME);
						
					var APV_FML_IMG_DIV = document.createElement("div") 
	 				APV_FML_IMG_DIV.classList.add("col-2");
					APV_FML_IMG_DIV.classList.add("py-1");
					APV_FML_IMG_DIV.classList.add("border");
					APV_FML_IMG_DIV.classList.add("text-center");
					APV_FML_IMG_DIV.setAttribute("style","width:5rem;");
	 				APPROVAL_IMG.appendChild(APV_FML_IMG_DIV);
	 				
	 				var APV_FNL_DATE = document.createElement("div")
	 				APV_FNL_DATE.classList.add("col-2");
	 				APV_FNL_DATE.classList.add("border");
	 				APV_FNL_DATE.classList.add("text-center");
	 				APV_FNL_DATE.setAttribute("style","width:5rem;");
	 				APPROVAL_DATE.appendChild(APV_FNL_DATE);
	 			}else if((result.Apv.APV_MID_DATE == undefined) && (result.Apv.APV_REJECT_DATE != undefined)){
	 				var APV_REJECT_IMG_DIV = document.createElement("div") 
	 				APV_REJECT_IMG_DIV.classList.add("col-2");
	 				APV_REJECT_IMG_DIV.classList.add("py-1");
	 				APV_REJECT_IMG_DIV.classList.add("border");
	 				APV_REJECT_IMG_DIV.classList.add("text-center");
	 				APV_REJECT_IMG_DIV.setAttribute("style","width:5rem;");
	 				APPROVAL_IMG.appendChild(APV_REJECT_IMG_DIV);
	 				
	 				var APV_REJECT_IMG = document.createElement("img");
	 				APV_REJECT_IMG.classList.add("img-fluid");
	 				APV_REJECT_IMG.setAttribute("src","/cbh/resources/img/staff/reject.png");
	 				APV_REJECT_IMG_DIV.appendChild(APV_REJECT_IMG);
	 			
	 				var APV_REJECT_DATE = document.createElement("div")
	 				APV_REJECT_DATE.classList.add("col-2");
	 				APV_REJECT_DATE.classList.add("border");
	 				APV_REJECT_DATE.classList.add("text-center");
	 				APV_REJECT_DATE.setAttribute("style","width:5rem;");
	 				APV_REJECT_DATE.innerText= moment(result.Apv.APV_REJECT_DATE).format('YYYY/MM/DD')
	 				APPROVAL_DATE.appendChild(APV_REJECT_DATE);
	 				
	 				var STAFF_FNL_NAME = document.createElement("div");
					STAFF_FNL_NAME.classList.add("col-2");
					STAFF_FNL_NAME.classList.add("border");
					STAFF_FNL_NAME.classList.add("text-center");
					STAFF_FNL_NAME.setAttribute("style","width:5rem;")
			 		STAFF_FNL_NAME.innerText = result.Apv.STAFF_FNL_NAME;
			 		APPROVAL_NAMES.appendChild(STAFF_FNL_NAME);
						
					var APV_FML_IMG_DIV = document.createElement("div") 
	 				APV_FML_IMG_DIV.classList.add("col-2");
					APV_FML_IMG_DIV.classList.add("py-1");
					APV_FML_IMG_DIV.classList.add("border");
					APV_FML_IMG_DIV.classList.add("text-center");
					APV_FML_IMG_DIV.setAttribute("style","width:5rem;");
	 				APPROVAL_IMG.appendChild(APV_FML_IMG_DIV);
	 				
	 				var APV_FNL_DATE = document.createElement("div")
	 				APV_FNL_DATE.classList.add("col-2");
	 				APV_FNL_DATE.classList.add("border");
	 				APV_FNL_DATE.classList.add("text-center");
	 				APV_FNL_DATE.setAttribute("style","width:5rem;");
	 				APPROVAL_DATE.appendChild(APV_FNL_DATE);
	 			}
	 		}else {
	 			var STAFF_FNL_NAME = document.createElement("div");
	 			STAFF_FNL_NAME.classList.add("col-2");
	 			STAFF_FNL_NAME.classList.add("border");
	 			STAFF_FNL_NAME.classList.add("text-center");
	 			STAFF_FNL_NAME.setAttribute("style","width:5rem;")
	 			STAFF_FNL_NAME.innerText = result.Apv.STAFF_FNL_NAME;
	 			APPROVAL_NAMES.appendChild(STAFF_FNL_NAME);
	 			
	 			if(result.Apv.APV_FNL_DATE != undefined){
	 				var APV_FML_IMG_DIV = document.createElement("div") 
	 				APV_FML_IMG_DIV.classList.add("col-2");
					APV_FML_IMG_DIV.classList.add("py-1");
					APV_FML_IMG_DIV.classList.add("border");
					APV_FML_IMG_DIV.classList.add("text-center");
					APV_FML_IMG_DIV.setAttribute("style","width:5rem;");
	 				APPROVAL_IMG.appendChild(APV_FML_IMG_DIV);
	 				
	 				var APV_FML_IMG = document.createElement("img");
	 				APV_FML_IMG.classList.add("img-fluid");
	 				APV_FML_IMG.setAttribute("src","/cbh/resources/img/staff/approval.png");
	 				APV_FML_IMG_DIV.appendChild(APV_FML_IMG);
	 			
	 				var APV_FNL_DATE = document.createElement("div")
	 				APV_FNL_DATE.classList.add("col-2");
	 				APV_FNL_DATE.classList.add("border");
	 				APV_FNL_DATE.classList.add("text-center");
	 				APV_FNL_DATE.setAttribute("style","width:5rem;");
	 				APV_FNL_DATE.innerText= moment(result.Apv.APV_FNL_DATE).format('YYYY/MM/DD')
	 				APPROVAL_DATE.appendChild(APV_FNL_DATE);
	 			}else if((result.Apv.APV_FNL_DATE == undefined) && (result.Apv.APV_REJECT_DATE == undefined)){
	 				var APV_FML_IMG_DIV = document.createElement("div") 
	 				APV_FML_IMG_DIV.classList.add("col-2");
					APV_FML_IMG_DIV.classList.add("py-1");
					APV_FML_IMG_DIV.classList.add("border");
					APV_FML_IMG_DIV.classList.add("text-center");
					APV_FML_IMG_DIV.setAttribute("style","width:5rem;");
	 				APPROVAL_IMG.appendChild(APV_FML_IMG_DIV);
	 				
	 				var APV_FNL_DATE = document.createElement("div")
	 				APV_FNL_DATE.classList.add("col-2");
	 				APV_FNL_DATE.classList.add("border");
	 				APV_FNL_DATE.classList.add("text-center");
	 				APV_FNL_DATE.setAttribute("style","width:5rem;");
	 				APPROVAL_DATE.appendChild(APV_FNL_DATE);
	 			}else if((result.Apv.APV_FNL_DATE == undefined) && (result.Apv.APV_REJECT_DATE != undefined)){
	 				var APV_REJECT_IMG_DIV = document.createElement("div") 
	 				APV_REJECT_IMG_DIV.classList.add("col-2");
					APV_REJECT_IMG_DIV.classList.add("py-1");
					APV_REJECT_IMG_DIV.classList.add("border");
					APV_REJECT_IMG_DIV.classList.add("text-center");
					APV_REJECT_IMG_DIV.setAttribute("style","width:5rem;");
	 				APPROVAL_IMG.appendChild(APV_REJECT_IMG_DIV);
	 				
	 				var APV_REJECT_IMG = document.createElement("img");
	 				APV_REJECT_IMG.classList.add("img-fluid");
	 				APV_REJECT_IMG.setAttribute("src","/cbh/resources/img/staff/reject.png");
	 				APV_REJECT_IMG_DIV.appendChild(APV_REJECT_IMG);
	 			
	 				var APV_REJECT_DATE = document.createElement("div")
	 				APV_REJECT_DATE.classList.add("col-2");
	 				APV_REJECT_DATE.classList.add("border");
	 				APV_REJECT_DATE.classList.add("text-center");
	 				APV_REJECT_DATE.setAttribute("style","width:5rem;");
	 				APV_REJECT_DATE.innerText= moment(result.Apv.APV_REJECT_DATE).format('YYYY/MM/DD')
	 				APPROVAL_DATE.appendChild(APV_REJECT_DATE);
	 				
	 				
	 			}
	 		}
		 
	 		var rejectTitle = document.getElementById("rejectTitle")
	 		var reject = document.getElementById("reject");
	 		rejectTitle.innerHTML="";
	 		reject.innerHTML="";
			var approvalButtonCol = document.getElementById("approvalButtonCol");
			approvalButtonCol.innerHTML = "";
	 			if(result.Apv.STAFF_MID_ID == result.staffVO.staff_id){
	 				if((result.Apv.APV_MID_DATE == undefined) && (result.Apv.APV_REJECT_DATE == undefined)){
	 						rejectTitle.innerText = "반려사유"
	 						
	 						var rejectTextarea = document.createElement("textarea")
	 						rejectTextarea.classList.add("form-control");
	 						rejectTextarea.setAttribute("id","CONTENT");
	 						reject.appendChild(rejectTextarea);
	 						
		 		 			var approvalButten = document.createElement("button")
		 		 			approvalButten.classList.add("btn");
		 		 			approvalButten.setAttribute("type","button");
		 		 			approvalButten.setAttribute("onclick","approval('"+result.Apv.APV_NO+"','MID')");
		 		 			approvalButten.innerText = "결재"
		 		 			approvalButtonCol.appendChild(approvalButten);
		 		 			
		 		 			var rejectButten = document.createElement("button")
		 		 			rejectButten.classList.add("btn");
		 		 			rejectButten.setAttribute("type","button");
		 		 			rejectButten.setAttribute("onclick","reject('"+result.Apv.APV_NO+"')");
		 		 			rejectButten.innerText = "반려"
		 		 			approvalButtonCol.appendChild(rejectButten);
			 			}else if((result.Apv.APV_MID_DATE == undefined) && (result.Apv.APV_REJECT_DATE != undefined)){
			 				if(result.Apv.APV_REJECT_RSN != undefined){
		 					rejectTitle.innerText = "반려사유"
		 			
		 					reject.innerText = result.Apv.APV_REJECT_RSN;
		 	 				}	
			 			}else if(reslut.Apv.APV_MID_DATE != undefined){
			 				
			 			}
	 		
	 			}else if(result.Apv.STAFF_FNL_ID == result.staffVO.staff_id){
	  		 			if((result.Apv.APV_FNL_DATE == undefined) && (result.Apv.APV_REJECT_DATE == undefined)){
	  		 				rejectTitle.innerText = "반려사유"
		 						
		 						var rejectTextarea = document.createElement("textarea")
		 						rejectTextarea.setAttribute("id","CONTENT");
		 						rejectTextarea.classList.add("form-control");
		 						reject.appendChild(rejectTextarea);
		 						
	  		 				var approvalButten = document.createElement("button")
		 		 			approvalButten.classList.add("btn");
		 		 			approvalButten.setAttribute("type","button");
		 		 			approvalButten.setAttribute("onclick","approval('"+result.Apv.APV_NO+"','FNL')");
		 		 			approvalButten.innerText = "결재"
		 		 			approvalButtonCol.appendChild(approvalButten);
		 		 			
		 		 			var rejectButten = document.createElement("button")
		 		 			rejectButten.classList.add("btn");
		 		 			rejectButten.setAttribute("type","button");
		 		 			rejectButten.innerText = "반려"
		 		 			approvalButtonCol.appendChild(rejectButten);
	  		 				
	  		 			}else if((result.Apv.APV_FNL_DATE == undefined) && (result.Apv.APV_REJECT_DATE != undefined)){
	  		 				if(result.Apv.APV_REJECT_RSN != undefined){
	  		 					rejectTitle.innerText = "반려사유"
	  		 					reject.innerText = result.Apv.APV_REJECT_RSN;
	  		 	 				}	
	  		 			}else if(result.Apv.APV_FNL_DATE != undefined){
	  		 				
	  		 			}
	  		 			
	  		 	}
		
			}      
		}	
		xhr.open("post","../restApproval/rejectProcess");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("APV_NO=" + APV_NO +"&CONTENT=" + CONTENT); 
	}
			tinymce.init({
 			selector: 'textarea#modalBody',  // change this value according to your HTML
 			toolbar: false,
 			statusbar: false,
 			height: 500,
 			language : 'ko_KR',
 			skin: 'bootstrap',
 			icons: 'bootstrap',
 			menubar: false,
 			readonly: true
 			});
 		
</script>


</head>
<body>
	<jsp:include page="../../staff_common/staff_sidevar.jsp"></jsp:include>

<main>

					<!-- 여기다 작성하세요 -->
					<div class="row mt-1 mb-3">
						<div class="col"
							style="font-size: 1.6em; font-weight: bold; color: #C4073D">기안서작성
						</div>
					</div>
					<div class="row px-3">
						<div class="col">
							<div class="row">

								<div class="col-1 me-3 px-0"
									style="height: 75vh; border: 1px solid;">
									<table class="table table-hover caption-top table-sm">
										<thead>
											<tr class="text-center">
												<th scope="col">내결재</th>
											</tr>
										</thead>
										<tbody class="text-center">
											<tr class="divisionTab" style="cursor: pointer;"
												onclick="getMyApvList('나의전체',this)">
												<td>전체</td>
											</tr>
											<tr class="divisionTab" style="cursor: pointer;"
												onclick="getMyApvList('나의진행중',this)">
												<td>진행중</td>
											</tr>
											<tr class="divisionTab" style="cursor: pointer;"
												onclick="getMyApvList('나의결재완료',this)">
												<td>결재완료</td>
											</tr>
											<tr class="divisionTab" style="cursor: pointer;"
												onclick="getMyApvList('나의반려',this)">
												<td>반려</td>
											</tr>
											<tr style="height: 30px">
												<td></td>
											</tr>
										</tbody>
										<thead>
											<tr class="text-center">
												<th scope="col">요청된 결재</th>
											</tr>
										</thead>
										<tbody class="text-center">
											<tr class="divisionTab" style="cursor: pointer;"
												onclick="getRequestedApvList('요청전체',this)">
												<td>전체</td>
											</tr>
											<tr class="divisionTab" style="cursor: pointer;"
												onclick="getRequestedApvList('요청미결재',this)">
												<td>미결재</td>
											</tr>
											<tr class="divisionTab" style="cursor: pointer;"
												onclick="getRequestedApvList('요청결재',this)">
												<td>결재</td>
											</tr>
											<tr class="divisionTab" style="cursor: pointer;"
												onclick="getRequestedApvList('요청반려',this)">
												<td>반려</td>
											</tr>

										</tbody>

									</table>
								</div>

								<div class="col" style="height: 75vh; border: 1px solid;">
									<input id="type" type="hidden" value="전체">
									<table class="table table-hover caption-top table-sm">
										<caption>
											결재내역 <span id="contentCount"></span>
										</caption>
										<thead>
											<tr id="ApvHead" class="text-center">
												<th class="col-1">기안번호</th>
												<th class="col-1">구분</th>
												<th class="col-7">제목</th>
												<th class="col-1">기안자</th>
												<th class="col-1">상태</th>
												<th class="col-1">상세</th>
											</tr>
										</thead>
										<tbody id="ApvBody">
											<tr class="text-center">
												<td class="col-1">2022/09/18-1</td>
												<td class="col-1">지출결의서</td>
												<td class="col-7 text-start">누구누구의 지출결의서</td>
												<td class="col-1">테스트부장</td>
												<td class="col-1">진행중</td>
												<td class="col-1" onclick="test()">보기</td>
											</tr>
										</tbody>
									</table>


								</div>






							</div>
						</div>
					</div>
					<!-- 여기다 작성하세요 -->

</main>

	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div id="APPROVAL_NAMES" class="row justify-content-end"
						style="height: 3.5%; font-size: 0.9rem"></div>
					<div id="APPROVAL_IMG" class="row justify-content-end"
						style="height: 8.5%;"></div>
					<div id="APPROVAL_DATE" class="row justify-content-end"
						style="height: 2.5%; font-size: 0.5rem"></div>
					<div class="row my-1" style="height: 3%">
						<div class="col-auto">기안번호</div>
						<div id="apvNo" class="col-2"></div>
						<div class="col-1">제목</div>
						<div id="apvContent" class="col"></div>
					</div>
					<div id="modalBodyRow" class="row">
						<div class="col">
							<textarea style="height: 100%" id="modalBody"></textarea>
						</div>
					</div>
					<div class="row">
						<div id="rejectTitle" class="col"></div>
					</div>
					<div class="row">
						<div id="reject" class="col">
						
						</div>
					</div>
					<div class="row">
						<div id="approvalButtonCol" class="col"></div>
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