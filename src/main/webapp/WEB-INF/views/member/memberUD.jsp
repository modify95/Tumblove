<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<!-- Bootstrap core CSS -->
<link href="/resources/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Bootstrap theme -->
<link href="/resources/bootstrap/dist/css/bootstrap-theme.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/bootstrap/css/theme.css" rel="stylesheet">
<link href="/resources/bootstrap/css/sticky-footer-navbar.css"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="/resources/js/common.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	$(function() {
		$("input").not($("input[type='radio']")).not(
				$("input[type='checkbox']")).not($("input[type='button']"))
				.addClass("form-control");
		$("select").addClass("form-control");
	});
</script>
<style type="text/css">
table {
	border-collapse: collapse;
	border: 1px solid silver;
	width: 800px;
	margin: 10px auto;
}

table tr th {
	text-align: center;
	width: 200px;
	padding: 10px;
}

table tr td {
	padding: 12px;
}

input[class="form-control"], select[class="form-control"] {
	display: inline;
	width: 240px;
	height: 30px;
}

button, input[type='button'] {
	height: 30px;
	padding-top: 4px;
}

.buttons {
	width: 100%;
	padding-left: 40px;
}
</style>
</head>
<body>
	<div class="container theme-showcase" role="main">
		<!-- Main jumbotron for a primary marketing message or call to action -->
		<legend style="font-weight: bold;">회원정보 수정란</legend>
		<div>
			<form id="memberForm">
				<input type="hidden" id="m_agreement" name="m_agreement" /> <input
					type="hidden" id="m_gender" name="m_gender" />
				<table border=1>
					<tr>
						<th>아이디</th>
						<td><input id="m_id" name="m_id"
							placeholder="소문자영어+숫자 6~15자리" maxlength="15" min="6"
							readonly="readonly"
							style="color: #848484; background-color: rgba(0, 0, 0, 0.2); font-weight: bold;"
							value="<%=session.getAttribute("m_id")%>" disabled="disabled">&nbsp;<label
							for="m_id" style="font-weight: bold; color: orange;">수정
								불가</label></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td colspan="2"><input name="m_password" id="m_password"
							type="password" required="required">&nbsp;<label
							for="m_name" style="font-weight: bold; color: gray;">수정
								가능</label></td>
					</tr>
					<tr>
						<th>재입력</th>
						<td colspan="2"><input id="m_pwCheck" type="password"
							required="required">&nbsp;<label for="m_name"
							style="font-weight: bold; color: gray;">수정 가능</label>
							<div id="password"></div></td>
					</tr>
					<tr>
						<th>이름</th>
						<td colspan="2"><input type="text" id="m_name" name="m_name"
							min="4" maxlength="10" readonly="readonly"
							style="color: #848484; background-color: rgba(0, 0, 0, 0.2); font-weight: bold;"
							value="<%=session.getAttribute("m_name")%>" disabled="disabled">&nbsp;<label
							for="m_name" style="font-weight: bold; color: orange;">수정
								불가</label></td>
					</tr>
					<tr>
						<th>핸드폰번호</th>
						<td colspan="2"><input id="m_phone" name="m_phone" type="tel"
							maxlength="11">&nbsp;<label for="m_name"
							style="font-weight: bold; color: gray;">수정 가능</label></td>
					</tr>
					<tr>
						<th>이메일주소</th>
						<td><input id="m_mail" name="m_mail" type="email" min="11"
							maxlength="25" placeholder="ex)abc123@gmail.com"
							readonly="readonly"
							style="color: #848484; background-color: rgba(0, 0, 0, 0.2); font-weight: bold;"
							value="<%=session.getAttribute("m_mail")%>" disabled="disabled">&nbsp;<label
							for="m_mail" style="font-weight: bold; color: orange;">수정
								불가</label></td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td colspan="2"><input type="text" id="sample6_postcode"
							placeholder="우편번호" readonly="readonly"> <input
							type="button" onclick="sample6_execDaumPostcode()"
							class="btn btn-default" value="우편번호 찾기"><br> <input
							type="text" id="sample6_address" placeholder="주소"
							readonly="readonly"> <br>
						<input type="text" id="sample6_address2" placeholder="상세주소"><input
							type="hidden" name="m_address" id="m_address"></td>
					</tr>
				</table>
				<fieldset>
					<legend style="font-weight: bold;">추가정보 입력(선택)</legend>
					<ul>
						<li>본인확인 질문 : <select id="m_question" name="m_question">
								<option value="">질문선택</option>
								<option value="출신초등학교">출신 초등학교는?</option>
						</select>
						</li>
						<li>본인확인 답변 : <input type="text" id="m_answer"
							name="m_answer">
						</li>
						<li>생년월일 : <input type="number" maxlength="11"
							placeholder="예)19941108" name="m_birth" id="m_birth">&nbsp;&nbsp;
							성별 : 남성<input type="radio" name="chk_gender" id="male"
							value="man">&nbsp; 여성<input type="radio"
							name="chk_gender" id="female" value="woman"></li>
						<li>마케팅 수신동의 <input type="checkbox" name="chk_agreement"
							id="chk_agreement" value="marketing"></li>
					</ul>
				</fieldset>
				<br />
			</form>
			<div class="buttons">
				<button id="memUpdate" class="btn btn-primary">회원정보 수정완료</button>
				<button id="updateCancel" onclick="location.href='/'"
					class="btn btn-default">돌아가기</button>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		// 정규표현식
		$("#chk_agreement").click(function() {
			if ($("#chk_agreement").is(":checked")) {
				$("#m_agreement").val(1);
			} else {
				$("#m_agreement").val(0);
			}
		});
		var reg_uid = /^[a-z0-9]{6,16}$/; // 5~16자 영문소문자, 숫자 사용가능
		var reg_upw = /^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{6,24}$/;
		// 이름 정규식
		var reg_name = /^[가-힣]{2,5}$/; // 2~5글자 한글

		// 6~16자 영문소문자, 숫자, 특수문자 혼합하여 사용

		// 사용자에게 요구사항에 대한 문자열로 배열 초기화.
		var message = [ "영문,숫자만 가능. 6 ~ 12자로 입력해 주세요",
				"영문,숫자,특수문자만 가능. 8 ~ 15자 입력해 주세요.",
				"비밀번호와 비밀번호 확인란은 값이 일치해야 합니다.",
				"- 포함 입력해 주세요. 예시) 010-0000-0000" ];

		$('.error').each(function(index) {
			$('.error').eq(index).html(message[index]);
		});

		$('#m_id, #m_password, #m_pwCheck, #m_phone').bind(
				"focus",
				function() {
					var idx = $("#m_id, #m_password, #m_pwCheck, #m_phone")
							.index(this);
					// console.log("대상 : "+ idx );
					$(this).parents(".form-group").find(".error").html(
							message[idx]);
				});

		$("#male").click(function() {
			$("#m_gender").val($("input[name=chk_gender]:checked").val());
		});

		$("#female").click(function() {
			$("#m_gender").val($("input[name=chk_gender]:checked").val());
		});
		document.getElementById("udqt").style.display = "none";
		$("#memUpdate").click(
				function() {
					var postcode = $("#sample6_postcode").val()
							+ $("#sample6_address").val()
							+ $("#sample6_address2").val();
					$("#m_address").val(postcode);
					if ($("#chk_agreement").is(":checked")) {
						$("#m_agreement").val(1);
					} else {
						$("#m_agreement").val(0);
					}
					$("#m_payment").val(0);
					var data = {
						"m_id" : $("#m_id").val(),
						"m_password" : $("#m_password").val(),
						"m_phone" : $("#m_phone").val(),
						"m_address" : $("#m_address").val(),
						"m_question" : $("#m_question").val(),
						"m_answer" : $("#m_answer").val(),
						"m_birth" : $("#m_birth").val(),
						"m_gender" : $("#m_gender").val(),
						"m_agreement" : $("#m_agreement").val()
					};
					$.ajax({
						url : "/member/memberUpdate",
						type : "post",
						data : data,
						error : function() {
							alert("오류 관리자에게 문의바람.");
						},
						success : function(resultData) {
							if (resultData == "1") {
								alert("수정 완료!");
								location.href = "logout2";
							} else {
								alert("수정 불가!");
								location.href = "/";
							}
						}
					});
				});
		$("#m_pwCheck").change(
				function() {
					if (reg_upw.test($("#m_password").val())) {
						if ($("#m_pwCheck").val() == $("#m_password").val()) {
							$("#m_pwCheck").empty().append("<p>비밀번호 일치").css(
									"color", "blue");
							$("#password").empty();
							$("#joinInsert").attr("disabled", false);
						} else {
							$("#password").empty().append("<p>비밀번호 불일치").css(
									"color", "red");
							$("#m_pwCheck").val("").focus();
							$("#joinInsert").attr("disabled", true);

						}
					} else {
						alert("비밀번호가 형식에 맞지 않습니다 다시 입력 해 주세요");
						$("#m_pwCheck").val("");
						$("#m_password").val("").focus();
					}
				});
		$("#m_name").change(function() {
			if (!reg_name.test($("#m_name").val())) {
				alert("이름이 형식에 맞지 않습니다.");
				10
				$("#m_name").val("").focus();
			}
		});
	});
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;

						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode; // 5자리
						// 새우편번호
						// 사용
						document.getElementById('sample6_address').value = fullAddr;

						// 커서를 상세주소 필드로 이동한다.
						document.getElementById('sample6_address2').focus();
					}
				}).open();
	}
</script>
</html>