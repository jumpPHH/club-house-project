<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
	.selectDiv {
	background-color: #bfc9e3;
	color: white !important;
	padding-left: 0px;
    padding-right: 0px;
    width: 60%;
}

.aClick{
    display: inline-block;
    color: #03c;
    -webkit-transition: 0.5s;
    -moz-transition: 0.5s;
    -o-transition: 0.5s;
    -ms-transition: 0.5s;
    transition: 0.5s;
}

.aClick:hover {
    -webkit-transform: scale(1.1,1.1);
    -moz-transform: scale(1.1,1.1);
    -o-transform: scale(1.1,1.1);
    -ms-transform: scale(1.1,1.1);
    transform: scale(1.1,1.1);
}
</style>





<script type="text/javascript">

document.addEventListener("DOMContentLoaded", function () {
	
	var nowPage = "${pageContext.request.requestURI}".split('/')["${pageContext.request.requestURI}".split('/').length-1];

	var url1 = document.getElementById("student_indexPage");
	var url2 = document.getElementById("student_MemberJoinMgmtPage");
	
		if((url1.getAttribute("href").split('/'))[5]+".jsp" == nowPage){
			$("#student_indexPage").attr('class','selectDiv');
		
		}else if ((url2.getAttribute("href").split('/'))[5]+".jsp" == nowPage) {
			$("#student_MemberJoinMgmtPage").attr('class','selectDiv');
		}
});


	var sessionUserId = "${sessionUserInfo.stud_id}";
	
	

	
	
	function activateUpdateAndDeleteButtonIfHeisWriter(){
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
			
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				var stud_id = jsonObj.data.stud_id;
				var sessionUserId = "${sessionUserInfo.stud_id}";
				
				if(stud_id == sessionUserId){
					var buttonBoxCol1 = document.querySelector('#buttonBox');
					
					var updateButtonAhref = document.createElement("a");
					updateButtonAhref.setAttribute("href","./student_modifyClubBoardPage?club_no="+club_no+"&club_board_no="+club_board_no);
					updateButtonAhref.setAttribute("style","font-size:0.4em");
					updateButtonAhref.setAttribute("class","mx-1");
					updateButtonAhref.innerText = "수정";
					buttonBoxCol1.appendChild(updateButtonAhref);
					
					
					var deleteButtonAhref = document.createElement("a");
					deleteButtonAhref.setAttribute("href","./student_deleteClubBoardProcess?club_no="+club_no+"&club_board_no="+club_board_no);
					deleteButtonAhref.setAttribute("style","font-size:0.4em");
					deleteButtonAhref.setAttribute("class","mx-1");
					deleteButtonAhref.innerText = "삭제";
					buttonBoxCol1.appendChild(deleteButtonAhref);
				}
			}
		}
		
		xhr.open("get" , "./restapi/getClubStudByClubStudNo?club_stud_no=${map.clubBoardData.club_stud_no}"); //리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send(); //AJAX로 리퀘스트함..

	}
	function inputClubBoardComment() {
		var commentContent = document.querySelector('#club_board_comment_content');
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
			
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				
				var commentListBox = document.querySelector('#commentListBox');
				commentListBox.innerHTML = "";
				var club_board_comment_content = document.querySelector('#club_board_comment_content');
				club_board_comment_content.value= null;
				
				refreshCommentList();
			}
		}
		

		xhr.open("post" , "./restapi/inputClubBoardComment"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("club_board_comment_content="+commentContent.value + "&club_no=${map.clubBoardData.club_no}&club_stud_no="+${sessionClubStudNo}+"&club_board_no="+${map.clubBoardData.club_board_no}); //AJAX로 리퀘스트함..
	}
	
	function refreshCommentList(){
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
			
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				for(let i = 0 ; i < jsonObj.length ; i++) {
					
					function dateFormat(date) {
						let dateFormat2 = date.getFullYear() +
							'-' + ( (date.getMonth()+1) < 9 ? "0" + (date.getMonth()+1) : (date.getMonth()+1) )+
							'-' + ( (date.getDate()) < 9 ? "0" + (date.getDate()) : (date.getDate()) );
						return dateFormat2;
					}

					let date = dateFormat(new Date(jsonObj[i].comment.club_board_comment_date));
					console.log(date);
					
					
					var clubBoardNo = jsonObj[i].comment.club_board_no;
					var clubBoardCommentNo = jsonObj[i].comment.club_board_comment_no;
					var clubNo = jsonObj[i].comment.club_no;
					var writerName = jsonObj[i].commentWriterInfo.stud_name;
					var commentContent = jsonObj[i].comment.club_board_comment_content;
					var commentWriteDate = jsonObj[i].comment.club_board_comment_date;
					
					var commentListBox = document.querySelector('#commentListBox');
					
					var row1 = document.createElement("div");
					row1.setAttribute("class", "row");
					commentListBox.appendChild(row1);
					
					var row1_col1 = document.createElement("div");
					row1_col1.setAttribute("class", "col");
					row1.appendChild(row1_col1);
					
					var row1_col1_row1 = document.createElement("div");
					row1_col1_row1.setAttribute("class", "row");
					row1_col1.appendChild(row1_col1_row1);
					
					var row1_col1_row1_col1= document.createElement("div");
					row1_col1_row1_col1.setAttribute("class", "col");
					row1_col1_row1_col1.setAttribute("style","font-weight:bold; font-size:1.2em;");
					row1_col1_row1_col1.innerText = writerName;
					row1_col1_row1.appendChild(row1_col1_row1_col1);
					
					var row1_col1_row1_col2= document.createElement("div");
					row1_col1_row1_col2.setAttribute("class", "col-1");
					row1_col1_row1.appendChild(row1_col1_row1_col2);
					
					if(${sessionClubStudNo} === jsonObj[i].comment.club_stud_no){
						var row1_col1_row1_col2_button = document.createElement("a");
						row1_col1_row1_col2_button.innerText = "삭제";
						row1_col1_row1_col2_button.setAttribute("href", "./restapi/deleteClubBoardComment_By3No?club_board_no="+clubBoardNo+"&club_no="+clubNo+"&club_board_comment_no="+clubBoardCommentNo);	// 나중에 delete 함수 만들면 넣어주기.
						row1_col1_row1_col2_button.setAttribute("style", "background-color:white; color:black; padding:1px; border:none; font-size:1.2em")
						row1_col1_row1_col2.appendChild(row1_col1_row1_col2_button);
					}
					
					
					var row1_col1_row2 = document.createElement("div");
					row1_col1_row2.setAttribute("class","row");
					row1_col1.appendChild(row1_col1_row2);
					
					var row1_col1_row2_col1 = document.createElement("div");
					row1_col1_row2_col1.setAttribute("class","col");
					row1_col1_row2_col1.setAttribute("style", "font-size:1em");
					row1_col1_row2_col1.innerText = commentContent;
					row1_col1_row2.appendChild(row1_col1_row2_col1);
					
					var row1_col1_row3 = document.createElement("div");
					row1_col1_row3.setAttribute("class","row");
					row1_col1.appendChild(row1_col1_row3);
					
					var row1_col1_row3_col1 = document.createElement("div");
					row1_col1_row3_col1.setAttribute("class","col");
					row1_col1_row3_col1.setAttribute("style", "font-size:1em");
					row1_col1_row3_col1.innerText = date;
					row1_col1_row3.appendChild(row1_col1_row3_col1);
					
					var hr = document.createElement("hr");
					hr.setAttribute("style","height:1px; color:#adb5bd; margin-top:2vh;");
					row1_col1_row3.appendChild(hr);
				}
				
			}
		}
		
		xhr.open("get" , "./restapi/getClubBoardComment?club_board_no=${map.clubBoardData.club_board_no}&club_no=${map.clubBoardData.club_no}"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send(); //AJAX로 리퀘스트함..
	}
	
	function deleteComment(clubBoardNo,clubNo,clubBoardCommentNo){
		console.log("clubBoardCommentNo" + clubBoardCommentNo + "clubNo : " + clubNo);
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200){
				var commentListBox = document.querySelector('#commentListBox');
				commentListBox.innerHTML = "";
				refreshCommentList();
			}
		}
		xhr.open("post","./restapi/deleteClubBoardComment_By3No");
		xhr.send("club_board_no="+clubBoardNo+"&club_no="+clubNo+"&club_board_comment_no="+clubBoardCommentNo); //AJAX로 리퀘스트함..
	}

	window.addEventListener("DOMContentLoaded", function() {
		//사실상 처음 실행하는 코드 모음...
		refreshCommentList();
		//setInterval(refreshCommentList , 3000); //폴링 방식의 실시간... 화면 갱신...

	});
