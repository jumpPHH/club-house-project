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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script
	src="https://cdn.tiny.cloud/1/bdorzubong3byjkwg9kl0ayxl92mhi8e0f24djie6ukepumt/tinymce/6/tinymce.min.js"
	referrerpolicy="origin"></script>
<style type="text/css">
.selectDiv{
color: #FA5858;
font-size: 1.1rem;
font-weight: bold;
}
</style>
<script type="text/javascript">
tinymce.init({
	selector : 'textarea#basic-example',
	statusbar : false,
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
document.addEventListener('focusin', (e) => {
	  if (e.target.closest(".tox-tinymce, .tox-tinymce-aux, .moxman-window, .tam-assetmanager-root") !== null) {
	    e.stopImmediatePropagation();
	  }
	});
function doSubmit(){
		if(document.getElementById("STAFF_FNL_ID_select").value){
		}else{
			swal("","최종결재자는 필수입니다.","info")
			return;
		}
		
		var APV_FORM =document.getElementById("APV_FORM");
		APV_FORM.submit();
		swal("","작성완료.","success")
	}
	
	function selectApvDiv(e,NO){
		$(".divisionTab").removeClass("selectDiv");
		if(e){
			e.classList.add("selectDiv")
		}
		var APV_DIV_NO = document.getElementById("APV_DIV_NO");
		APV_DIV_NO.setAttribute("value",""+NO+"");
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
		if(xhr.readyState == 4 && xhr.status == 200){
	   	var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
		
	   	tinyMCE.activeEditor.resetContent()
		
		if(result.ApvDivForm == null){
		}else{
			tinyMCE.activeEditor.setContent(result.ApvDivForm);
		}
	   	
		}
		}
		xhr.open("post","../restApproval/getApvForm");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("NO=" + NO); 	
	}
	window.addEventListener('DOMContentLoaded', function(){
		var navtab = document.getElementById("WriteDraftPage")
		navtab.setAttribute("style", "border-right: 5px solid #FA5858");
		
		var start = document.getElementById("start0")
		start.click();
	   });
</script>


</head>
<body>
	<jsp:include page="/WEB-INF/views/staff_common/staff_sidevar.jsp"></jsp:include>
		
	<!-- 페이지 내용 부분 시작 (이 부분만 카피해서 사용할것. 카피 후 삭제) -->
	<div class="page-content p-5 pt-4" id="content">
	  <!-- 토글 버튼 -->
		<button id="sidebarCollapse" type="button"
			class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-3" style="color: #FA5858;">
			<i class="fa fa-bars mr-2"></i><small
				class="text-uppercase font-weight-bold">MENU</small>
		</button>

					<!-- 여기다 작성하세요 -->
					<div class="row px-3">
						<div class="col mt-3">
						<div class="row box mb-3 p-2" style="height: 45px;align-content: center;">
						<c:forEach items="${ApvDiv }" var="ApvDiv" varStatus="i" >
						
						<c:choose>
							<c:when test="${!i.last }">
							<div class="col text-center" style=" border-right: 2px solid #ededed;">
							
								<div class="row" style="justify-content: center">
								<div id="start${i.index }"class="col-auto px-3 divisionTab" style="cursor: pointer; border-radius: 2rem;" onclick="selectApvDiv(this,'${ApvDiv.APV_DIV_NO}')">
							${ApvDiv.APV_DIV_NAME }
								</div>
								</div>
							
							
							
							</div>
							</c:when>
							<c:otherwise>
							<div class="col text-center" >
							<div class="row" style="justify-content: center">
								<div class="col-auto px-3 divisionTab" style="cursor: pointer; border-radius: 2rem;" onclick="selectApvDiv(this,'${ApvDiv.APV_DIV_NO}')">
							${ApvDiv.APV_DIV_NAME } 
								
								</div>
							</div>
							
							</div>
							</c:otherwise>
						</c:choose>
											</c:forEach>
						
						</div>
							<div class="row box p-2">
								<div class="col" style="height: 75vh; ">
									<form id="APV_FORM" action="./WriteDtaftProcess" method="post" enctype="multipart/form-data">
									<input type="hidden" name="APV_DIV_NO" id="APV_DIV_NO" value="1">
									
									<div class="row mt-2">
										<div class="col">
											<div class="input-group input-group-sm mb-1">
												<span class="input-group-text"
													 id="inputGroup-sizing-sm">제목</span>
												<input type="text" name="APV_TITLE"class="form-control"
													aria-label="Sizing example input"
													aria-describedby="inputGroup-sizing-sm">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="input-group input-group-sm mb-1">
											<label   class="input-group-text " for="STAFF_MID_ID_select">중간결재자</label>
											<select class="form-select" name="STAFF_MID_ID" id="STAFF_MID_ID_select">
												<option selected></option>
												<c:forEach items="${Staff }" var="Staff">
													<c:choose>
														<c:when test="${Staff.STAFF_ID eq staffVO.staff_id }"></c:when>
														<c:otherwise>
															<option value="${Staff.STAFF_ID }">${Staff.STAFF_NAME }</option>
														</c:otherwise>
													</c:choose>
														
												
												
												</c:forEach>
											</select> <label class="input-group-text" for="STAFF_FNL_ID_select">최종결재자</label>
											<select name="STAFF_FNL_ID" class="form-select" id="STAFF_FNL_ID_select">
												<option selected></option>
												<c:forEach items="${Staff }" var="Staff">
												<c:choose>
														<c:when test="${Staff.STAFF_ID eq staffVO.staff_id }"></c:when>
														<c:otherwise>
															<option value="${Staff.STAFF_ID }">${Staff.STAFF_NAME }</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<div  class="input-group-sm mb-1">
												<input  name="FILES" type="file" class="form-control" multiple >
											</div>
										</div>
									</div>
									<div class="row" >
										<div class="col">
											<textarea style="height: 58vh" id="basic-example" name="APV_CONTENT"></textarea>
											

											
											
											
											<button class="btn border mt-2" type="button" style="color:#FA5858;" onclick="doSubmit()">기안서 올리기</button>
										</div>
									</div>
								</form>
								</div>






							</div>
						</div>
					</div>




					

					<!-- 여기다 작성하세요 -->
</div>
	<script
		src="https://cdn.jsdelivr.net/npm/@tinymce/tinymce-webcomponent@2/dist/tinymce-webcomponent.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>