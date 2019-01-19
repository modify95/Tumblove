<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/client_main.css">
<link rel="stylesheet" href="/resources/css/manager_main.css">
<link rel="stylesheet" href="/resources/css/manager_member.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
 <script type="text/javascript">
	$(function() {
		$(".goDetail").click(function(result) {
			$.ajax({
				url : "/manager/member/memberDetail",
				type : "post",
				headers :{
					"Content-type" : "application/json",
					"X-HTTP-Method-Override" : "post"
				},
				dataType : "text",
				data : JSON.stringify({
					m_num : $(this).parent("tr").attr("data-num"),
					search_option : $("input[name='search_option']").val(),
					search_keyword : $("input[name='search_keyword']").val(),
					pageNum : $("#pageNum").val(),
					amount : $("#amount").val()
				}),
				success : function(result){
					$("#mMember_content").html(result);
				},
				error : function(result){
					alert("������ ������ �߻��߽��ϴ�.");
				}
			});
		});
		$(".page-item a").on("click", function(e){
			e.preventDefault();	
			$("#detail").find("input[name='pageNum']").val($(this).attr("href"));
			$("#detail").attr("action", "/manager/member/listPaging");
			$("#detail").attr("method", "get");
			$("#detail").submit();
		});
		$("#member_search_button").click(function(){
	         if ($("#member_search_keyword").val() != null && $("#member_search_keyword").val() != "") {
	        	if ($("#member_search_option").val() == '�����õ���') {
	        		if($("#member_search_keyword").val() =='����' || $("#member_search_keyword").val() =='����') {
	        			$("#detail").find("input[name='search_option']").val($("#member_search_option").val());
	    	       	 	$("#detail").find("input[name='search_keyword']").val($("#member_search_keyword").val());
	    	       	 	$("#detail").find("input[name='pageNum']").val("1");
	    	           	$("#detail").attr("action", "/manager/member/listPaging");
	    	           	$("#detail").attr("method", "get");
	    	           	$("#detail").submit();
	        		} else {
	        			alert("������ ���Ǵ� ���� �� ���Ƿ� �˻�� �Է��Ͻʽÿ�.");
	        		}
	        	} else {
	        		$("#detail").find("input[name='search_option']").val($("#member_search_option").val());
    	       	 	$("#detail").find("input[name='search_keyword']").val($("#member_search_keyword").val());
    	       		$("#detail").find("input[name='pageNum']").val("1");
    	           	$("#detail").attr("action", "/manager/member/listPaging");
    	           	$("#detail").attr("method", "get");
    	           	$("#detail").submit();
	        	}
	         } else {
	            alert("�˻�� �Է��Ͻʽÿ�.")
	         }
	      });
	});
</script>
</head>
<body>
<div id="mMember_wrapper">
<div id="mMember_content">
<form name="detail" id="detail">
	<input type="hidden" name="m_num" id="m_num" >
	<input type="hidden" name="search_option" value="${pageMaker.cri.search_option}">
	<input type="hidden" name="search_keyword" value="${pageMaker.cri.search_keyword}">
	<input type="hidden" name="pageNum" id="pageNum"  value="${pageMaker.cri.pageNum}">
	<input type="hidden" name="amount" id="amount" value="${pageMaker.cri.amount}">
</form>


<div class="board_search_wrapper">
<h4>Member</h4>
<div id="board_search_div">
<select id="member_search_option" class="form-control">
<option value="���̵�">���̵�</option>
<option value="�̸�">�̸�</option>
<option value="��ȭ��ȣ">��ȭ��ȣ</option>
<option value="�̸���">�̸���</option>
<option value="�ּ�">�ּ�</option>
<option value="ȸ�����">ȸ�����</option>
<option value="ȸ������">ȸ������</option>
<option value="�����õ���">������</option>
<option value="������">������</option> 
</select>
<input type="text" id="member_search_keyword" class="form-control">
<button type="button" id="member_search_button" class="btn btn-default">Search</button>
</div>
</div>

<table class="table table-striped table-hover">
<thead>
	<tr>
	<th>ȸ����ȣ</th>
	<th>ȸ��ID</th>
	<th>ȸ���̸�</th>
	<th>ȸ�����</th>
	<th>ȸ������</th>
	</tr>
	</thead>
	<tbody id="list">
<c:choose>
		<c:when test="${empty memberList}">
		<tr>
			<td colspan="5" class="empty_board_td"><p class="empty_board_p">��ϵ� ȸ���� �����ϴ�.</p></td>
		</tr>	
		</c:when>
		<c:when test="${!empty memberList}">
		<c:forEach var="mem" items="${memberList}" varStatus="status">
        <tr class="tac" data-num="${mem.m_num}">
        <td>${mem.m_num }</td>
        	<td style="text-align: center" class="goDetail tal"><%-- ${count - status.index} --%>${mem.m_id}</td> 
            <td ><a>${mem.m_name}</a></td>
            <td class="name">${mem.m_grade}</td>
            <td>${mem.m_statement}</td>
        </tr>
        </c:forEach>
		</c:when>
	</c:choose>	
	</tbody>
</table>
<nav aria-label="Page navigation example" id="paging_nav">
	<ul class="pagination">
		<c:if test="${pageMaker.prev}">
			<li class='page-item previouce' id="prev"><a class="page-link" href="${pageMaker.startPage - 1}" aria-label="Previous"> 
			<span aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span></a></li>
		</c:if>
		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			<li class='page-item ${pageMaker.cri.pageNum == num ? "active":""}' id="active">
			<a class="page-link" href="${num}">${num}</a></li>
		</c:forEach>
		<c:if test="${pageMaker.next}">
			<li class='page-item next' id="next"><a class="page-link" href="${pageMaker.endPage + 1}" aria-label="Next"> 
			<span aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span></a></li>
		</c:if>
	</ul>
</nav>
</div>
</div>
</body>
</html>
