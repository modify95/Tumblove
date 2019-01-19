<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("spaceB", "\n"); %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<link rel="stylesheet" href="/resources/admin/ionicons.min.css">
<link rel="stylesheet" href="/resources/admin/AdminLTE.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min"></script>
<script type="text/javascript">
	$(function() {
		$("#noticeDeleteBtn").click(function() {
			if(confirm("글을 삭제하시겠습니까?")) {
				$.ajax({
					url : "/manager/notice/noticeDelete",
					type : "post",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "post"
					},
					dataType : "text",
					data : JSON.stringify({
						n_num : $("#n_writeForm").find("input[name='n_num']").val()
					}),
					success : function(result) {
						$("#board_area").html(result);
					},
					error : function(result) {
						alert("진행중 오류가 발생했습니다.");
					}
				});
			}	
		});
		$("#boardListBtn").click(function() {
			$.ajax({
				url : "/manager/notice/listWithPaging",
				type : "post",
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "post"
				},
				dataType : "text",
				data : JSON.stringify({
					search_option : $("input[name='search_option']").val(),
					search_keyword : $("input[name='search_keyword']").val(),
					pageNum : $("#pageNum").val(),
					amount : $("#amount").val()
				}),
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
<div id="board_content">
			<form id="n_writeForm" name="n_writeForm">
				<input type="hidden" value="${detail.n_num }" name="n_num">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">공지사항</h3>
						<div class="box-tools pull-right">
							<a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Previous"><i class="fa fa-chevron-left"></i></a> 
							<a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Next"><i class="fa fa-chevron-right"></i></a>
						</div>
					</div>
					<!-- /.box-header -->
					<div class="box-body no-padding">
						<div class="mailbox-read-info">
							<p><h3><b>${detail.n_title}</b></h3><p>
							<h5>작성자: ${detail.a_id} <span class="mailbox-read-time pull-right">${detail.n_date }</span></h5>
						</div>
						<!-- /.mailbox-controls -->
						<div class="mailbox-read-message">${fn:replace(detail.n_content, spaceB,"<br/>")}</div>
						<!-- /.mailbox-read-message -->
					</div>
					<!-- /.box-body -->
					<div class="box-footer">
						<div class="pull-left">
							<button type="button" class="btn btn-primary"
								id="noticeDeleteBtn">
								<i class="ion-ios-trash-outline"></i> 삭제
							</button>
							<button type="button" class="btn btn-default" id="boardListBtn">목록</button>
							<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cri.pageNum}">	
							<input type="hidden" name="amount" id="amount" value="${pageMaker.cri.amount}">	
							<input type="hidden" name="search_option" value="${pageMaker.cri.search_option}">
							<input type="hidden" name="search_keyword" value="${pageMaker.cri.search_keyword}">
						</div>
					</div>
					<!-- /.box-footer -->
				</div>
				<!-- /. box -->
			</form>
</div>			
</body>
</html>
