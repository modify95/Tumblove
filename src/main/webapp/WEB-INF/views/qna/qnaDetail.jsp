<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/client_main.css">
<link rel="stylesheet" href="/resources/css/manager_main.css">
<link rel="stylesheet" href="/resources/css/manager_board.css">
<link rel="stylesheet" href="/resources/admin/ionicons.min.css">
<link rel="stylesheet" href="/resources/admin/AdminLTE.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#qnaDeleteBtn").click(function() {
			if (confirm("글을 삭제하시겠습니까?")) {
				$.ajax({
					url : "/qna/qnaDelete",
					type : "post",
					
					data : $("#q_num").serialize(),
					dataType : "text",
					error : function() {
						alert('시스템 오류 입니다. 관리자에게 문의 하세요');
					},
					success : function() {
						alert('삭제가 완료되었습니다');
						location.href = "/qna/qnaList"
					}

				});

			}
		});
		$("#qnaListBtn").click(function() {
			location.href = "/qna/qnaList";
		})
	});
</script>
<style>
#board_area {
	width: 900px;
	min-height: 300px;
}
</style>
</head>
<body>
	<div id="board_wrapper">
		<div id="board_area">
		<form id="detailForm" name="detailForm">
         <input type="hidden" name="q_num" id="q_num" value="${detail.q_num}">
      </form>
			<form id="qwriteForm" name="q_writeForm">

				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">QnA</h3>
						<div class="box-tools pull-right">
							<a href="#" class="btn btn-box-tool" data-toggle="tooltip"
								title="Previous"><i class="fa fa-chevron-left"></i></a> <a
								href="#" class="btn btn-box-tool" data-toggle="tooltip"
								title="Next"><i class="fa fa-chevron-right"></i></a>
						</div>
					</div>
					<!-- /.box-header -->
					<div class="box-body no-padding">
						<div class="mailbox-read-info">
							<p>
							<h3><b>${detail.q_title}</b></h3>
							<p>
							<h5>
								작성자:${detail.m_id}<span class="mailbox-read-time pull-right">${detail.q_date}</span>
							</h5>
						</div>
						<!-- /.mailbox-controls -->
						<div class="mailbox-read-message">${detail.q_content}</div>
						<!-- /.mailbox-read-message -->
					</div>
					<!-- /.box-body -->
					<div class="box-footer">
						<div class="pull-left">
							<input type="button" value="목록" class="btn btn-default"
								id="qnaListBtn">
							<c:choose>
								<c:when test="${m_id == detail.m_id}">
									<input type="button" value="삭제" id="qnaDeleteBtn"  class="btn btn-default">
								</c:when>
								<c:otherwise>

								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<!-- /.box-footer -->
				</div>
				<!-- /. box -->
			</form>
		</div>
	</div>
</body>
</html>