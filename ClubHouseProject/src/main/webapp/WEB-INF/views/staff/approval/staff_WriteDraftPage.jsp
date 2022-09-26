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
<script
	src="https://cdn.tiny.cloud/1/bdorzubong3byjkwg9kl0ayxl92mhi8e0f24djie6ukepumt/tinymce/6/tinymce.min.js"
	referrerpolicy="origin"></script>
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
			alert("최종결재자는 필수입니다.")
			return;
		}
		
		var APV_FORM =document.getElementById("APV_FORM");
		APV_FORM.submit();
		
	}
	
	function selectApvDiv(e){
		var selectAPV_DIV_NO = e.querySelector(".no").innerText
		var APV_DIV_NO = document.getElementById("APV_DIV_NO");
		APV_DIV_NO.setAttribute("value",selectAPV_DIV_NO);
		$(".divisionTab").removeClass("table-active");
		if(e){
			e.classList.add("table-active")
		}
	}
</script>


</head>
<body>
	<jsp:include page="../../staff_common/staff_sidevar.jsp"></jsp:include>

<main>

					<!-- 여기다 작성하세요 -->
					<div class="row px-3">
						<div class="col">
							<div class="row">
							
								<div class="col-2 me-3 px-0"
									style="height: 75vh;">
									<table class="table table-hover caption-top table-sm">
										<thead>
											<tr class="text-center">
												<th scope="col">결재구분</th>
											</tr>
										</thead>
										<tbody class="text-center">
											<c:forEach items="${ApvDiv }" var="ApvDiv">
												<tr class="divisionTab"style="cursor: pointer;"onclick="selectApvDiv(this)">
													<td>${ApvDiv.APV_DIV_NAME }<span class="no" style="display: none;">${ApvDiv.APV_DIV_NO }</span> </td>
												</tr>
											</c:forEach>

										</tbody>
									</table>
								</div>
							
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
											<label style="background-color: white"  class="input-group-text " for="STAFF_MID_ID_select">중간결재자</label>
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
											

											
											
											
											<button class="btn"type="button" onclick="doSubmit()">결재</button>
										</div>
									</div>
								</form>
								</div>






							</div>
						</div>
					</div>




					

					<!-- 여기다 작성하세요 -->
</main>
	<script
		src="https://cdn.jsdelivr.net/npm/@tinymce/tinymce-webcomponent@2/dist/tinymce-webcomponent.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>