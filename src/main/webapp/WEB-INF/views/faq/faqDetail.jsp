<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		$("#faqListBtn").click(function() {
			location.href = "/faq/faqList.do";
		});
	});
</script>
<style type="text/css">
#board_area {
	width: 900px;
	min-height: 300px;
}
</style>
</head>
<body>
			<div id="board_wrapper">
		<div id="board_area">
			<form id="n_writeForm" name="n_writeForm">
				
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">자주묻는질문</h3>
						<div class="box-tools pull-right">
							<a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Previous"><i class="fa fa-chevron-left"></i></a> 
							<a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Next"><i class="fa fa-chevron-right"></i></a>
						</div>
					</div>
					<!-- /.box-header -->
					<div class="box-body no-padding">
						<div class="mailbox-read-info">
							<p><h3><b>${detail.f_title}</b></h3><p>
							<h5>관리자<span class="mailbox-read-time pull-right">${detail.f_date}</span></h5>
						</div>
						<!-- /.mailbox-controls -->
						<div class="mailbox-read-message">${detail.f_content}</div>
						<!-- /.mailbox-read-message -->
					</div>
					<!-- /.box-body -->
					<div class="box-footer">
						<div class="pull-left">
							<input type="button" value="목록" class="btn btn-default" id="faqListBtn">
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