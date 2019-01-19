<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("spaceB", "\n"); %>
<% Date today = new Date(); SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A상세보기</title>
<link rel="stylesheet" href="/resources/admin/ionicons.min.css">
<link rel="stylesheet" href="/resources/admin/AdminLTE.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min"></script>
<script type="text/javascript">
	$(function() {
		$("#qnaNoticeDeleteBtn").click(function() {
			if(confirm("글을 삭제하시겠습니까?")) {
				$.ajax({
					url : "/manager/qna/noticeDelete",
					type : "post",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "post"
					},
					dataType : "text",
					data : JSON.stringify({
						q_num : $("#qnaNoticeForm").find("input[name='q_num']").val()
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
		
		$("#qnaListBtn").click(function() {
			$.ajax({
				url : "/manager/qna/list",
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
		
		$("#qnaListWithPagingBtn").click(function() {
			$.ajax({
				url : "/manager/qna/listWithPaging",
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
		
		$("#reply_area button").on("click", function(){
			if ($("#reply_area textarea").val() != null && $("#reply_area textarea").val() != "") {
				$.ajax({
					url : "/manager/qna/reply",
					type : "post",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "post"
					},
					dataType : "text",
					data : JSON.stringify({
						q_num : $("#qnaDetailForm").find("input[name='q_num']").val(),
						a_id : $("#qnaDetailForm").find("input[name='a_id']").val(),
						qr_content : $("#reply_area textarea").val(),
						pageNum : $("#qnaDetailForm").find("input[name='pageNum']").val(),
						amount : $("#qnaDetailForm").find("input[name='amount']").val()
					}),
					success : function(result) {
						$("#board_area").html(result);
					},
					error : function(result) {
						alert("진행중 오류가 발생했습니다.");
					}
				});	
			} else {
				alert("댓글을 입력하십시오.");
			}
		});
		
		$("#reply_area2 textarea").on("focus", function(){
			var a_id = $("#qnaDetailForm").find("input[name='a_id']").val();
			var reply_a_id = $("#qnaDetailForm").find("input[name='reply_a_id']").val();
			var reply_qr_num = $(this).parents("div").attr("data-num");
			if (a_id == reply_a_id) {
				$(this).attr("readonly", false);
				$(this).parent("div").find("div button").attr("disabled", false);
				$("#reply_area2 div button").not($(this).parent("div").find("div button")).attr("disabled", true);
				$("#reply_area2 textarea").not(this).attr("readonly", true);
			}
		});	
		
		$("#reply_area2 div button").on("click", function() {
			if($(this).attr("class") == "btn btn-primary") {
				$.ajax({
					url : "/manager/qna/replyEdit",
					type : "post",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "post"
					},
					dataType : "text",
					data : JSON.stringify({
						q_num : $("#qnaDetailForm").find("input[name='q_num']").val(),
						qr_num : $(this).parent("div").attr("data-num"),
						qr_content : $(this).parent("div").parent("div").find("textarea").val(),
						pageNum : $("#qnaDetailForm").find("input[name='pageNum']").val(),
						amount : $("#qnaDetailForm").find("input[name='amount']").val()
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
					url : "/manager/qna/replyDelete",
					type : "post",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "post"
					},
					dataType : "text",
					data : JSON.stringify({
						q_num : $("#qnaDetailForm").find("input[name='q_num']").val(),
						qr_num : $(this).parent("div").attr("data-num"),
						pageNum : $("#qnaDetailForm").find("input[name='pageNum']").val(),
						amount : $("#qnaDetailForm").find("input[name='amount']").val()
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
			<c:when test="${!empty noticeDetail && empty qnaDetail}">
			<form id="qnaNoticeForm" name="qnaNoticeForm">
				<input type="hidden" value="${noticeDetail.q_num }" name="q_num">
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
							<p><h3><b>${noticeDetail.q_title}</b></h3><p>
							<h5>작성자: ${noticeDetail.a_id } <span class="mailbox-read-time pull-right">${noticeDetail.q_date }</span></h5>
						</div>
						<!-- /.mailbox-controls -->
						<div class="mailbox-read-message">${fn:replace(noticeDetail.q_content, spaceB, "<br/")}</div>
						<!-- /.mailbox-read-message -->
					</div>
					<!-- /.box-body -->
					<div class="box-footer">
						<div class="pull-left">
							<button type="button" class="btn btn-primary"
								id="qnaNoticeDeleteBtn">
								<i class="ion-ios-trash-outline"></i> 삭제
							</button>
							<button type="button" class="btn btn-default" id="qnaListBtn">목록</button>
						</div>
					</div>
					<!-- /.box-footer -->
				</div>
				<!-- /. box -->
			</form>
			</c:when>
			<c:when test="${!empty qnaDetail}">
			<form id="qnaDetailForm" name="qnaDetailForm">
				<input type="hidden" value="${qnaDetail.q_num}" name="q_num">
				<input type="hidden" value="<%=session.getAttribute("a_id")%>" name="a_id">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">Q&A</h3>
						<div class="box-tools pull-right">
							<a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Previous"><i class="fa fa-chevron-left"></i></a> 
							<a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Next"><i class="fa fa-chevron-right"></i></a>
						</div>
					</div>
					<!-- /.box-header -->
					<div class="box-body no-padding">
						<div class="mailbox-read-info">
							<p><h3><b>${qnaDetail.q_title}</b></h3><p>
							<h5>작성자: ${qnaDetail.m_id} <span class="mailbox-read-time pull-right">${qnaDetail.q_date}</span></h5>
						</div>
						<!-- /.mailbox-controls -->
						<div class="mailbox-read-message">${qnaDetail.q_content}</div>
						<!-- /.mailbox-read-message -->
					</div>
					<% if(session.getAttribute("a_id") == null) {%>
					<script type="text/javascript">
						location.href="/manager/main";
					</script>
					<%} else {%>
					<div id="reply_area">
						<p>작성자: <%=session.getAttribute("a_id")%>
						<span class="mailbox-read-time pull-right"><%= sdf.format(today) %></span></p>
						<textarea rows="3" cols="70" class="form-control"></textarea>
						<button type="button" class="btn btn-default">Reply</button>
					</div>
					<%} %>
					<c:if test="${!empty qnaReplyList}">
					<c:forEach items="${qnaReplyList}" var="reply">
					<div id="reply_area2" data-num="${reply.qr_num}">
					<input type="hidden" name="reply_a_id" value="${reply.a_id}">
					<input type="hidden" name="qr_num" value="${reply.qr_num}">
						<p>작성자: ${reply.a_id}
						<span class="mailbox-read-time pull-right">${reply.qr_date}</span></p>
						<textarea rows="3" cols="70" class="form-control" readonly="readonly">${fn:replace(reply.qr_content, spaceB, "<br/>")}</textarea>
						<div data-num="${reply.qr_num}">
						<button type="button" class="btn btn-primary" disabled="disabled">Edit</button>
						<button type="button" class="btn btn-default" disabled="disabled">Delete</button>
						</div>
					</div>
					</c:forEach>
					</c:if>
					<!-- /.box-body -->
					<div class="box-footer">
						<div class="pull-left">
							<button type="button" class="btn btn-default" id="qnaListWithPagingBtn">목록</button>
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
