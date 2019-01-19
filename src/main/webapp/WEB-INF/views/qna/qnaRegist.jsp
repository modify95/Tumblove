<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/admin/ionicons.min.css">
<link rel="stylesheet" href="/resources/admin/AdminLTE.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#qnaSubmitBtn").click(function() {
			$("#writeForm").attr({
				"method" : "POST",
				"action" : "/qna/qnaInsert"
			});
			$("#writeForm").submit();
		});
		$("#qnaListBtn").click(function() {
			location.href = "/qna/qnaList";
		});
		$("#public").click(function() {
			$("#reveal_area").hide();
		});
		$("#noPublic").click(function() {
			$("#reveal_area").show();	
		});
		$("#qnaListBtn").click(function() {
			location.href = "/qna/qnaList";
		});
	});
</script>
<style>
#board_area {
	width: 900px;
	min-height: 300px;
	margin: auto;
}
#cfaq_category_select {
	width: 100px;
	float: left;
}
#cq_title {
	width: 775px;
	float: right;	
}
#cQnaRegistButtons {
	float: left;
	margin-left: 8px;	
}
#reveal_radios {
	float: right;
	margin-top: 3px;
	margin-right: 10px;
}
#reveal_area {
	display: none;
	float: left;
	width: 240px;	
	height: 30px;
}
#reveal_area input[type='text'] {
	float: left;
	display: inline;
	width: 160px;
	height: 30px;
	margin-right: 8px;
}
#reveal_area label {
	float: left;
	vertical-align: middle;
	margin-right: 8px;
	margin-top: 4px;
}
#box_footer {
	margin-top: 18px;
	margin-bottom: 50px;
}
</style>
</head>
<body>
	<br>
	<form id="writeForm" name="writeForm">
		<input type="hidden" value="<%=session.getAttribute("m_id")%>"
			name="m_id">	
		<div class="box box-primary" id="board_area">
			<div class="box-header with-border">
				<h3 class="box-title">QnA 작성</h3>
			</div>
			<div class="box-body">
				<div class="form-group">
				<select name="q_category" class="form-control" id="cfaq_category_select">
					<option value="상품">상품</option>
					<option value="결제">결제</option>
					<option value="배송">배송</option>
					<option value="환불">환불</option>
					<option value="교환">교환</option>
					<option value="회원">회원</option>
					<option value="오류">오류</option>
				</select>
					<input class="form-control" name="q_title" id="cq_title" placeholder="제목">
				</div>
				<div class="form-group">
					<%
						if (session.getAttribute("m_id") == null) {
					%>
					<script type="text/javascript">
						location.href = "/qna/qnaList";
					</script>
					<%
						} else {
					%>
					<input class="form-control" readonly="readonly"
						value="<%=session.getAttribute("m_id")%>" placeholder="작성자">
					<%
						}
					%>
				</div>
				<div class="form-group">
					<textarea name="q_content" id="q_content" class="form-control"
						style="height: 300px">
</textarea>
				</div>
			</div>
			<!-- /.box-body -->
			<div id="box_footer">
			<div id="cQnaRegistButtons">
				<input type="button" value="목록" class="btn btn-default"
				id="qnaListBtn">
				<button type="button" class="btn btn-primary" id="qnaSubmitBtn">
				<i class="ion-ios-book-outline"></i>&nbsp;등록
			</button>
			</div>
			<div id="reveal_radios">
			<input type="radio" name="public" id="noPublic" value="비공개">비공개
			<input type="radio" name="public" id="public" value="공개" checked="checked">공개
			</div>
				<div class="pull-right" id="reveal_area">		
					<label id="passlb">비밀번호</label>
					<input type="text" id="password" class="form-control" name="q_password"><br> 
			</div>
			</div>
		</div>
		<!-- /. box -->
	</form>
</body>
</html>