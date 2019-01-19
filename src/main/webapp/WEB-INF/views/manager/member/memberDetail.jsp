<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#member_detail_buttons {
	width: 100px;
	margin: 30px auto;
}
#member_detail_buttons button {
	width: 100px;
	height: 30px;
	padding-top: 4.5px;
}
</style>
<script>
	$(function() {
		$("#member_detail_buttons button").click(function() {
			$("#detail").attr("action", "/manager/member/memberList");
			$("#detail").submit();
		});
	});
</script>
<div class="box-header">
	<h3 class="box-title">Hover Data Table</h3>
</div>
<!-- /.box-header -->
<table id="example2" class="table table-bordered table-hover">
	<tbody>
		<tr>
			<td>ID</td>
			<td>${memberDetail.m_id }</td>
			<td>누적결제금액</td>
			<td>${memberDetail.m_payment }</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${memberDetail.m_name }</td>
			<td>성별</td>
			<td>${memberDetail.m_gender }</td>
		<tr>
			<td>휴대전화</td>
			<td>${memberDetail.m_phone }</td>
			<td>생년월일</td>
			<td>${memberDetail.m_birth }</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${memberDetail.m_address }</td>
			<td>본인확인질문</td>
			<td>${memberDetail.m_question }</td>
		</tr>
		<tr>
			<td>E-Mail</td>
			<td>${memberDetail.m_mail }</td>
			<td>본인확인답변</td>
			<td>${memberDetail.m_answer }</td>
		</tr>
		<tr>
			<td>회원등급</td>
			<td>${memberDetail.m_grade }</td>
			<td>마케팅수신동의</td>
			<td><c:choose>
					<c:when test="${memberDetail.m_agreement == 1 }">동의</c:when>
					<c:otherwise>미동의</c:otherwise>
				</c:choose></td>
		</tr>
		<tr>
			<td>보유마일리지</td>
			<td>${memberDetail.m_mileage }</td>
			<td>회원상태</td>
			<td>${memberDetail.m_statement }</td>
		</tr>
</table>
<form name="detail" id="detail">
	<input type="hidden" name="m_num" id="m_num" >
	<input type="hidden" name="search_option" value="${pageMaker.cri.search_option}">
	<input type="hidden" name="search_keyword" value="${pageMaker.cri.search_keyword}">
	<input type="hidden" name="pageNum" id="pageNum"  value="${pageMaker.cri.pageNum}">
	<input type="hidden" name="amount" id="amount" value="${pageMaker.cri.amount}">
</form>
<div id="member_detail_buttons">
	<button class="btn btn-default">회원목록</button>
</div>
<!-- /.box-body -->