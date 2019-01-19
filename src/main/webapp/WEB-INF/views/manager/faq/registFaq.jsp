<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/admin/ionicons.min.css">
<link rel="stylesheet" href="/resources/admin/AdminLTE.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min"></script>
<script type="text/javascript">
$(function() {
	$("#faqInsertBtn").click(function() {
		var f_category = $("#f_category").val();
		$.ajax({
			url : "/manager/faq/insert",
			type : "post",
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "post"
			},
			dataType : "text",
			data : JSON.stringify({
				a_id : $("#f_writeForm").find("input[name='a_id']").val(),
				f_title : "["+f_category+"]" + $("#f_writeForm").find("input[name='f_title']").val(),
				f_content : $("#f_writeForm").find("textarea[name='f_content']").val(),
				f_category : f_category
			}),
			success : function(result) {
				$("#board_area").html(result);
			},
			error : function(result) {
				alert("진행중 오류가 발생했습니다.");
			}
		});
	});
	$("#boardListBtn").click(function(){
		$.ajax({
			url : "/manager/faq/list",
			type : "post",
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "post"
			},
			success : function(result) {
				$("#board_area").html(result);
			},
			error : function(result) {
				alert("진행중 오류가 발생했습니다.");
			}
		});
	});
	
});
</script>
<title>Insert title here</title>
</head>
<body>
<h4>Faq - 자주 묻는 질문 작성</h4><br>
<form id="f_writeForm" name="f_writeForm" >
<input type="hidden" value="<%=session.getAttribute("a_id")%>" name="a_id">
<div class="box box-primary">
<div class="box-header with-border">
<h3 class="box-title">자주 묻는 질문과 답변 작성</h3>
</div>
<div class="box-body">
<div class="form-group">
<select id="f_category" name="f_category" class="form-control">
<option value="상품">상품</option>
<option value="결제">결제</option>
<option value="배송">배송</option>
<option value="환불">환불</option>
<option value="교환">교환</option>
<option value="회원">회원</option>
<option value="오류">오류</option>
</select>
<input class="form-control" name="f_title" id="f_title" placeholder="제목">
</div>
<div class="form-group">
<% if(session.getAttribute("a_id") == null) { %>
	<script type="text/javascript">
	location.href="/manager/main";
	</script>
<%} else { %>
<input class="form-control" readonly="readonly" value="<%=session.getAttribute("a_id") %>" placeholder="작성자">
<%} %>
</div>
<div class="form-group">
<textarea name="f_content" id="f_content" class="form-control" style="height: 300px">
</textarea>
</div>
</div>
<!-- /.box-body -->
<div class="">
<div class="pull-right">
<button type="button" class="btn btn-primary" id="faqInsertBtn"><i class="ion-ios-book-outline"></i>&nbsp;작성</button>
<input type="button" value="목록" class="btn btn-default" id="boardListBtn">
</div>
<button type="reset" class="btn btn-default"><i class="fa fa-times"></i> Discard</button>
</div>
<!-- /. box -->
</div>
</form>
</body>
</html>