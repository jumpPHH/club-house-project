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
<link rel="stylesheet" type="text/css"
	href="/cbh/resources/summernote/css/asdasdasd_style.css">
<link rel="stylesheet" href="/cbh/resources/css/staff_MainPage.css">
<script
	src="https://cdn.tiny.cloud/1/bdorzubong3byjkwg9kl0ayxl92mhi8e0f24djie6ukepumt/tinymce/6/tinymce.min.js"
	referrerpolicy="origin"></script>
<script type="text/javascript">

	function selectApvType(type,e){
		
		$("#type").val(type)
		$(".divisionTab").removeClass("table-active");
		if(e){
			e.classList.add("table-active")
		}
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		 xhr.onreadystatechange = function () {
		if(xhr.readyState == 4 && xhr.status == 200){
  		 var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
			
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
  		 		
  		 		if(Apv.STAFF_MID_NAME != undefined && Apv.APV_MID_DATE == undefined ){
  		 			var td4 = document.createElement("td");
  	  		 		td4.classList.add("col-1");
  	  		 		td4.innerText = Apv.STAFF_MID_NAME;
  	  		 		tr.appendChild(td4);	
  		 			console.log("1")
  		 		}else if(Apv.STAFF_MID_NAME == undefined){
  		 			var td4 = document.createElement("td");
  		 			td4.classList.add("col-1");
  		 			td4.innerText = Apv.STAFF_FNL_NAME;
  		 			tr.appendChild(td4);
  		 			console.log("2")
  		 		}else if(Apv.STAFF_MID_NAME != undefined && Apv.APV_MID_DATE != undefined){
  		 			var td4 = document.createElement("td");
  		 			td4.classList.add("col-1");
  		 			td4.innerText = Apv.STAFF_FNL_NAME;
  		 			tr.appendChild(td4);
  		 		}
  		 		if(Apv.APV_FNL_DATE == undefined){
  		 		var td5 = document.createElement("td");
  		 		td5.classList.add("col-1");
  		 		td5.innerText = "진행중"
  		 		tr.appendChild(td5);
  		 		}else{
  		 			var td5 = document.createElement("td");
  	  		 		td5.classList.add("col-1");
  	  		 		td5.innerText = "결재완료"
  	  		 		tr.appendChild(td5);
  		 		}
  		 		
  		 		var td6 = document.createElement("td");
  		 		td6.classList.add("col-1");
  		 		td6.setAttribute("onclick","test('"+Apv.APV_NO+"')")
  		 		td6.innerText = "보기"
  		 		tr.appendChild(td6);
  		 	}
  		 
			}      
		}	
		xhr.open("post","../restApproval/getApvList",false);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("type=" + type); 
		
	}
	
	function test(e){
		var APV_NO = e;
		var myModal = new bootstrap.Modal(document.getElementById('staticBackdrop'))
		console.log(APV_NO)
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		 xhr.onreadystatechange = function () {
		if(xhr.readyState == 4 && xhr.status == 200){
 		 var result = JSON.parse(xhr.responseText);
		
 		 
 		 
 		 
 		 
 		 
 		tinymce.init({
 			  selector: '#modalBody',  // change this value according to your HTML
 			 toolbar: false,
 			statusbar: false,
 			menubar: false,
 			  readonly: true
 			});
		var modalBody = document.getElementById("modalBody")
		modalBody.innerHTML = result.Apv.APV_CONTENT
		
		
		
		myModal.show();
			}      
		}	
		xhr.open("post","../restApproval/getApv",false);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("APV_NO=" + APV_NO); 
		
	}
</script>


</head>
<body>
	<jsp:include page="../../staff_common/staff_header.jsp"></jsp:include>
	<jsp:include page="../../staff_common/staff_sidevar.jsp"></jsp:include>

	<div
		style="position: absolute; left: 13.5%; width: 86.5%; top: 14vh; height: 86vh; overflow-y: auto">
		<div class="container-fluid">
			<div class="row">
				<div class="col">

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
												<th scope="col">결재구분</th>
											</tr>
										</thead>
										<tbody class="text-center">
												<tr class="divisionTab"style="cursor: pointer;"onclick="selectApvType('나의결재',this)">
													<td>나의결재</td>
												</tr>
												<tr class="divisionTab"style="cursor: pointer;"onclick="selectApvType('전체',this)">
													<td>전체</td>
												</tr>
												<tr class="divisionTab"style="cursor: pointer;"onclick="selectApvType('진행중',this)">
													<td>진행중</td>
												</tr>
												<tr class="divisionTab"style="cursor: pointer;"onclick="selectApvType('결재완료',this)">
													<td>결재완료</td>
												</tr>
												<tr class="divisionTab"style="cursor: pointer;"onclick="selectApvType('반려',this)">
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
												<th class="col-1">결재자</th>
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
												<td class="col-1"  onclick="test()">보기</td>
											</tr>
										</tbody>
									</table>
						
						
								</div>






							</div>
						</div>
					</div>




					<script type="text/javascript">
						tinymce.init({
									selector : 'textarea#basic-example',
									statusbar : false,
									language : 'ko_KR',
									 skin: 'bootstrap',
									  icons: 'bootstrap',
									height : 650,
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
									content_style : 'body { font-family: 맑은고딕,Arial,sans-serif; font-size:16px }'

								});
					</script>


					<!-- 여기다 작성하세요 -->

				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
  		<div class="row">
  			<div class="col">
  			
  			</div>
  			<div class="col">
  			 	<div class="row">
  			 		<div class="col">기안자</div>
  			 	</div>
  			 	<div class="row">
  			 		<div class="col">싸인</div>
  			 	</div>
  			</div>
  			 			<div class="col">
  			 	<div class="row">
  			 		<div class="col">직급</div>
  			 	</div>
  			 	<div class="row">
  			 		<div class="col">싸인</div>
  			 	</div>
  			</div>
  			 			<div class="col">
  			 	<div class="row">
  			 		<div class="col">직급</div>
  			 	</div>
  			 	<div class="row">
  			 		<div class="col">싸인</div>
  			 	</div>
  			</div>
  		</div>
  		<div class="row">
  			<div id="apvNo"class="col">
  				기안번호
  			</div>
  			<div id="apvContent"class="col">
  				제목
  			</div>
  		</div>
  		<div class="row">
  			<div class="col" id="modalBody">
  			
  			</div>
  		</div>
      
      
      </div>
    </div>
  </div>
</div>
	<script
		src="https://cdn.jsdelivr.net/npm/@tinymce/tinymce-webcomponent@2/dist/tinymce-webcomponent.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>