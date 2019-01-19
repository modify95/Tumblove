<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/client_main.css">
<link rel="stylesheet" href="/resources/css/manager_main.css">
<link rel="stylesheet" href="/resources/css/manager_board.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".goDetail").click(function() {
			var f_num = $(this).parents("tr").attr("data-num");
			$("#f_num").val(f_num);
			console.log("글번호: " + f_num);

			$("#faqDetailForm").attr({
				"method" : "get",
				"action" : "/faq/faqDetail.do"
			});
			$("#faqDetailForm").submit();
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(
			function() {
				var actionForm = $("#actionForm");
				$(".page-item a").on(
						"click",
						function(e) {
							e.preventDefault();

							actionForm.find("input[name='pageNum']").val(
									$(this).attr("href"));
							actionForm.submit();
						});

				$("#search_button").click(
						function() {
							if ($("#keyword").val() != null
									&& $("#keyword").val != "") {
								$("#actionForm").find("input[name='search']")
										.val($("#search").val());
								$("#actionForm").find("input[name='keyword']")
										.val($('#keyword').val());
								$("#actionForm").find("input[name='pageNum']")
										.val("1");
								$("#actionForm").attr("action", "/faq/search");
								$("#actionForm").attr("method", "get");
								$("#actionForm").submit();
							} else {
								alert("검색어를 입력해주세요")
							}
						});
			});
</script>
<style>
#board_area {
	width: 900px;
	min-height: 300px;
}
#board_search_wrapper {
   width: 100%;
   padding: 15px 0px;   
}

#board_search_wrapper h4 {
   display: inline;
   vertical-align: middle;
   position: relative;
   top: 6px;
   color: gray;
}
#board_search_div {
   float: right;
   width: 340px;
   height: 30px;
   text-align: right;
}

#board_search_div select, #board_search_div input, #board_search_div button {
   height: 30px;
   display: inline;
   vertical-align: middle;
}

#board_search_div select {
   width: 100px;
   padding-left: 4.5px;
}

#board_search_div input {
    width: 150px;
}

#board_search_div button {
    width: 80px;
    padding-top: 4px;
}

#board_area div {
   margin: 0 auto;
}
</style>
</head>
<body>
	<div id="board_area">
		<form name="faqDetailForm" id="faqDetailForm">
			<input type="hidden" name="f_num" id="f_num">
		</form>
		<div id="board_search_wrapper">
			<h4>자주묻는질문</h4>
			<div id="board_search_div">
				<input type="hidden" id="page" name="page" value="1"> 
				<select id="search" name="search" class="form-control">
					<option value="제목">제목</option>
					<option value="내용">내용</option>
					<option value="작성일">작성일</option>
				</select><input type="text" name="keyword" id="keyword" class="form-control" />
				<button type="button" id="search_button" class="btn btn-default">Search</button>
			</div>
		</div>

		<div id="faqList">
			<table class="table table-striped table-hover">
				<colgroup>
					<col width="10%" />
					<col width="70%" />
					<col width="20%" />
				</colgroup>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th data-value="n_date">작성일</th>
				</tr>
				<tbody id="List">
					<c:choose>
						<c:when test="${not empty faqList}">
							<c:forEach var="faq" items="${faqList}" varStatus="status">
								<tr class="tac" data-num="${faq.f_num}">
									<td>${faq.f_num}</td>
									<td class="goDetail tal">${faq.f_title}</td>
									<td>${faq.f_date}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="3" class="empty_board_td"><p
										class="empty_board_p">등록된 게시물이 존재하지 않습니다.</p></td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>

			<nav aria-label="Page navigation example" id="paging_nav">
				<form id="actionForm" action="/faq/faqList" method="get">
					<input type="hidden" name="search" value="${pageMaker.cri.search}" />
					<input type="hidden" name="keyword"
						value="${pageMaker.cri.keyword}" /> <input type="hidden"
						name="pageNum" value="${pageMaker.cri.pageNum}" /> <input
						type="hidden" name="amount" value="${pageMaker.cri.amount}" />
				</form>
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class='page-item previouce' id="prev"><a
							class="page-link" href="${pageMaker.startPage - 1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span><span
								class="sr-only">Previous</span></a></li>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
						<li
							class='page-item ${pageMaker.cri.pageNum == num ? "active":""}'
							id="active"><a class="page-link" href="${num}">${num}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next}">
						<li class='page-item next' id="next"><a class="page-link"
							href="${pageMaker.endPage + 1}" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span></a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
</body>
</html>