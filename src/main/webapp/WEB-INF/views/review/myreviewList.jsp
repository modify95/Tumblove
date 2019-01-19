<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".myreviewList_Update_button")
				.click(
						function() {
							var ur_num = $(this).data("num");

							var update_form = "<form id='myreviewList_update_form' enctype = multipart/form-data>";
							update_form += "<ul id='update_ul'>";
							update_form += "<li id='update_num'><input id='update_num_text' type ='hidden' name ='r_num' value = '"+ ur_num +"'>";
							update_form += "<li id='update_title'><input id='update_title_text' type ='text' name='r_title' value ='"
									+ $(".myReviewList_r_title").text()
									+ "'></li>";
							update_form += "<li id='update_content'><textarea id='update_content_text' rows='3' cols='120' style ='resize:none;' name = 'r_content' value ='"
									+ $(".myReviewList_r_content").text()
									+ "'/> </li>";
							update_form += "<li id='update_submit'><input type ='button' value ='수 정' id ='update_submit_button'></li>";
							update_form += "<li id='update_back'><input type ='button' value = '이 전' id ='update_back_button'></li>";
							update_form += "<label id='update_score_label'>평점:</label>";
							update_form += "<li id='update_score'>";
							update_form += "<select id='update_score_text' name ='r_score'>";
							update_form += "<option value ='1'>★</option>";
							update_form += "<option value ='2'>★★</option>";
							update_form += "<option value ='3'>★★★</option>";
							update_form += "<option value ='4'>★★★★</option>";
							update_form += "<option value ='5' selected = 'selected'>★★★★★</option>";
							update_form += "</select>";
							update_form += "</li>";
							update_form += "<li id ='update_writer'><input type='hidden' id='update_writer_text' name= 'r_writer' value ='"
									+ $(".myReviewList_r_writer").text()
									+ "'</li>";
							update_form += "<li id= 'update_file_label'><label for='update_image_text' id='file_label'>사진선택</label>"
							update_form += "<li id='update_image'><input type ='file' name='file' id = 'update_image_text'></li>";
							
							update_form += "</ul>";
							update_form += "</form>";
							
							$("#myReviewList_div").empty();
							$("#myReviewList_div").append(update_form);
						});
	});

	$(document).on("click", "#update_submit_button", function() {
		if ($("#update_title_text").val() == "") {
			alert("제목을 입력해 주세요.");
			return;
		} else if ($("#update_content_text").val() == "") {
			alert("내용을 입력해 주세요.");
			return;
		} else {
			$("#myreviewList_update_form").attr({
				"method" : "post",
				"action" : "/myreview/myreviewUpdate"
			});
			$("#myreviewList_update_form").submit();
			alert("수정이 완료되었습니다.");
		}
	});
	// 이전 버튼
	$(document).on("click", "#update_back_button", function() {
		location.href = "/myreview/myreviewlist";
	});

	$(function() {
		$(".myreviewList_Delete_button").click(
				function() {
					var dr_num = $(this).data("num");
					$("#delete_num").val(dr_num);

					var mylist_delete_form = $("[id='myReviewDelete_form']")
							.serialize();

					if (confirm("정말 삭제하시겠습니까?")) {
						$.ajax({
							url : "/myreview/myreviewDelete",
							type : "post",
							data : mylist_delete_form,
							success : function(data) {
								location.reload();
							}
						});
					}
				});
	});
</script>
<style type="text/css">
#container { /* 전체 CSS 설정 */
	height: auto;
	width: 800px;
	margin: auto;
}

#myReviewList_div { /* 리뷰 리스트 div 설정  */
	width: 600px;
}

.myReviewList_ul { /* 리뷰 리스트 (ul)설정 CSS*/
	list-style-type: none;
	width: 600px;
	height: 10px;
}

.myReviewList_r_score { /* 리뷰 평점 li */
	float: left;
}

.myReviewList_r_title { /* 리뷰 제목  li */
	float: left;
	padding-left: 10px;
	padding-right: 10px;
}

.myReviewList_r_date { /* 리뷰 작성 날짜 li */
	float: right;
}

.myReviewList_r_writer { /* 리뷰 글쓴이 li */
	float: right;
	margin-right: 15px;
}

.myReviewList_r_image { /* 리뷰 이지미 div */
	width: 80px;
	height: 80px;
	float: right;
}

.myReviewList_r_content { /* 리뷰 내용  div */
	width: 500px;
	height: 80px;
	margin-bottom: 20px;
}
/* .review_list_starImage{  리스트 평점 이미치 CSS
} */
.myreviewList_Update_button {
	float: left;
}

