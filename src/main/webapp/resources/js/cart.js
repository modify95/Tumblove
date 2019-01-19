$(function() {
	$('a[href=#]').click(function(e) {
		e.preventDefault();
	});

	$('input:checkbox').prop("checked", true);

	$('.editCart').click(
			function() {
				var c_num = $(this).data('cart-no');
				window.open('/cart/editCart?c_num=' + c_num, 'pop',
						'status=no,menubar=no,width=490,height=250');
			});

	$('.btn_plus').click(function() {
		var price = $('#price').html().replace(/,/gi, '');
		var cnt = parseInt($('.amount').val());
		$('.amount').val(++cnt);
		$('.totalPrice').html((price * cnt).toLocaleString());
	});

	$('.btn_minus').click(function() {
		var price = $('#price').html().replace(/,/gi, '');
		var cnt = parseInt($('.amount').val());
		if (cnt == '1') {
			alert('이 상품은 1개 이상부터 구매하실 수 있습니다.\n1개 이상 구매해 주세요.')
		} else {
			$('.amount').val(--cnt);
			$('.totalPrice').html((price * cnt).toLocaleString());
		}
	});

	$('.btn_confirm').click(function() {
		var c_num = getParameterByName('c_num');
		var cnt = parseInt($('.amount').val());
		$.ajax({
			url : "/cart/editCart",
			type : "post",
			data : {
				'c_num' : c_num,
				'c_amount' : cnt
			},
			success : function(data) {
				if (data == 'success') {
					opener.parent.location.reload();
					window.close();
				} else {
					alert('장바구니 수정에 오류가 생겼습닌다.\n관리자에게 문의해주세요.');
				}
			}
		});
	});

	$('.btn_cancel').click(function() {
		window.close();
	});

	$('.checkbox_All').change(function() {
		if ($('.checkbox_All').is(':checked') == true) {
			$('input:checkbox[class="cart_checkbox"]').each(function() {
				this.checked = true;
			});
		} else {
			$('input:checkbox[class="cart_checkbox"]').each(function() {
				this.checked = false;
			});
		}
		checkedPrice();
	});

	$('input:checkbox[class="cart_checkbox"]')
			.change(
					function() {
						var totalCheckbox = $('input:checkbox[class="cart_checkbox"]').length
						var checkedbox = $('input:checkbox[class="cart_checkbox"]:checked').length
						if (totalCheckbox == checkedbox) {
							$('.checkbox_All').prop("checked", true);
						} else {
							$('.checkbox_All').prop("checked", false);
						}
						checkedPrice();
					});

	$('.selDelCart').click(function() {
		var checkboxNum = [];
		$('input:checkbox[class="cart_checkbox"]:checked').each(function() {
			checkboxNum.push(parseInt($(this).data('cart-no')));
		});

		$.ajax({
			url : "/cart/deleteCart2",
			type : "post",
			traditional : true,
			data : {
				'clist' : checkboxNum
			},
			success : function(data) {
				if (data == 'success') {
					location.reload();
				} else {
					alert('장바구니 삭제에 오류가 생겼습닌다.\n관리자에게 문의해주세요.');
				}
			}
		});
	});

	$('.addcart').click(function() {
		var p_num = getParameterByName('p_num');
		var cnt = parseInt($('#amount').val());

		$.ajax({
			url : '/cart/addCart',
			type : 'post',
			data : {
				'p_num' : p_num,
				'c_amount' : cnt
			},
			success : function(data) {
				if (data == 'success') {
					var gocart = confirm('장바구니에 상품을 담았습니다.\n장바구니로 이동하시겠습니까?')
					if (gocart == true) {
						location.href = '/cart/cartList';
					}
				} else {
					alert('장바구니 추가에 오류가 발생하였습니다.\n관리자에게 문의해주세요.');
				}
			}
		});
	});

	$('.deleteCart').click(function() {
		var c_num = $(this).data('cart-no');

		$.ajax({
			url : "/cart/deleteCart1",
			type : "post",
			traditional : true,
			data : {
				c_num : c_num
			},
			success : function(data) {
				if (data == 'success') {
					location.reload();
				} else {
					alert('장바구니 삭제에 오류가 생겼습닌다.\n관리자에게 문의해주세요.');
				}
			}
		});
	});

	$(".order").click(function() {
		var checkboxNum = [];

		$('input:checkbox[class="cart_checkbox"]:checked').each(function() {
			checkboxNum.push(parseInt($(this).data('cart-no')));
		});

		if (checkboxNum == "") {
			alert("상품을 선택해주세요.");
			return false;
		}

		var form = document.createElement("form");

		form.setAttribute("method", "post");
		form.setAttribute("action", "/trading/cartOrder");

		var filed = document.createElement("input");

		filed.setAttribute("type", "hidden");
		filed.setAttribute("name", "clist");
		filed.setAttribute("value", checkboxNum);
		form.appendChild(filed);

		document.body.appendChild(form);

		form.submit();
	});

	$(".orderCart").click(function() {
		var checkboxNum = [];

		checkboxNum.push($(this).data('cart-no'));

		var form = document.createElement("form");

		form.setAttribute("method", "post");
		form.setAttribute("action", "/trading/cartOrder");

		var filed = document.createElement("input");

		filed.setAttribute("type", "hidden");
		filed.setAttribute("name", "clist");
		filed.setAttribute("value", checkboxNum);
		form.appendChild(filed);

		document.body.appendChild(form);

		form.submit();
	});

});

function getParameterByName(name) {
	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex
			.exec(location.search);
	return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g,
			" "));
}

function checkedPrice() {
	var priceList = [];
	var ocheckbox = $('input:checkbox[class="cart_checkbox"]:checked').each(
			function() {
				priceList.push($(this).parents("tr").find("em").text().replace(
						',', ''));
			});

	var totalPrice = 0;
	var cnt = priceList.length;
	for (var i = 0; i < cnt; i++) {
		totalPrice += Number(priceList[i]);
	}

	$('.totalProPrice').text(totalPrice.toLocaleString());
	$('.totalDelPrice').text((cnt * 3000).toLocaleString());
	$('.totalPrice').text((totalPrice + cnt * 3000).toLocaleString());
}