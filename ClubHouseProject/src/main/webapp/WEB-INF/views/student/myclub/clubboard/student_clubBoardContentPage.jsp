<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="/cbh/resources/css/NewFile.css">
<link rel="stylesheet" href="/cbh/resources/css/establishingclub.css">
<script src="https://code.jquery.com/jquery-3.6.1.js"
        integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
        crossorigin="anonymous">
</script>




<style type="text/css">
.tab {
	border: 1px solid white;
	border-bottom: 0px;
	background-color: black;
	color: white;
	width: auto;
	align-self: end;
	flex: 0 0 auto;
	border-radius: 0.3rem 0.3rem 0% 0%;
}

.scroll-container {
	display: flex;
	flex-wrap: no-wrap;
	overflow-x: hidden;
	overflow-y: hidden;
	align-items: end;
}

.MP {
	padding-left: 2.2rem;
}

#bigMenuText{
	font-size: 2.5vh;
}
#sideBar>ul>li{
	font-size: 2vh;
	padding-left: 1.0vw;
}
#sideBar>ul>li>div{
	background:linear-gradient( to right, #d6d6d6 , #ededed );
	margin-right: 1.0vw;
	padding-left:1vw;
	border-radius: 5vh;
	color:#969696;
	font-weight: bold;
}
#sideBar>ul>li>div{
	margin-bottom: .2vh;
	margin-right: 1.0vw;
	padding-left:1vw;
	border-radius: 5vh;
}
#sideBar li ul li{
	font-size: 1.8vh;
	list-style-type: disc;
	list-style: none;
	margin-bottom: .5vh;
	color: #828282;
}
#sideBar li ul li:hover{
	font-weight: bold;
	color: #bf1f51;
	letter-spacing: 0.05vw;
}
#sideBar ul{
	margin-bottom: 1.5vh;
	padding-left: 0;
}
#sideBar li ul{
	padding-left: 1vw;
	margin-bottom: 2.2vh;
}
.bi-chevron-right{
	
}
</style>

<script type="text/javascript">
	
	var club_no = ${map.clubBoardData.club_no};
	var club_board_no = ${map.clubBoardData.club_board_no};
	var club_stud_no = ${map.clubBoardData.club_stud_no};
	var sessionUserId = "${sessionUserInfo.stud_id}";
	
	

	function seeTheReason(){
// 		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
// 		xhr.onreadystatechange = function () {
			
// 			if(xhr.readyState == 4 && xhr.status == 200){
// 				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				
				
// 			}
// 		}
		
// 		xhr.open("get" , "./getReject); //리퀘스트 세팅..
// 		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
// 		xhr.send(); //AJAX로 리퀘스트함..

		var popUrl = "./establishingClubRejectReasonPage";
	    var popOption = "top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no, scrollbars=no";
	    window.open(popUrl, popOption);
	}
	
	
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
					row1_col1_row1_col1.setAttribute("style","font-weight:bold; font-size:12px;");
					row1_col1_row1_col1.innerText = writerName;
					row1_col1_row1.appendChild(row1_col1_row1_col1);
					
					var row1_col1_row1_col2= document.createElement("div");
					row1_col1_row1_col2.setAttribute("class", "col-1");
					row1_col1_row1.appendChild(row1_col1_row1_col2);
					
					if(${sessionClubStudNo} === jsonObj[i].comment.club_stud_no){
						var row1_col1_row1_col2_button = document.createElement("a");
						row1_col1_row1_col2_button.innerText = "삭제";
						row1_col1_row1_col2_button.setAttribute("href", "deleteComment("+clubBoardNo+","+clubNo+","+clubBoardCommentNo + ")");	// 나중에 delete 함수 만들면 넣어주기.
						row1_col1_row1_col2_button.setAttribute("style", "background-color:white; color:black; padding:1px; border:none; font-size:10px")
						row1_col1_row1_col2.appendChild(row1_col1_row1_col2_button);
					}
					
					
					var row1_col1_row2 = document.createElement("div");
					row1_col1_row2.setAttribute("class","row");
					row1_col1.appendChild(row1_col1_row2);
					
					var row1_col1_row2_col1 = document.createElement("div");
					row1_col1_row2_col1.setAttribute("class","col");
					row1_col1_row2_col1.setAttribute("style", "font-size:13px");
					row1_col1_row2_col1.innerText = commentContent;
					row1_col1_row2.appendChild(row1_col1_row2_col1);
					
					var row1_col1_row3 = document.createElement("div");
					row1_col1_row3.setAttribute("class","row");
					row1_col1.appendChild(row1_col1_row3);
					
					var row1_col1_row3_col1 = document.createElement("div");
					row1_col1_row3_col1.setAttribute("class","col");
					row1_col1_row3_col1.setAttribute("style", "font-size:10px");
					row1_col1_row3_col1.innerText = date;
					row1_col1_row3.appendChild(row1_col1_row3_col1);
					
					var hr = document.createElement("hr");
					hr.setAttribute("style","height:1px; color:#adb5bd; margin-top:2vh;");
					row1_col1_row3.appendChild(hr);
				}
				
			}
		}
		
		xhr.open("get" , "./restapi/getClubBoardComment?club_board_no=${map.clubBoardData.club_board_no}&club_no=${map.clubBoardData.club_no}"); //리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
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
		xhr.open("get","./restapi/deleteClubBoardComment_By3No?club_board_no="+clubBoardNo+"&club_no="+clubNo+"&club_board_comment_no="+clubBoardCommentNo);
		xhr.send(); //AJAX로 리퀘스트함..
	}
	
	function updateComment(){
		
	}
	
	window.addEventListener("DOMContentLoaded" , function (){
		//사실상 처음 실행하는 코드 모음...
		activateUpdateAndDeleteButtonIfHeisWriter();
		refreshCommentList();
		//setInterval(refreshCommentList , 3000); //폴링 방식의 실시간... 화면 갱신...
		
	});
	
	
	
