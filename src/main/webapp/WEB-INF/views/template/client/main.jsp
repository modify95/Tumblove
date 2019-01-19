<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#product_list li:first-child {
	margin-top: 10px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function() {
		var orderForm = $("#orderForm");
		$("#order_sales").on("click",function(e){
			e.preventDefault();
			orderForm.find("input[name='order']").val("p_sales_volume");
			orderForm.submit();
		});
		$("#order_grade").on("click",function(e){
			e.preventDefault();
			orderForm.find("input[name='order']").val("p_grade");
			orderForm.submit();
		});
		$("#order_latest").on("click",function(e){
			e.preventDefault();
			orderForm.find("input[name='order']").val("p_date");
			orderForm.submit();
		});
		$("#product_li1 a").on("click", function(e){
			e.preventDefault();
			$("#popularDetail").find("input[name='p_num']").val($(this).attr("href"));
			$("#popularDetail").submit();
		});
		$("#new_product_button").on("click", function(){
			$("#newDetail").find("input[name='p_num']").val($(this).attr("data-num"));
			$("#newDetail").submit();
		});
		$("#product1_4x4 a").on("click", function(e){
			e.preventDefault();
			$("#listDetail").find("input[name='p_num']").val($(this).attr("href"));
			$("#listDetail").submit();
		});
		if ($("#statementChk").val() == '탈퇴회원') {
	         alert("탈퇴한 회원입니다.");
	         location.href = "member/logout2";
	      }
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
	<%
		if (session.getAttribute("m_statement").equals("대기회원")) {
	%>
	<div>
		<jsp:include page="../../member/emailVerify.jsp"></jsp:include>
	</div>
	<%
		} else {
	%>
	<c:choose>
	<c:when test="${empty popularList }">
	<h4 class="nullh4">Popular List ↓</h4>
		<div id="list_null_div">등록된 상품이 없습니다.</div>
	</c:when>
	<c:when test="${!empty popularList }">
	<div id="product_list_wrapper">
		<h1>인기상품</h1>
		<c:forEach items="${popularList}" var="popularProduct">
		<form id="popularDetail" action="/product/detail">
		<input type="hidden" name="p_num" id="popularDetailP_num">
		</form>
			<ul id="product_list">
				<li id="product_li1">
					<a href="${popularProduct.p_num}" target="_blank">	
					<div id="thumbnail_area">
						<div id="thumbnail_image">
							<img alt="상품사진" src="/upload/product/${popularProduct.image1}">
						</div>
						<div id="thumbnail_text">${popularProduct.p_name}<strong>
								<fmt:formatNumber value=" ${popularProduct.p_price}"
									pattern="#,###,###" />원
							</strong>
						</div></a>
				</li>
			</ul>
		</c:forEach>
	</div>
	</c:when>
	</c:choose>
	<c:choose>
	<c:when test="${empty newProduct }">
	<h4 class="nullh4" id="nullh4_new">New product ↓</h4>
		<div id="list_null_div">등록된 상품이 없습니다.</div>
	</c:when>
	<c:when test="${!empty newProduct}">
	<div id="new_product_div">
		<br> <br>
		<!-- <h1>『신상품』</h1> -->
		<div id="thumbnail_area_new">
		<c:forEach items="${newProduct}" var="newP">
		<form action="/product/detail" id="newDetail">
			<input type="hidden" name="p_num" id="newDetailP_num">
		</form>
			<div id="new_product_img_div">
				<img alt="상품사진" src="/upload/product/${newP.image1}" height="405px">
			</div>
			<span id="new_product">New Product</span>
			<ul id="new_product_ul">
				<li>상품명 <input type="text" id="product_name"
					readonly="readonly" name="product_name" value="${newP.p_name}"></li>
				<li>가격 <input type="text" id="product_price"
					readonly="readonly" name="product_price" value="<fmt:formatNumber value=" ${newP.p_price}"
									pattern="#,###,###" />원"></li>
				<li>브랜드 <input type="text" id="product_category"
					readonly="readonly" name="product_category" value="${newP.p_category}"></li>
				<li>재질 <input type="text" id="product_material"
					readonly="readonly" name="product_material" value="${newP.p_material}"></li>	
				<c:choose>
				<c:when test="${newP.p_capacity == null}">
				<li>용량 <input type="text" id="product_capacity_null"
					readonly="readonly" name="product_capasity"></li>
				</c:when>
				<c:when test="${newP.p_capacity != null}">
				<li>용량 <input type="text" id="product_capacity"
					readonly="readonly" name="product_capasity" value="${newP.p_capacity}"></li>
				</c:when>	
				</c:choose>	
				<li><button type="button" id="new_product_button" data-num="${newP.p_num}">상세보기</button></li>
			</ul>
			</c:forEach>
		</div>
	</div>
	</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${empty productList }">
		<h4 class="nullh4" id="nullh4_list">Product List ↓</h4>
			<div id="list_null_div">등록된 상품이 없습니다.</div>
		</c:when>
		<c:when test="${!empty productList }">
			<div id="product_list_wrapper">
				<br> <br>
				<div id="product_list_order">
					<span> 상품리스트&nbsp;</span> <a href="/" id="order_sales">판매량 높은 순</a> | <a href="/" id="order_grade">평점 높은 순</a> | <a href="/" id="order_latest">최신
						등록 순</a>
				</div>
				<c:forEach items="${productList}" var="product">
				<form action="/product/detail" id="listDetail">
				<input type="hidden" name="p_num" id="listDetailP_num">
				</form>
				<form id="orderForm" action="/">
					<input type="hidden" name="order">
				</form>
					<ul id="product_list">
						<li id="product1_4x4">
							<a href="${product.p_num}" target="_blank">
							<div id="thumbnail_area">	
								<div id="thumbnail_image">
								<img alt="상품사진" src="/upload/product/${product.image1}">
								</div>
								<div id="thumbnail_text">${product.p_name}<strong>
										<fmt:formatNumber value=" ${product.p_price}" pattern="#,###,###" />원
									</strong>
								</div>
							</div></a>
						</li>
					</ul>
				</c:forEach>
			</div>
		</c:when>
	</c:choose>
	<%
		}
	%>
	<footer>
		<tiles:insertAttribute name="footer" />
	</footer>
</body>
</html>