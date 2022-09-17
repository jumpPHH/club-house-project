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
<link rel="stylesheet" type="text/css" href="/cbh/resources/summernote/css/asdasdasd_style.css">
<link rel="stylesheet" href="/cbh/resources/css/staff_MainPage.css">
<script src="https://cdn.tiny.cloud/1/bdorzubong3byjkwg9kl0ayxl92mhi8e0f24djie6ukepumt/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>


</head>
<body>
<jsp:include page="../../staff_common/staff_header.jsp"></jsp:include>
<jsp:include page="../../staff_common/staff_sidevar.jsp"></jsp:include>

<div style="position: absolute; left: 13.5%; width: 86.5%; top: 14vh; height:86vh;overflow-y: auto">
	<div class="container-fluid" >
		<div class="row" >
			<div class="col">
				
				<!-- 여기다 작성하세요 -->
				<div class="row mt-1 mb-3">
					<div class="col"
						style="font-size: 1.6em; font-weight: bold; color: #C4073D">기안서작성
					</div>
				</div>
				<div class="row">
					<div class="col">
						<div class="row">
							<div class="col">
								<span>제목</span><input type="text">
							</div>
							<div class="col">
								<span>일자</span><input type="date">
							</div>
						</div>
						


					</div>
				</div>
				
<form action="./test" method="post">	
<textarea id="basic-example" name="test">
</textarea>
<button type="submit">저장</button>
</form>
		<script type="text/javascript">
		tinymce.init({
			  selector: 'textarea#basic-example',
			  statusbar: false,
			  language: 'ko_KR',
			  height: 500,
			  font_family_formats: 'Andale Mono=andale mono,times; Arial=arial,helvetica,sans-serif; Arial Black=arial black,avant garde; Book Antiqua=book antiqua,palatino; Comic Sans MS=comic sans ms,sans-serif; Courier New=courier new,courier; Georgia=georgia,palatino; Helvetica=helvetica; Impact=impact,chicago; Symbol=symbol; Tahoma=tahoma,arial,helvetica,sans-serif; Terminal=terminal,monaco; Times New Roman=times new roman,times; Trebuchet MS=trebuchet ms,geneva; Verdana=verdana,geneva; Webdings=webdings; Wingdings=wingdings,zapf dingbats; 궁서체=궁서체;',
			  plugins: [
			    'advlist', 'autolink', 'lists', 'link', 'image', 'charmap', 'preview',
			    'anchor', 'searchreplace', 'visualblocks', 'code', 'fullscreen',
			    'insertdatetime', 'media', 'table', 'help', 'wordcount'
			  ],
			  toolbar: ' | blocks fontfamily| ' +
			  'bold italic backcolor | alignleft aligncenter ' +
			  'alignright alignjustify | bullist numlist outdent indent | ' +
			  'removeformat table| help',
			  content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:16px }'
				
		});
		</script>		
				
				
				<!-- 여기다 작성하세요 -->
				
			</div>
		</div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/@tinymce/tinymce-webcomponent@2/dist/tinymce-webcomponent.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>