</script>


<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/student_common/student_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/student_common/student_sidevar.jsp"></jsp:include>


<div style="position: absolute; left: 13.5%; width: 86.5%; top: 14vh; height:86vh;overflow-y: auto">
	<div class="container-fluid">
		<div class="row" >
			<div class="col">
				
				<!-- 여기다 작성하세요 -->
				<div class="row">
					<div class="col" id="content">
							<!-- 컨텐트 위에 헤더 -->
							<div class="row page_title">
								<div class="col-4 page_title_text">
									<span style="margin-left: 0.3em;">자유게시판</span>
								</div>
								<div class="col"></div>
							</div>
							<!-- 컨텐트 박스 -->
							<div class="row">
								<div class="col">
									<!-- 글 제목 공간 -->	
									<div class="row">
										<div class="col" style="text-align:center;">
											<hr style="height:1px; color:gray;" class="py-3"><br>
											<h2>${map.clubBoardData.club_board_title }</h2><br>
											<hr style="height:1px; color:gray;" class="py-3">
										</div>
									</div>
									
									<!-- 글의 내용 공간 -->	
									<div class="row">
										<div class="col">
										
											<!-- 조회수 및 날짜 공간 -->
											<div class="row">
												<div class="col" style="text-align:right">
													조회수 : ${map.clubBoardData.club_board_readcount } |  날짜 : <fmt:formatDate value="${map.clubBoardData.club_board_writedate }" pattern="yyyy-MM-dd"/>
												</div>
											</div>
											
											<!-- 진짜 글 내용 -->
											<div class="row">
												<div class="col mt-5">
													${map.clubBoardData.club_board_content }
												</div>
											</div>
											<div class="row">
											<c:forEach items="${map.clubBoardImageList }" var="clubBoardImageLink">
												<div class="col">
													<img src="${clubBoardImageLink.club_board_image_link }"><br>
												</div>
											</c:forEach>
											</div>
											<!-- 목록 버튼 칸  -->
											<div class="row mt-5">
												<div class="col" id="buttonBox">
													
												</div>
											</div>
											<hr style="height:1px; color:gray">
											
											
											<!-- 댓글 리스트 박스 -->
											<div class="row mt-5">
												<div class="col" id="commentListBox"  style="border:1px; border-radius:5px; border-color:gray;"><span style="font-weight:bold; font-size:20px">댓글</span>
												<br> <hr style="height:5px; color:gray; width:8%; margin-bottom:3vh">
													
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
											<table class="table" style="margin-top:8vh">
												<colgroup>
													<col width="25%">
													<col width>
												</colgroup>
												<thead>
												</thead>
												<tbody>
													<tr style="border-top: 1px solid #dee2e6">
														<th style="border-right: 1px solid #dee2e6; text-align:center; padding:2vh 0.5vh">다음 글</th>
														<td style="padding-left:1em; padding:2vh"><a href="./student_clubBoardContentPage?club_board_no=${map.NextPostBoardNo }&club_no=${map.clubBoardData.club_no}">${map.NextPostTitle }</a></td>
													</tr>
													<tr style="border-top: 1px solid #dee2e6">
														<th style="border-right: 1px solid #dee2e6; text-align:center; padding:2vh 0.5vh">이전 글</th>
														<td style="padding-left:1em; padding:2vh"><a href="./student_clubBoardContentPage?club_board_no=${map.PreviousPostBoardNo }&club_no=${map.clubBoardData.club_no}">${map.PreviousPostTitle }</a></td>
													</tr>
												</tbody>
											</table>
												
										</div>	
									</div>
								
								</div>
							</div>
						</div>
						<div class="col-2">
							<input type="hidden" id="club_no" value="${map.clubBoardData.club_no }">
							<input type="hidden" id="club_board_no" value="${map.clubBoardData.club_board_no }">
						</div>
						</div>
				</div>
			</div>
		</div>
	</div>
					
</body>
</html>