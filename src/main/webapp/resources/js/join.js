// 비밀번호와 비밀번호 확인 일치 여부 확인
function passwordCheck() {
	if ($("#m_password").val() != $("#m_pwCheck").val()) {
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
		$("#m_pwCheck").focus();
		$("#m_pwCheck").val("");
		return false;
	} else {
		return true;
	}
}
// 아이디에 비밀번호 포함 여부 확인
function idPwdCheck() {
	var userId = $("#m_id").val();
	var userPw = $("#m_password").val();
	if (userPw.indexOf(userId) > -1) {
		alert("비밀번호에 아이디를 포함할 수 없습니다.");
		$("#m_password").val("");
		$("#m_password").focus();
		return false;
	} else {
		return true;
	}
}

var idConfirm = 1;
var mailConfirm = 1;
$(function() {
	// 정규표현식
	var reg_uid = /^[a-z0-9]{6,16}$/; // 5~16자 영문소문자, 숫자 사용가능
	var reg_upw = /^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{6,24}$/;
	// 이름 정규식
	var reg_name = /^[가-힣]{2,5}$/; // 2~5글자 한글

	// 6~16자 영문소문자, 숫자, 특수문자 혼합하여 사용

	// 사용자에게 요구사항에 대한 문자열로 배열 초기화.
	var message = [ "영문,숫자만 가능. 6 ~ 12자로 입력해 주세요",
			"영문,숫자,특수문자만 가능. 8 ~ 15자 입력해 주세요.", "비밀번호와 비밀번호 확인란은 값이 일치해야 합니다.",
			"- 포함 입력해 주세요. 예시) 010-0000-0000" ];

	$('.error').each(function(index) {
		$('.error').eq(index).html(message[index]);
	});

	$('#m_id, #m_password, #m_pwCheck, #m_phone').bind("focus", function() {
		var idx = $("#m_id, #m_password, #m_pwCheck, #m_phone").index(this);
		// console.log("대상 : "+ idx );
		$(this).parents(".form-group").find(".error").html(message[idx]);
	});

	// 아이디 중복확인
	$("#idConfirmBtn").click(function() {
		var data = {
			"m_id" : $("#m_id").val()
		};
		if (reg_uid.test($("#m_id").val())) {
			$.ajax({
				url : "/member/userIdConfirm",
				type : "post",
				data : data,
				error : function() {
					alert('사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
				},
				success : function(resultData) {
					console.log("resultData : " + resultData);
					if (resultData == "1") {
						alert("아이디 사용불가");
						$("#m_id").val("").focus();
					} else if (resultData == "0") {
						alert("아이디 사용가능");
						$("#m_id").attr("readonly", true);
						idConfirm = 2;
						$("#m_password").val("").focus();
					}
				}
			});
		} else {
			alert("아이디가 형식에 맞지 않습니다 다시 입력 해 주세요");
			$("#m_id").val("").focus();
		}
	});

	$("#m_name").change(function() {
		if (!reg_name.test($("#m_name").val())) {
			alert("이름이 형식에 맞지 않습니다.");
			$("#m_name").val("").focus();
		}
	});

	// 이메일 중복확인
	$("#mailConfirmBtn")
			.click(
					function() {
						var data = {
							"m_mail" : $("#m_mail").val()
						};
						// 이메일 형식 정규식
						var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
						var emailVal = $("#m_mail").val();

						if (emailVal.match(regExp) != null) {
							$
									.ajax({
										url : "/member/userMailConfirm",
										type : "post",
										data : data,
										error : function() {
											alert('사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
										},
										success : function(resultData) {
											console.log("resultData : "
													+ resultData);
											if (resultData == "1") {
												alert("이미 등록된 이메일입니다.");
												$("#m_mail").val("").focus();
											} else if (resultData == "0") {
												alert("이메일 사용 가능");
												$("#m_mail").attr("readonly",
														true);
												mailConfirm = 2;
												$("#sample6_postcode").val("")
														.focus();
											}
										}
									});
						} else {
							alert("이메일 형식에 맞게 입력하세요");
							$("#m_mail").val("").focus();
						}
					});

	$("#m_pwCheck").change(
			function() {
				if (reg_upw.test($("#m_password").val())) {
					if ($("#m_pwCheck").val() == $("#m_password").val()) {
						$("#password").empty().append("<p>비밀번호 일치").css(
								"color", "blue");
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

	$("#male").click(function() {
		$("#m_gender").val($("input[name=chk_gender]:checked").val());
	});

	$("#female").click(function() {
		$("#m_gender").val($("input[name=chk_gender]:checked").val());
	});

	/* 확인 버튼 클릭 시 처리 이벤트 */
	$("#joinInsert").click(
			function() {
				if ($("#captcha2").val() == "") {
					alert("자동가입방지문자 검사를해주세요.");
				}
				if ($("#m_id").attr("readonly")
						&& $("#m_mail").attr("readonly")) {
					if ($("#captchaSub").attr("disabled", true)) {
						if ($("#chk_agreement").is(":checked")) {
							$("#m_agreement").val(1);
						} else {
							$("#m_agreement").val(0);
						}
						$("#m_payment").val(0);
						var postcode = $("#sample6_postcode").val()
								+ $("#sample6_address").val()
								+ $("#sample6_address2").val();
						$("#m_address").val(postcode);
						if (!chkSubmit($('#m_id'), "아이디를"))
							return;
						else if (!chkSubmit($('#m_password'), "비밀번호를"))
							return;
						else if (!chkSubmit($('#m_name'), "이름을"))
							return;
						else if (!chkSubmit($('#m_phone'), "핸드폰번호를"))
							return;
						else if (!chkSubmit($('#m_mail'), "이메일주소를"))
							return;
						else if (!chkSubmit($('#m_address'), "우편번호를"))
							return;
						else {
							$("#memberForm").attr({
								"method" : "post",
								"action" : "/member/memberInsert"
							});
							$("#memberForm").submit();
						}
					} else {
						alert("자동가입방지검사 필요.");
					}
				} else {
					alert("중복검사 필요.");
				}

			});

	$("#joinCancel").click(function() {
		location.href = "/";
	});

	var $captchaLoader = $("#captchaForm .box.captcha .loading");
	var $captchaImg = $("#captchaForm .box.captcha img");

	// captcha 새로고침
	$captchaImg.click(function() {
		$captchaLoader.show();
		$(this).attr("src", "/captcha?ran=" + Math.random());
		$captchaLoader.fadeOut(500);
	});
});

/*
 * 배열: 유효성 체크 시 필요한 정규식으로 배열을 초기화. pattern = [ 아이디 , 비밀번호, 핸드폰번호] 함수명:
 * inputVerify(배열 인덱스번호, 비교할 값, 출력영역)
 */
var pattern = [ "((?=.*[a-zA-Z])(?=.*[0-9]).{6,10})",
		"((?=.*[a-zA-Z])(?=.*[0-9@#$%]).{8,12})", "^\\d{3}-\\d{3,4}-\\d{4}" ];
function inputVerify(index, data, printarea) {
	var data_regExp = new RegExp(pattern[index]);
	var match = data_regExp.exec($(data).val());
	if (match == null) {
		$(printarea).html("입력값이 형식에 맞지 않습니다. 다시 입력해 주세요.");
		$(data).val("");
		return false;
	} else {
		return true;
	}
}
function sample6_execDaumPostcode() {
	new daum.Postcode({
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
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
							: data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
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
