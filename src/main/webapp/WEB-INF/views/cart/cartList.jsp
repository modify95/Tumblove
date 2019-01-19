<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js/cart.js"></script>
<link type="text/css" rel="stylesheet" href="/resources/css/cart/cart.css">
</head>
<body>
	<div id="container" class="cart">
		<div id="content">
			<div class="heading">
				<ol class="process">
					<li class="on">
						<em class="pro"><span class="blind">장바구니</span></em>
					</li>
					<li>
						<em class="pro2"><span class="blind">주문/결제</span></em>
					</li>
					<li>
						<em class="pro3"><span class="blind">주문완료</span></em>
					</li>
				</ol>
				<h3 class="basket">
					<span class="blind">장바구니</span>
				</h3>
			</div>
			<div class="notify_box">
				<ul class="dot_notify_list">
					<li>
						<span class="dot"></span> 가격, 옵션등 상품정보가 변경된 경우 주문이 불가할 수 있습니다.
					</li>
					<li>
						<span class="dot"></span> 오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니, 주문 시 꼭 다시 확인해 주시기 바랍니다.
					</li>
				</ul>
			</div>
			<div class="table_box">
				<table class="tb_list" cellspacing="0">
					<colgroup>
						<col width="36">
						<col>
						<col width="55">
						<col width="84">
						<col width="132">
					</colgroup>
					<thead>
						<tr>
							<th>
								<input type="checkbox" class="checkbox_All">
							</th>
							<th class="product">
								<strong>상품정보</strong>
							</th>
							<th>수량</th>
							<th class="bg_point">배송비</th>
							<th class="bg_point">상품금액</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${cartList}" var="cartList">
							<tr>
								<td>
									<input type="checkbox" class="cart_checkbox" data-cart-no="${cartList.c_num}">
								</td>
								<td class="product">
									<div class="thmb">
										<div class="img_center">
											<a href="/product/productDetail?p_num=${cartList.p_num}" target="_blank">
												<img width="auto" height="80px" alt="${cartList.p_name}" src="/upload/product/${cartList.image1}">
											</a>
										</div>
									</div>
									<div>
										<div class="product_center">
											<a href="/product/productDetail?p_num=${cartList.p_num}" target="_black">${cartList.p_name}</a>
										</div>
									</div>
								</td>
								<td>
									<strong>${cartList.c_amount}</strong>
									<div>
										<a href="#" class="editCart" data-cart-no="${cartList.c_num}">
											<span class="blind">변경</span>
										</a>
									</div>
								</td>
								<td class="bg_point">
									<fmt:formatNumber value="3000" pattern="#,###" />
									원
								</td>
								<td class="bg_point">
									<strong> <em class="price thm"> <fmt:formatNumber value="${cartList.p_price * cartList.c_amount}" pattern="#,###"></fmt:formatNumber>
									</em> 원
									</strong>
									<p class="btn_group">
										<a href="#" class="orderCart" data-cart-no="${cartList.c_num}">
											<span class="blind">주문</span>
										</a>
										<a href="#" class="deleteCart" data-cart-no="${cartList.c_num}">
											<span class="blind">삭제</span>
										</a>
									</p>
								</td>
							</tr>
							<c:set var="totalProPrice" value="${totalProPrice + cartList.p_price * cartList.c_amount}" />
							<c:set var="totalDelPrice" value="${totalDelPrice + 3000}" />
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="3" class="mileage">
								구매확정시 포인트
								<c:choose>
									<c:when test="${minfo.m_grade == 'bronze'}">
										<c:set var="persent" value="0.007" />
									</c:when>
									<c:when test="${minfo.m_grade == 'gold'}">
										<c:set var="persent" value="0.012" />
									</c:when>
									<c:when test="${minfo.m_grade == 'platinum'}">
										<c:set var="persent" value="0.015" />
									</c:when>
									<c:when test="${minfo.m_grade == 'vip'}">
										<c:set var="persent" value="0.02" />
									</c:when>
								</c:choose>
								<strong class="mPoint"> <fmt:parseNumber var="mileage" integerOnly="true" value="${totalProPrice * persent}" /> <fmt:formatNumber value="${mileage}" pattern="#,###"></fmt:formatNumber>
								</strong>원
							</td>
							<td colspan="2" class="amount bg_point2">
								<ul>
									<li>
										<strong>총 상품금액</strong>
										<p>
											<em class="totalProPrice thm"> <fmt:formatNumber value="${totalProPrice}" pattern="#,###"></fmt:formatNumber></em>원
										</p>
									</li>
									<li>
										<strong>배송비</strong>
										<p>
											<em class="totalDelPrice thm"> <fmt:formatNumber value="${totalDelPrice}" pattern="#,###"></fmt:formatNumber>
											</em>원
										</p>
									</li>
								</ul>
							</td>
						</tr>
						<tr>
							<td colspan="3" class="tb_btnone"></td>
							<td colspan="2" class="amount bg_point2 tot">
								<ul>
									<li>
										<strong>결제금액</strong>
										<p>
											<em class="totalPrice thm"> <fmt:formatNumber value="${totalProPrice + totalDelPrice}" pattern="#,###"></fmt:formatNumber>
											</em>원
										</p>
									</li>
								</ul>
							</td>
						</tr>
					</tfoot>
				</table>
				<div class="btn_product_group">
					<a href="#" class="selDelCart">
						<span class="blind">선택상품 삭제</span>
					</a>
				</div>
				<div class="btn_section">
					<a href="#" class="order">
						<img src="/resources/image/cart/btn_order.gif">
						<span class="blind">주문하기</span>
					</a>
					<a href="/">
						<img src="/resources/image/cart/btn_shopping.gif">
						<span class="blind">쇼핑 홈 가기</span>
					</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>