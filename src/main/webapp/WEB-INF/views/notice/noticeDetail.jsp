<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세 보기</title>
<link rel="stylesheet" href="/resources/css/client_main.css">
<link rel="stylesheet" href="/resources/css/manager_main.css">
<link rel="stylesheet" href="/resources/css/manager_board.css">
<link rel="stylesheet" href="/resources/admin/ionicons.min.css">
<link rel="stylesheet" href="/resources/admin/AdminLTE.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min"></script>
<script type="text/javascript">
	$(function() {
		$("#noticeListBtn").click(function() {
			location.href = "/notice/noticeList.do";
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
							<h5>관리자<span class="mailbox-read-time pull-right">${detail.n_date}</span></h5>
						</div>
						<!-- /.mailbox-controls -->
						<div class="mailbox-read-message">${detail.n_content}</div>
						<!-- /.mailbox-read-message -->
					</div>
					<!-- /.box-body -->
					<div class="box-footer">
						<div class="pull-left">
							<input type="button" value="목록" class="btn btn-default" id="noticeListBtn">
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