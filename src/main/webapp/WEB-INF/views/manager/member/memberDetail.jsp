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
			<td>���������ݾ�</td>
			<td>${memberDetail.m_payment }</td>
		</tr>
		<tr>
			<td>�̸�</td>
			<td>${memberDetail.m_name }</td>
			<td>����</td>
			<td>${memberDetail.m_gender }</td>
		<tr>
			<td>�޴���ȭ</td>
			<td>${memberDetail.m_phone }</td>
			<td>�������</td>
			<td>${memberDetail.m_birth }</td>
		</tr>
		<tr>
			<td>�ּ�</td>
			<td>${memberDetail.m_address }</td>
			<td>����Ȯ������</td>
			<td>${memberDetail.m_question }</td>
		</tr>
		<tr>
			<td>E-Mail</td>
			<td>${memberDetail.m_mail }</td>
			<td>����Ȯ�δ亯</td>
			<td>${memberDetail.m_answer }</td>
		</tr>
		<tr>
			<td>ȸ�����</td>
			<td>${memberDetail.m_grade }</td>
			<td>�����ü��ŵ���</td>
			<td><c:choose>
					<c:when test="${memberDetail.m_agreement == 1 }">����</c:when>
					<c:otherwise>�̵���</c:otherwise>
				</c:choose></td>
		</tr>
		<tr>
			<td>�������ϸ���</td>
			<td>${memberDetail.m_mileage }</td>
			<td>ȸ������</td>
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
	<button class="btn btn-default">ȸ�����</button>
</div>
<!-- /.box-body -->