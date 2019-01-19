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
		$("#reviewNoticeDeleteBtn").click(function() {
			if(confirm("글을 삭제하시겠습니까?")) {
				$.ajax({
					url : "/manager/review/noticeDelete",
					type : "post",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "post"
					},
					dataType : "text",
					data : JSON.stringify({
						r_num : $("#reviewNoticeForm").find("input[name='r_num']").val()
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
		
		$("#reviewListBtn").click(function() {
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
		
		$("#reviewListWithPagingBtn").click(function() {
			$.ajax({
				url : "/manager/review/listWithPaging",
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
		
		$("#review_reply_area button").on("click", function(){
			if ($("#review_reply_area textarea").val() != null && $("#review_reply_area textarea").val() != "") {
				$.ajax({
					url : "/manager/review/reply",
					type : "post",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "post"
					},
					dataType : "text",
					data : JSON.stringify({
						r_num : $("#reviewDetailForm").find("input[name='r_num']").val(),
						a_id : $("#reviewDetailForm").find("input[name='a_id']").val(),
						rr_content : $("#review_reply_area textarea").val(),
						pageNum : $("#reviewDetailForm").find("input[name='pageNum']").val(),
						amount : $("#reviewDetailForm").find("input[name='amount']").val()
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
		
		$("#review_reply_area2 textarea").on("focus", function(){
			var a_id = $("#reviewDetailForm").find("input[name='a_id']").val();
			var reply_a_id = $("#reviewDetailForm").find("input[name='reply_a_id']").val();
			var reply_rr_num = $(this).parents("div").attr("data-num");
			if (a_id == reply_a_id) {
				$(this).attr("readonly", false);
				$(this).parent("div").find("div button").attr("disabled", false);
				$("#review_reply_area2 div button").not($(this).parent("div").find("div button")).attr("disabled", true);
				$("#review_reply_area2 textarea").not(this).attr("readonly", true);
			}
		});	
		
		$("#review_reply_area2 div button").on("click", function() {
			if($(this).attr("class") == "btn btn-primary") {
				$.ajax({
					url : "/manager/review/replyEdit",
					type : "post",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "post"
					},
					dataType : "text",
					data : JSON.stringify({
						r_num : $("#reviewDetailForm").find("input[name='r_num']").val(),
						rr_num : $(this).parent("div").attr("data-num"),
						rr_content : $(this).parent("div").parent("div").find("textarea").val(),
						pageNum : $("#reviewDetailForm").find("input[name='pageNum']").val(),
						amount : $("#reviewDetailForm").find("input[name='amount']").val()
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
					url : "/manager/review/replyDelete",
					type : "post",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "post"
					},
					dataType : "text",
					data : JSON.stringify({
						r_num : $("#reviewDetailForm").find("input[name='r_num']").val(),
						rr_num : $(this).parent("div").attr("data-num"),
						pageNum : $("#reviewDetailForm").find("input[name='pageNum']").val(),
						amount : $("#reviewDetailForm").find("input[name='amount']").val()
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
			<c:when test="${!empty reviewNotice && empty review}">
			<form id="reviewNoticeForm" name="reviewNoticeForm">
				<input type="hidden" value="${reviewNotice.r_num}" name="r_num">
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
							<p><h3>${reviewNotice.r_title}</h3><p>
							<h5>작성자: ${reviewNotice.r_writer} <span class="mailbox-read-time pull-right">${reviewNotice.r_date}</span></h5>
						</div>
						<!-- /.mailbox-controls -->
						<div class="mailbox-read-message">${fn:replace(reviewNotice.r_content,spaceB,"<br/>")}</div>
						<!-- /.mailbox-read-message -->
					</div>
					<!-- /.box-body -->
					<div class="box-footer">
						<div class="pull-left">
							<button type="button" class="btn btn-primary"
								id="reviewNoticeDeleteBtn">
								<i class="ion-ios-trash-outline"></i> 삭제
							</button>
							<button type="button" class="btn btn-default" id="reviewListBtn">목록</button>
						</div>
					</div>
					<!-- /.box-footer -->
				</div>
				<!-- /. box -->
			</form>
			</c:when>
			<c:when test="${!empty review}">
			<form id="reviewDetailForm" name="reviewDetailForm">
				<input type="hidden" value="${review.r_num}" name="r_num">
				<input type="hidden" value="<%=session.getAttribute("a_id")%>" name="a_id">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">Review</h3>
						<div class="box-tools pull-right">
							<a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Previous"><i class="fa fa-chevron-left"></i></a> 
							<a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Next"><i class="fa fa-chevron-right"></i></a>
						</div>
					</div>
					<!-- /.box-header -->
					<div class="box-body no-padding">
						<div class="mailbox-read-info">
							<p><h3>${review.r_title}</h3><p>
							<h5>작성자: ${review.r_writer} <span class="mailbox-read-time pull-right">${review.r_date}</span></h5>
						</div>
						<!-- /.mailbox-controls -->
						<div class="mailbox-read-message">
						<div id="review_area">
						<ul>
						<li><span>Product :</span> ${review.p_name} </li>
						<li><span>Score :</span> ${review.r_score} </li>
						<li><span>Image ↓</span><br>
						<c:choose>
						<c:when test="${!empty review.r_image}">
						<img src="/upload/product/${review.r_image}" alt="상품사진"> <br>
						</c:when>
						<c:when test="${review.r_image eq null}"><br>사진 없음<br></c:when>
						</c:choose>
						</li>
						</ul>
						</div>
						${review.r_content}</div>
						<!-- /.mailbox-read-message -->
					</div>
					<% if(session.getAttribute("a_id") == null) {%>
					<script type="text/javascript">
						location.href="/manager/main";
					</script>
					<%} else {%>
					<div id="review_reply_area">
						<p>작성자: <%=session.getAttribute("a_id")%><span class="mailbox-read-time pull-right"><%=format.format(toDay)%></span></p>
						<textarea rows="3" cols="70" class="form-control"></textarea><button type="button" class="btn btn-default">Reply</button>
					</div>
					<%} %>
					<c:if test="${!empty reviewReplyList}">
					<c:forEach items="${reviewReplyList}" var="reply">
					<div id="review_reply_area2" data-num="${reply.rr_num}">
					<input type="hidden" name="reply_a_id" value="${reply.rr_writer}">
					<input type="hidden" name="rr_num" value="${reply.rr_num}">
						<p>작성자: ${reply.rr_writer}
						<span class="mailbox-read-time pull-right">${reply.rr_date}</span></p>
						<textarea rows="3" cols="70" class="form-control" readonly="readonly">${reply.rr_content}</textarea>
						<div data-num="${reply.rr_num}">
						<button type="button" class="btn btn-primary" disabled="disabled">Edit</button>
						<button type="button" class="btn btn-default" disabled="disabled">Delete</button>
						</div>
					</div>
					</c:forEach>
					</c:if>
					<!-- /.box-body -->
					<div class="box-footer">
						<div class="pull-left">
							<button type="button" class="btn btn-primary"
								id="noticeDeleteBtn">
								<i class="ion-ios-trash-outline"></i> 삭제
							</button>
							<button type="button" class="btn btn-default" id="reviewListWithPagingBtn">목록</button>
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
