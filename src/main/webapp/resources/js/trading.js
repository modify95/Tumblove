$(function() {
	$("#postcode").blur(function() {
		checkAddress();
	});

	$("#address").blur(function() {
		checkAddress();
	});

	$("#detailAddress").blur(function() {
		checkAddress();
	});

	$("#extraAddress").blur(function() {
		checkAddress();
	});

	$("#deliveryBase").change(function() {
		infoReset();
		$("#deliveryNewInfo").hide();
		$("#deliveryBaseInfo").show();
		$(".baseInfo").prop("disabled", false);
		$(".newInfo").prop("disabled", true);
	});

	$("#deliveryNew").change(function() {
		infoReset();
		$("#deliveryBaseInfo").hide();
		$("#deliveryNewInfo").show();
		$(".baseInfo").prop("disabled", true);
		$(".newInfo").prop("disabled", false);
	});

	$("#btnPayment").click(
			function() {
				if (!paymentCheck()) {
					alert("결제 방식을 선택해주세요.");
					return false;
				}

				if (!checkAddress()) {
					alert("주소를 입력해주세요.");
					return false;
				}

				if (!checkName()) {
					alert("수령인을 입력해주세요.");
					return false;
				}

				if (!checkPhone()) {
					alert("휴대전화를 입력해주세요.");
					return false;
				}
				
				order_trading();
				window.open("about:blank", "paymentpop",
						"status=no,menubar=no,width=490,height=500");
				$("#paymentInfo").attr("action", "/trading/payment");
				$("#paymentInfo").attr("target", "paymentpop");
				$("#paymentInfo").submit();
			});

	$(".paymentMode").change(function() {
		var mode = $(this).val();
		$("#mode").val(mode);

		if (mode == "bank") {
			$("#receipt").show();
		} else {
			$("#receipt").hide();
		}
	});
	
});

function paymentCheck() {
	var check = $("input:radio[name='t_payment_option']").is(":checked");

	if (!check) {
		return false;
	}

	return true;
}

function infoReset() {
	$("#t_recipient").val("");
	$("#t_phone").val("");
	$("#postcode").val("");
	$("#address").val("");
	$("#detailAddress").val("");
	$("#extraAddress").val("");
}

function checkAddress() {
	var postcode = $("#postcode").val();
	var address = $("#address").val();
	var detailAddress = $("#detailAddress").val();
	var extraAddress = $("#extraAddress").val();
	var check = $("input:radio[id='deliveryNew']").is(":checked");

	if (check) {
		if (postcode == "" || address == "") {
			return false;
		}
	}

	var finalAddress = "(" + postcode + ")" + address + detailAddress
			+ extraAddress;

	$("#t_address").val(finalAddress);

	return true;
}

function order_trading() {
	var num = [];
	var amount = [];

	$(".p_num_info").each(function() {
		num.push($(this).data("p_num"));
	});

	$(".o_amount_info").each(function() {
		amount.push($(this).data("o_amount"));
	});

	$("#pnumlist").val(num);
	$("#amountlist").val(amount);
}

function checkName() {
	var name = $("#t_recipient").val();

	if (name == "") {
		return false;
	}

	return true;
}

function checkPhone() {
	var phone = $("#t_phone").val();

	if (phone == "") {
		return false;
	}

	return true;
}