.myreviewList_Delete_button {
	float: left;
}

#myReviewList_div {
	margin-left: 80px;
	position: relative;
	top: 25px;
}

#myReviewList_Container_div {
	margin-top: 280px;
}
.myreviewList_Update_button{
	border-radius: 5px;
	margin-left: 5px;
	box-shadow: none;
	font-size: 14px;
	background-color: lightgray;
	padding-left: 15px;
	padding-right: 15px;
}
.myreviewList_Delete_button{
	border-radius: 5px;
	margin-left: 5px;
	box-shadow: none;
	font-size: 14px;
	background-color: lightgray;
	padding-left: 15px;
	padding-right: 15px;
}
#myreviewslist_hr{
position: relative;
top: 50px;
}
/*********************************수정 CSS ********************************************/
#update_ul{
list-style-type: none;
}
#update_title_text{
width: 551px;
margin-bottom: 5px;
}
#update_content_text{
width: 550px;
margin-bottom: 5px;
}
#update_score_label{
float: left;
size: 14px;
}
#update_score_text{
float: left;
-webkit-appearance: none; /* 네이티브 외형 감추기 */
-moz-appearance:none;
apperance:none;
background: url('/resources/image/review/selectDirection.jpg') no-repeat 100% 50%; /* 화살표 이미지 넣기 */
width: 100px;
margin-left: 3px;
color: red;
size: 14px;
}
#update_image_text{
display: none;
}
#file_label{
color: black;
background-color: lightgray;
font-size: 14px;
border-radius: 5px;
padding-top:3px;
padding-bottom:3px;
padding-left: 20px;
padding-right: 20px;
margin-left: 5px;
}
#update_submit_button{
	border-radius: 5px;
	margin-left: 5px;
	box-shadow: none;
	font-size: 14px;
	background-color: lightgray;
	padding-left: 15px;
	padding-right: 15px;
	float: right;
}
#update_back_button{
	border-radius: 5px;
	margin-left: 5px;
	box-shadow: none;
	font-size: 14px;
	background-color: lightgray;
	padding-left: 15px;
	padding-right: 15px;
	float: right;
}
</style>

</head>
<body>
	<div id="container">
		<div id="myReviewList_Container_div">
			<hr>
			<c:forEach var="list" items="${list}">
				<div id="myReviewList_div">
					<div class="myReviewList_r_score">
						<c:choose>
							<c:when test="${list.r_score == 5}">
								<span class="review_list_starImage"><img
									src="/resources/image/review/star5.png" width="90" height="20" /></span>
							</c:when>
							<c:when test="${list.r_score == 4}">
								<span class="review_list_starImage"><img
									src="/resources/image/review/star4.png" width="90" height="20" /></span>
							</c:when>
							<c:when test="${list.r_score == 3}">
								<span class="review_list_starImage"><img
									src="/resources/image/review/star3.png" width="90" height="20" /></span>
							</c:when>
							<c:when test="${list.r_score == 2}">
								<span class="review_list_starImage"><img
									src="/resources/image/review/star2.png" width="90" height="20" /></span>
							</c:when>
							<c:when test="${list.r_score == 1}">
								<span class="review_list_starImage"><img
									src="/resources/image/review/star1.png" width="90" height="20" /></span>
							</c:when>
						</c:choose>
					</div>

					<ul class="myReviewList_ul">
						<li class="myReviewList_r_title">${list.r_title}</li>
						<li><input type="button" value="수 정"
							class="myreviewList_Update_button" data-num="${list.r_num}"></li>
						<li><input type="button" value="삭 제"
							class="myreviewList_Delete_button" data-num="${list.r_num}"></li>
						<li class="myReviewList_r_date">${list.r_date}</li>
						<li class="myReviewList_r_writer">${list.r_writer}</li>
					</ul>

					<c:if test="${!empty list.r_image}">
						<div class="myReviewList_r_image">
							<img src="/uploadStorage/review/${review_list.r_image}" />
						</div>
					</c:if>
					<c:if test="${list.r_writer == sessionScope.writer}">

					</c:if>
					<div class="myReviewList_r_content">${list.r_content}</div>
				</div>
			<hr id="myreviewslist_hr">	
			</c:forEach>
			
		</div>
		<div id="myReivewDelete_div">
			<form id="myReviewDelete_form">
				<input type="hidden" id="delete_num" name="r_num">
			</form>
		</div>
	</div>
</body>
</html>





















