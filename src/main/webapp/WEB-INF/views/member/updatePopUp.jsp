<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 - 비밀번호 확인</title>
<link rel="stylesheet" href="/resources/bootstrap/dist/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<style type="text/css">
	body {
		font-family: "굴림";
		padding: 14px 30px;
	}
	#pwVerify {
		display: inline;
		height: 25px;
		float: right;
		width: 210px;
		vertical-align: middle;
	}
	.buttons {
		margin-top: 16px;
		width: 100%;
		text-align: center;
	}
	input[type='button'] {
		width: 70px;
	}
	legend {
		margin-bottom: 14px;
		padding-bottom: 5px;
	}
</style>
</head>
<body>
	<div>
		<form>
			<legend style="font-size: 17.6px; font-weight: bold;">회원정보 수정</legend>
			<fieldset>
				<label for="pwVerify">비밀번호 입력 : </label><input type="password"
					id="pwVerify" required="required" class="form-control"><br />
					<div class="buttons">
					<input type="button" value="확인" id="pwChk" class="btn btn-primary">&nbsp;
					<input type="button" value="취소" class="btn btn-default" onclick="window.close()">
					</div>
			</fieldset>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		$("#pwChk").click(function() {
			var data = {
				"m_password" : $("#pwVerify").val()
			};
			if ($("#pwVerify").val() == "") {
				alert("비밀번호를 입력해주세요");
				$("#pwVerify").val("").focus();
			} else {
				$.ajax({
					url : "/member/updatePopUp",
					data : data,
					type : "post",
					error : function() {
						alert("시스템 에러");
					},
					success : function(resultData) {
						if (resultData == "1") {
							alert("비밀번호 일치");
							window.opener.location.href = "/member/memberUD";
							window.close();
						}
					}
				});
			}
		});
	});
</script>
</html>