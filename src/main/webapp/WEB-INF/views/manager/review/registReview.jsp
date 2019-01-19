<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/admin/ionicons.min.css">
<link rel="stylesheet" href="/resources/admin/AdminLTE.min.css">
<script type="text/javascript">
$(function() {
	$("#reviewInsertBtn").click(function() {
		$.ajax({
			url : "/manager/review/noticeInsert",
			type : "post",
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "post"
			},
			dataType : "text",
			data : JSON.stringify({
				a_id : $("#r_writeForm").find("input[name='a_id']").val(),
				r_title : "[공지]" + $("#r_writeForm").find("input[name='r_title']").val(),
				r_content : $("#r_writeForm").find("textarea[name='r_content']").val()
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
			url : "/manager/review/list",
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
</head>
<body>
<h4>Reivew - 공지사항 작성</h4><br>
<form id="r_writeForm" name="r_writeForm" >
<input type="hidden" value="<%=session.getAttribute("a_id")%>" name="a_id">
<div class="box box-primary">
<div class="box-header with-border">
<h3 class="box-title">공지사항 글 작성</h3>
</div>
<div class="box-body">
<div class="form-group">
<input class="form-control" name="r_title" id="r_title" placeholder="제목">
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
<textarea name="r_content" id="r_content" class="form-control" style="height: 300px">
</textarea>
</div>
</div>
<!-- /.box-body -->
<div class="">
<div class="pull-right">
<button type="button" class="btn btn-primary" id="reviewInsertBtn"><i class="ion-ios-book-outline"></i>&nbsp;작성</button>
<input type="button" value="목록" class="btn btn-default" id="boardListBtn">
</div>
<button type="reset" class="btn btn-default"><i class="fa fa-times"></i> Discard</button>
</div>
<!-- /. box -->
</div>
</form>
</body>
</html>