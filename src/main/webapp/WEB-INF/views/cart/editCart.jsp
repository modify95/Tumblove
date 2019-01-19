<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 수정</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/cart.js"></script>
<link type="text/css" rel="stylesheet" href="/resources/css/cart/cartEdit.css">
</head>
<body>
	<div id="pop_container" class="cart">
		<div id="pop_content">
			<div class="product_info">
				<div class="thumb">
					<img width="auto" height="80px" alt="${cartInfo.p_name}" src="/upload/product/${cartList.p_image1}">
				</div>
				<dl>
					<dt>${cartInfo.p_name}</dt>
					<dd>
						<em class="thm">
							<span id="price"><fmt:formatNumber value="${cartInfo.p_price}" pattern="#,###"/></span>
							원
						</em>
					</dd>
				</dl>
			</div>
			<div class="product_amount">
				<span class="span_amount">수량</span>
				<input type="text" name="c_amount" class="amount" value="${cartInfo.c_amount}">
				<span class="amount_ctrl">
					<a href="#" class="btn_plus">
						<span class="blind">증가</span>
					</a>
					<a href="#" class="btn_minus">
						<span class="blind">감소</span>
					</a>
				</span>
			</div>
			<div class="total_price">
				<dl>
					<dt>
						<strong>총상품금액</strong>
					</dt>
					<dd>
						<em class="thm">
							<span class="totalPrice">
								<fmt:formatNumber value="${cartInfo.p_price * cartInfo.c_amount}" pattern="#,###" />
							</span>
						</em>
						원
					</dd>
				</dl>
			</div>
			<div class="btn_footer">
				<a href="#" class="btn_confirm">
					<span class="blind">확인</span>
				</a>
				<a href="#" class="btn_cancel">
					<span class="blind">취소</span>
				</a>
			</div>
		</div>
	</div>
</body>
</html>