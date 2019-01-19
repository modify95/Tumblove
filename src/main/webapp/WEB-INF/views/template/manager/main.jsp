<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/manager_main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function(){
		$("#managerLoginCloseBtn").click(function(){
			$("#manager_login_modal").hide();
		});
		var manager_login_form = $("#manager_login_form");
		$("#managerLoginBtn").click(function(){
			var manager_id = $("#manager_id").val();
			var manager_password = $("#manager_password").val();
			if (manager_id=="" || manager_id==null) {
				alert("아이디를 입력하십시오.");
			} else if (manager_password=="" || manager_password==null) {
				alert("비밀번호를 입력하십시오.");
			} else {
				$.ajax({
					url: "/manager/admin/login",
					type: "post",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "post"
					},
					dataType : "text",
					data : JSON.stringify({
						a_id : manager_id,
						a_password :manager_password
					}),
					success: function(result) {
						if(result == "SUCCESS") {
							alert("로그인에 성공했습니다.");
							 $("#manager_id").val("");
							 $("#manager_password").val("");
							 location.reload();
						} else {
							alert("아이디와 비밀번호를 확인하십시오.");
							 $("#manager_id").val("");
							 $("#manager_password").val("");
						}
					},
					error: function(result){
						alert("로그인 진행중 오류가 발생했습니다.");
						 $("#manager_id").val("");
						 $("#manager_password").val("");
					}
				});
			}
		});
		$("#LogoutBtn").click(function(){
			location.href="/manager/admin/logout";
		});
	});
</script>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/client_main.css">
<title><tiles:getAsString name="title" /></title>
</head>
<body role="document">
	<header>
		<tiles:insertAttribute name="header" />
	</header>
	<section>
	<%if (session.getAttribute("a_name") == null) { %>
		<div id="manager_login">
			<p>관리자 로그인이 필요한 영역입니다.</p>
			<button type="button" id="manager_login_button" data-toggle="modal" data-target="#manager_login_modal"
			data-whatever="@mdo">Manager Login</button>
			
			<div class="modal fade" id="manager_login_modal" tabindex="-1" role="dialog" aria-labelledby="manager_login_label"
			aria-hidden="true">
				<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
				</button>
				<h5 class="modal-title" id="manager_login_label">『 Manager Login 』</h5>
				</div>
				<div class="modal-body">
					<form id="manager_login_form" name="manager_login_form">
						<div class="form-group">
							<label for="manager_id" class="control-label">Manager ID</label>
							<input type="text" class="form-control" id="manager_id" name="manager_id" maxlength="30">
						</div>
						<div class="form-group">
							<label for="manager_password" class="control-label">Password</label>
							<input type="password" class="form-control" id="manager_password" name="manager_password" maxlength="32">
						</div>
						<div class="modal-footer" id="modal-footer">
							<button type="button" class="btn btn-primary" id="managerLoginBtn">Login</button>
							<button type="button" class="btn btn-default" data-dismis="modal" id="managerLoginCloseBtn">Close</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<% } else {%>
			<div id="manager_logined">
			<p><%= session.getAttribute("a_name") %>님 환영합니다.</p>
			<button type="button" id="LogoutBtn">Manager Logout</button>
			</div>
		<%} %>
	</section>
	<footer>
		<tiles:insertAttribute name="footer" />
	</footer>
</body>
</html>
