<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("spaceB", "\n"); %>
<% Date toDay = new Date();  SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss"); %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review상세보기</title>
<link rel="stylesheet" href="/resources/admin/ionicons.min.css">
<link rel="stylesheet" href="/resources/admin/AdminLTE.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min"></script>
<script type="text/javascript">
	$(function() {
		$("#faqDeleteBtn").click(function() {
			if(confirm("글을 삭제하시겠습니까?")) {
				$.ajax({
					url : "/manager/faq/delete",
					type : "post",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "post"
					},
					dataType : "text",
					data : JSON.stringify({
						f_num : $("#faqForm").find("input[name='f_num']").val(),
						pageNum : $("#faqForm").find("input[name='pageNum']").val(),
						amount : $("#faqForm").find("input[name='amount']").val()
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
		
		$("#faqListWithPagingBtn").click(function() {
			$.ajax({
				url : "/manager/faq/listWithPaging",
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
		
		$("#answer_area button").on("click", function(){
			if ($("#answer_area textarea").val() != null && $("#answer_area textarea").val() != "") {
				$.ajax({
					url : "/manager/faq/reply",
					type : "post",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "post"
					},
					dataType : "text",
					data : JSON.stringify({
						f_num : $("#faqForm").find("input[name='f_num']").val(),
						a_id : $("#faqForm").find("input[name='a_id']").val(),
						fr_content : $("#answer_area textarea").val(),
						pageNum : $("#faqForm").find("input[name='pageNum']").val(),
						amount : $("#faqForm").find("input[name='amount']").val()
					}),
					success : function(result) {
						$("#board_area").html(result);
					},
					error : function(request, status, error) {
						alert("status : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
					}
				});
			} else {
				alert("댓글 내용을 입력하십시오.");
			}	
		});
		
		$("#answer_area2 textarea").on("focus", function(){
			var reply_rr_num = $(this).parents("div").attr("data-num");
				$(this).attr("readonly", false);
				$(this).parent("div").find("div button").attr("disabled", false);
				$("#answer_area2 div button").not($(this).parent("div").find("div button")).attr("disabled", true);
				$("#answer_area2 textarea").not(this).attr("readonly", true);
		});	
		
		$("#answer_area2 div button").on("click", function() {
			if($(this).attr("class") == "btn btn-primary") {
				$.ajax({
					url : "/manager/faq/replyEdit",
					type : "post",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "post"
					},
					dataType : "text",
					data : JSON.stringify({
						f_num : $("#faqForm").find("input[name='f_num']").val(),
						fr_num : $(this).parent("div").attr("data-num"),
						fr_content : $(this).parent("div").parent("div").find("textarea").val(),
						pageNum : $("#faqForm").find("input[name='pageNum']").val(),
						amount : $("#faqForm").find("input[name='amount']").val()
					}),
					success : function(result) {
						$("#board_area").html(result);
					},
					error : function(result) {
						alert("진행중 오류가 발생했습니다.");
					}
				}); 
			} else {
				$.ajax({
					url : "/manager/faq/replyDelete",
					type : "post",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "post"
					},
					dataType : "text",
					data : JSON.stringify({
						f_num : $("#faqForm").find("input[name='f_num']").val(),
						fr_num : $(this).parent("div").attr("data-num"),
						pageNum : $("#faqForm").find("input[name='pageNum']").val(),
						amount : $("#faqForm").find("input[name='amount']").val()
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
		
	});
</script>
</head>
<body>
<div id="board_content">
		<c:choose>
			<c:when test="${!empty faqDetail}">
			<form id="faqForm" name="faqForm">
				<input type="hidden" value="${faqDetail.f_num}" name="f_num">
				<input type="hidden" value="<%=session.getAttribute("a_id")%>" name="a_id">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">자주 묻는 질문</h3>
						<div class="box-tools pull-right">
							<a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Previous"><i class="fa fa-chevron-left"></i></a> 
							<a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Next"><i class="fa fa-chevron-right"></i></a>
						</div>
					</div>
					<!-- /.box-header -->
					<div class="box-body no-padding">
						<div class="mailbox-read-info">
							<p><h3><b>${faqDetail.f_title}</b></h3><p>
							<h5>작성자: ${faqDetail.a_id} <span class="mailbox-read-time pull-right">${faqDetail.f_date}</span></h5>
						</div>
						<!-- /.mailbox-controls -->
						<div class="mailbox-read-message">
						${fn:replace(faqDetail.f_content, spaceB, "<br/>")}</div>
						<!-- /.mailbox-read-message -->
					</div>
					<% if(session.getAttribute("a_id") == null) {%>
					<script type="text/javascript">
						location.href="/manager/main";
					</script>
					<%} else {%>
					<div id="answer_area">
						<p>
						<span class="mailbox-read-time pull-right"><%= format.format(toDay) %></span></p>
						<textarea rows="3" cols="70" class="form-control"></textarea>
						<button type="button" class="btn btn-default">Reply</button>
					</div>
					<%} %>
					<c:if test="${!empty faqReplyList}">
					<c:forEach items="${faqReplyList}" var="reply">
					<div id="answer_area2" data-num="${reply.fr_num}">
					<input type="hidden" name="fr_num" value="${reply.fr_num}">
						<p>
						<span class="mailbox-read-time pull-right">${reply.fr_date}</span></p>
						<textarea rows="3" cols="70" class="form-control" readonly="readonly">${reply.fr_content}</textarea>
						<div data-num="${reply.fr_num}">
						<button type="button" class="btn btn-primary" disabled="disabled">Edit</button>
						<button type="button" class="btn btn-default" disabled="disabled">Delete</button>
						</div>
					</div>
					</c:forEach>
					</c:if>
					<!-- /.box-body -->
					<div class="box-footer">
						<div class="pull-left">
							<button type="button" class="btn btn-primary" id="faqDeleteBtn">삭제</button>
							<button type="button" class="btn btn-default" id="faqListWithPagingBtn">목록</button>
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
			</c:when>
			</c:choose>
</div>			
</body>
</html>
