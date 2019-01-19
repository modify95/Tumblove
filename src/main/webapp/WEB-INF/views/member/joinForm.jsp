<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="/resources/js/common.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/join.js"></script>
<link rel="stylesheet" href="/resources/css/joinForm.css">
<script type="text/javascript">
	document.getElementById("udqt").style.display = "none";
</script>
</head>
<body>
	<div class="container theme-showcase" role="main"
		id="joinFormContainer">
		<!-- Main jumbotron for a primary marketing message or call to action -->
		<fieldset>
			<legend style="font-weight: bold;">필수정보 기입란</legend>
			<div>
				<form id="memberForm">
					<input type="hidden" id="m_agreement" name="m_agreement" /> <input
						type="hidden" id="m_gender" name="m_gender" />
					<table border="1" class="table table-bordered" id="joinTable">
						<tr>
							<th>아이디</th>
							<td colspan="2"><input id="m_id" name="m_id"
								class="form-control" placeholder="소문자영어+숫자 6~15자리"
								maxlength="15" required="required" min="6"> <!-- <td><input type="button" value="중복확인" id="idCheck"
						onclick="idCheck"></td> -->
								<button type="button" id="idConfirmBtn" class="btn btn-primary"
									onclick="">아이디 중복체크</button></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td colspan="2"><input name="m_password" id="m_password"
								class="form-control" type="password" required="required"></td>
						</tr>
						<tr>
							<th>재입력</th>
							<td colspan="2"><input id="m_pwCheck" type="password"
								class="form-control" required="required">
								<div id="password"
									style="font-weight: bold; margin-top: 8px; margin-left: 120px;"></div></td>

						</tr>
						<tr>
							<th>이름</th>
							<td colspan="2"><input type="text" id="m_name" name="m_name"
								class="form-control" min="4" maxlength="10" required="required"></td>
						</tr>
						<tr>
							<th>핸드폰번호</th>
							<td colspan="2"><input id="m_phone" name="m_phone"
								type="tel" class="form-control" required="required"
								maxlength="11"></td>
						</tr>
						<tr>
							<th>이메일주소</th>
							<td><input id="m_mail" name="m_mail" type="email" min="11"
								maxlength="25" placeholder="ex)abc123@gmail.com"
								class="form-control" required="required"><input
								type="button" id="mailConfirmBtn" value="이메일 중복체크"
								class="btn btn-primary" /></td>
						</tr>
						<tr>
							<th>우편번호</th>
							<td colspan="2"><input type="text" id="sample6_postcode"
								class="form-control" placeholder="우편번호" required="required"
								readonly="readonly">
								<button id="postBtn" type="button"
									onclick="sample6_execDaumPostcode()" class="btn btn-default">우편번호
									찾기</button> <br> <input type="text" class="form-control"
								id="sample6_address" placeholder="주소" required="required"
								readonly="readonly"> <br> <input type="text"
								class="form-control" id="sample6_address2" placeholder="상세주소">
								<input type="hidden" name="m_address" id="m_address"></td>
						</tr>
					</table>
					<fieldset style="text-align: left;">
						<legend style="font-weight: bold;">추가정보 입력(선택)</legend>
						<ul id="add_info">
							<li>본인확인 질문 : <select id="m_question" name="m_question"
								class="form-control">
									<option value="">질문선택</option>
									<option value="출신초등학교">출신 초등학교는?</option>
							</select>
							</li>
							<li>본인확인 답변 : <input type="text" id="m_answer"
								class="form-control" name="m_answer">
							</li>
							<li>생년월일 : <input type="number" maxlength="11"
								class="form-control" placeholder="예)19941108" name="m_birth"
								id="m_birth"><br> 성별 : 남성&nbsp;<input type="radio"
								name="chk_gender" id="male" value="man">&nbsp; 여성&nbsp;<input
								type="radio" name="chk_gender" id="female" value="woman"></li>
							<li>마케팅 수신동의 <input type="checkbox" name="chk_agreement"
								id="chk_agreement" value="marketing"></li>
						</ul>
					</fieldset>
					<br /> <input type="hidden" name="captcha2" id="captcha2">
				</form>
				<br />
				<div class="aside">
					<fieldset style="text-align: left;">
						<legend style="font-weight: bold;">자동가입방지</legend>
						<form id="captchaForm" name="captchaForm">
							<div class="box captcha">
								<div class="loading"></div>
								<!-- // .loading -->
								<label for="captcha">자동 방지 코드</label>&nbsp; <input type="text"
									class="form-control" id="captcha" name="captcha"
									autocomplete="off" onchange="proces()" /> <img src="/captcha"
									alt="캡차 이미지" title="클릭시 새로고침" /> <b
									style="font-size: 16px; font-weight: bold; color: red;">←</b>&nbsp;<span
									style="font-weight: bold; color: blue;">클릭 시 새로고침</span><br />
								<input type="button" value="자동가입방지검사" id="captchaSub"
									name="verify" class="btn btn-default">
							</div>
						</form>
						<!-- // .box.captcha -->
					</fieldset>
				</div>
				<br /> <br />
				<div id="btnsDiv">
					<button id="joinInsert" disabled="disabled" class="btn btn-primary">회원가입</button>
					&nbsp;
					<button id="joinCancel" class="btn btn-default">돌아가기</button>
				</div>


			</div>
		</fieldset>
	</div>
</body>
<script type="text/javascript">
	document.captchaForm.verify.disabled = true;
	document.onkeyup = proces;
	document.onmouseup = proces;
	document.onmousedown = proces;
	function proces() {
		if (document.captchaForm.captcha.value == "") {
			document.captchaForm.verify.disabled = true;
		} else {
			document.captchaForm.verify.disabled = false;
		}
	}
	$(function() {
		$("#captchaSub").click(function(event) {
			$("#captcha2").val($("#captcha").val());
			console.log('click');
			popupOpen();
			if ($("#captcha2").val() == $("#captcha").val()) {
				$("#captchaSub").attr("disabled", true);
				$("#joinInsert").attr("disabled", false);
			}
		});
		var popup;
		function popupOpen() {
			var url = "captchaSubmit?captcha=" + $("#captcha").val(); //팝업창 페이지 URL
			var scWidth = screen.availWidth;
			var scHeight = screen.availHeight;
			var left = (parseInt(scWidth) - 650) / 2;
			var top = (parseInt(scHeight) - 900) / 2;
			var winWidth = 500;
			var winHeight = 80;
			var popupOption = "width=" + winWidth + ", height=" + winHeight
					+ ", top=" + top + ", left=" + left; //팝업창 옵션(option)
			popup = window.open(url, "", popupOption);
			//win.focus(); //열린 페이지에 포커스를 준다. 열림과 동시에 앞쪽으로.
		}
		/* 	$("#pVeri").click(function(){
				alert($("#problemPar").val());
				console.log($("#problemPar").val());
			}); */
	});
</script>
</html>