</script>


<title>Insert title here</title>
</head>
<body>
	<jsp:include
		page="/WEB-INF/views/student_common/student_navigationvar.jsp"></jsp:include>

	<div class="page-content p-5" id="content">
		<!-- 토글 버튼 -->
		<button id="sidebarCollapse" type="button"
			class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4">
			<i class="fa fa-bars mr-2"></i><small
				class="text-uppercase font-weight-bold"
				style="box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075) !important;">Toggle</small>
		</button>

		<div class="row card box"
			style="width: 100%; height: 45px; margin-left: 0.1em; margin-bottom: 1em;">
			<div class="dashboard-card-bottom">
				<div class="row">

					<div class="col-1"></div>

					<div class="col">

						<div class="row ps-1 p-2 mb-2">
							<div class="col text-center">
								<div class="row"
									style="justify-content: center; border-right: 2px solid #ededed">
									<a id="student_indexPage"
										href="/cbh/student/myclub/clubboard/student_indexPage?club_no=${map.clubBoardData.club_no }"
										class="col-auto px-3 aClick"
										style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration-line: none; background-color: #bfc9e3; color: white !important; padding-left: 0px; padding-right: 0px; width: 60%;">
										자유게시판 </a>
								</div>
							</div>

							<div class="col text-center">
								<div class="row" style="justify-content: center">
									<a id="student_MemberJoinMgmtPage"
										href="/cbh/student/myclub/clubboard/student_writeClubBoardPage?club_no=${map.clubBoardData.club_no }"
										class="col-auto px-3 aClick"
										style="cursor: pointer; border-radius: 2rem; color: #4140cb; font-weight: bold; text-decoration: none;">
										자유게시판 작성 </a>
								</div>
							</div>
						</div>

					</div>
					<div class="col-1"></div>
				</div>
			</div>
		</div>



		<div class="card"
			style="width: 100%; height: auto; border-radius: 15px; box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075) !important; padding: 30px;">
			<div class="dashboard-card-bottom">
				<!-- 실제 내용 -->

				<div class="container-fluid">
					<div class="row">
						<div class="col">

							<!-- 여기다 작성하세요 -->
							<div class="row">
								<div class="col" id="content">
									<!-- 컨텐트 박스 -->
									<div class="row">
										<div class="col">
											<!-- 글 제목 공간 -->
											<div class="row"
												style="border-top: 1px solid #ddd; border-bottom: 1px solid #ddd; background-color: #f6f6f6">
												<div class="col" style="text-align: center;">
													<h2 style="margin-top: 1em;">${map.clubBoardData.club_board_title }</h2>
													<br>
												</div>
											</div>

											<!-- 글의 내용 공간 -->
											<div class="row">
												<div class="col">

													<!-- 조회수 및 날짜 공간 -->
													<div class="row">
														<div class="col"
															style="text-align: right; margin-top: 1em; padding: 1em 2em 0.2em 2em;">
															조회수 : ${map.clubBoardData.club_board_readcount } | 날짜 :
															<fmt:formatDate value="${map.clubBoardData.club_board_writedate }"
																pattern="yyyy-MM-dd" />
														</div>
													</div>

													<!-- 작성자 -->
													<div class="row">
														<div class="col"
															style="text-align: right; padding: 0 2em;">작성자 : ${map.studVO.stud_name }
														</div>
													</div>

													<!-- 진짜 글 내용 -->
													<div class="row">
														<div class="col mt-5" style="padding: 2em; margin: 2em 0;">
															${map.clubBoardData.club_board_content }</div>
													</div>
										
													<div class="row">
														
															<div class="col mb-5" style="padding:2em;">
																<img src="\cbh\resources\img\student\clubImage02jpg.jpg"><br>
															</div>
														
													</div>
													
													
													<!-- 목록 버튼 칸  -->
													<div class="row">
														<div class="col" id="buttonBox"
															style="padding: 2em; border-top: 1px solid #ddd">
															<span><button class="btn btn-secondary">목록</button></span>
															<span><button class="btn btn-primary" onclick="location.href='/cbh/student/myclub/clubboard/student_modifyClubBoardPage?club_no=${map.clubBoardData.club_no}&club_board_no=${map.clubBoardData.club_board_no }'">수정</button></span>
															<span><button class="btn btn-danger"  onclick="location.href='/cbh/student/myclub/clubboard/student_deleteClubBoardProcess?club_no=${map.clubBoardData.club_no}&club_board_no=${map.clubBoardData.club_board_no }'">삭제</button></span>
														</div>
													</div>
													
													<!-- 1 리스트 박스 -->
													<div style="font-weight:bold; font-size:20px; margin-top:3em;">댓글</div>
													<div class="row mt-5">
														<div class="col" id="commentListBox"  style="border:1px; border-radius:5px; border-color:gray;">
														
														</div>
													</div>
													<div class="row"  style="border-top:1px solid #ddd; margin-top:1em; width:15%; margin-left:1px;">
														<div class="col">
														</div>
													</div>
													
													
													<!-- 댓글작성박스 -->
													<div class="row mt-5">
														<div class="col">
															<input type="text" id="club_board_comment_content" style="width:100%; height:5vh;  border: solid 2px #adb5bd; border-radius: 8px; ">
														</div>
														<div class="col-1">
															<button class="btn btn-secondary" onclick="inputClubBoardComment()">작성</button>
														</div>
													</div>

													<!-- 다음 글 이전글 박스 -->
													<table class="table" style="margin-top: 8vh">
														<colgroup>
															<col width="25%">
															<col width>
														</colgroup>
														<thead>
														</thead>
														<tbody>
															<tr style="border-top: 1px solid #dee2e6">
																<th
																	style="border-right: 1px solid #dee2e6; text-align: center; padding: 2vh 0.5vh">다음
																	글</th>
																<td style="padding-left: 1em; padding: 2vh"><a
																	style="color:black; text-align:center;" href="./student_clubBoardContentPage?club_board_no=${map.NextPostBoardNo }&club_no=${map.clubBoardData.club_no}">${map.NextPostTitle }</a></td>
															</tr>
															<tr style="border-top: 1px solid #dee2e6">
																<th
																	style="border-right: 1px solid #dee2e6; text-align: center; padding: 2vh 0.5vh">이전
																	글</th>
																<td style="padding-left: 1em; padding: 2vh"><a
																	style="color:black; text-align:center;" href="./student_clubBoardContentPage?club_board_no=${map.PreviousPostBoardNo }&club_no=${map.clubBoardData.club_no}">${map.PreviousPostTitle }</a></td>
															</tr>
														</tbody>
													</table>

												</div>
											</div>

										</div>
									</div>
								</div>
								<input type="hidden" id="club_no"
									value="${map.clubActData.club_no }"> <input
									type="hidden" id="club_act_no"
									value="${map.clubActData.club_act_no }">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>