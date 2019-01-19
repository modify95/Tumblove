<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/client_main.css">
<link rel="stylesheet" href="/resources/css/manager_main.css">
<link rel="stylesheet" href="/resources/css/manager_board.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function() {
		$("#boardButton1").on("click", function(){
			$(this).attr("class","btn btn-primary btn-lg btn-block");
			$("#boardButton2").attr("class","btn btn-default btn-lg btn-block");
			$("#boardButton3").attr("class","btn btn-default btn-lg btn-block");
			$("#boardButton4").attr("class","btn btn-default btn-lg btn-block");
			$.ajax({
				url: "/manager/notice/list",
				type: "post",
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "post"
				},
				success: function(result) {
					$("#board_area").html(result);
				},
				error: function(result){
					alert("진행중 오류가 발생했습니다.");
				}
			});
		});
		$("#boardButton2").on("click", function(){
			$(this).attr("class","btn btn-primary btn-lg btn-block");
			$("#boardButton1").attr("class","btn btn-default btn-lg btn-block");
			$("#boardButton3").attr("class","btn btn-default btn-lg btn-block");
			$("#boardButton4").attr("class","btn btn-default btn-lg btn-block");
			$.ajax({
				url: "/manager/qna/list",
				type: "post",
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "post"
				},
				success: function(result) {
					$("#board_area").html(result);
				},
				error: function(result){
					alert("진행중 오류가 발생했습니다.");
				}
			});
		});
		$("#boardButton3").on("click", function(){
			$(this).attr("class","btn btn-primary btn-lg btn-block");
			$("#boardButton1").attr("class","btn btn-default btn-lg btn-block");
			$("#boardButton2").attr("class","btn btn-default btn-lg btn-block");	
			$("#boardButton4").attr("class","btn btn-default btn-lg btn-block");
			$.ajax({
				url: "/manager/review/list",
				type: "post",
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "post"
				},
				success: function(result) {
					$("#board_area").html(result);
				},
				error: function(result){
					alert("진행중 오류가 발생했습니다.");
				}
			});
		});
		$("#boardButton4").on("click", function(){
			$(this).attr("class","btn btn-primary btn-lg btn-block");
			$("#boardButton1").attr("class","btn btn-default btn-lg btn-block");
			$("#boardButton2").attr("class","btn btn-default btn-lg btn-block");
			$("#boardButton3").attr("class","btn btn-default btn-lg btn-block");
			$.ajax({
				url: "/manager/faq/list",
				type: "post",
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "post"
				},
				success: function(result) {
					$("#board_area").html(result);
				},
				error: function(result){
					alert("진행중 오류가 발생했습니다.");
				}
			});
		});
	});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="board_wrapper">
	<div class="boardButtons" id="bdbtn1"><button type="button" class="btn btn-default btn-lg btn-block" id="boardButton1">공지사항 게시판</button></div>
	<div class="boardButtons"><button type="button" class="btn btn-default btn-lg btn-block" id="boardButton2">Q&A 게시판</button></div>
	<div class="boardButtons"><button type="button" class="btn btn-default btn-lg btn-block" id="boardButton3">리뷰 게시판</button></div>
	<div class="boardButtons"><button type="button" class="btn btn-default btn-lg btn-block" id="boardButton4">자주 묻는 질문 게시판</button></div>
	<br>
	<div id="board_area">
		<p id="boardChoiceP">게시판을 선택하십시오.</p>
	</div>
</div>
</body>
</html>