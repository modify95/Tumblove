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
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#passwd").hide();
		$(".goDetail").click(function() {
			var q_num = $(this).parents("tr").attr("data-num");
			var password = $(this).attr("data-value");

			if (password == null || password == "") {
				$("#q_num").val(q_num);
				console.log("글번호 : " + q_num);

				//상세 페이지로 이동하기 위해 form 추가
				$("#qnaDetailForm").attr({
					"method" : "get",
					"action" : "/qna/qnaDetail"
				});
				$("#qnaDetailForm").submit();

			} else {

				$("#passwd").show();
				$("#passcheck").click(function() {
					if ($("#passtext").val() == '') {
						alert("비밀번호를 입력해주세요");
						return false;
					} else {
						if (password == $("#passtext").val()) {
							$("#q_num").val(q_num);
							console.log("글번호 : " + q_num);

							//상세 페이지로 이동하기 위해 form 추가
							$("#qnaDetailForm").attr({
								"method" : "get",
								"action" : "/qna/qnaDetail"
							});
							$("#qnaDetailForm").submit();
						} else {
							alert("비밀번호가 일치하지 않습니다");
						}
					}
				});
			}
		});

		$("#qnaWhite").click(function() {
			location.href = "/qna/qnaRegist";
		});

		var actionForm = $("#actionForm");
		$(".page-item a").on("click", function(e) {
			e.preventDefault();

			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});

		$("#search_button")
				.click(
						function() {
							if ($("#keyword").val() != null
									&& $("#keyword").val() != "") {

								$("#actionForm").find("input[name='search']")
										.val($("#search").val());
								$("#actionForm").find("input[name='keyword']")
										.val($('#keyword').val());
								$("#actionForm").find("input[name='pageNum']")
										.val("1");
								$("#actionForm").attr("action",
										"/qna/qnaSearch");

								$("#actionForm").attr("method", "get");
								$("#actionForm").submit();

							} else {
								alert("검색어를 입력하십시오.");

							}
						});

	});
</script>
<style>

#board_wrapper {
   width: 1000px;
   margin: 0 auto;
}
.boardButtons {
   width: 240px;
   float: left;
   margin-left: 5px;
}
.boardButtons button {
   font-size: 14px;
   height: 38px;
   font-weight: bold;
}

#bdbtn1 {
   margin-left: 20px;
}

#board_area {
   	width: 900px;
   padding-top: 20px;
   margin: 10px auto;
 min-height: 300px;
}

h4 {
   width: 240px;
   margin: 0 auto;
   text-align: center;
   font-family: "굴림";
   font-weight: bold;
   padding-top: 20px;
}
table {
   margin-top: 20px;
}
table input, table textarea {
   border: none;
   width: 100%;
   resize: none;
}
textarea {
   resize: none;
}
table input:focus, table textarea:focus {
   outline: none;
}
table tr:first-child th {
   text-align: center;
}
table tr td:first-child {
	width: 12%;
   text-align: center;
}
table tr td:first-child + td {
	width: 12%;
   text-align: center;
}
table tr td:first-child + td + td  {
	width: 43%;
   text-align: left;
}
table tr td:first-child + td + td + td {
	width: 15%;
   text-align: center;
}
table tr td:first-child + td + td + td + td {
	width: 18%;
   text-align: center;
}
.boardBtnDiv button {
   float: right;
   height: 26px;
   font-size: 12px;
   padding-top: 5px;
   width: 70px;
   margin-right: 2px;
   margin-top: -18px;
}
#boardChoiceP {
   margin: 140px auto;
   text-align: center;
   border-radius: 5px;
   margin-bottom: -180px;
}

.table-hover tr th {
   width: 200px;
   text-align: center;
}
.table-hover tr td {
   text-align: left;
}

.table-hover tr:first-child + tr + tr th {
   vertical-align: middle;
}

.table-hover tr td {
   text-align: left;
}

.table-hover tr:first-child + tr + tr th {
   vertical-align: middle;
}

.empty_board_td {
   height: 200px;
   border: 1px solid #ddd;
}

.empty_board_p {
   margin-top: 80px;
}

#boardButton1:focus, #boardButton2:focus, #boardButton3:focus, #boardButton4:focus {
   outline: none;
}

#paging_nav {
   width: 200px;
   margin: 0 auto;
   text-align: center;
}

.box-footer {
   clear:both;
}

.pull-left {
   width: 100%;
   text-align: center;
}

.pull-left button {
   width: 100px;
}

.mailbox-read-message {
   min-height: 280px;
}
.box-header h3 {
   font-weight: bolder;
}


#f_category {
   float: left;
   display: inline;
   width: 10%;
   margin-bottom: 8px;
}

#f_title {
   float: right;
   display: inline;
   width: 89%;
}

.board_search_wrapper {
   width: 100%;
   padding: 15px 0px;   
}

.board_search_wrapper h4 {
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
		
		<form name="qnaDetailForm" id="qnaDetailForm">
			<input type="hidden" name="q_num" id="q_num">
		</form>
		<div class="board_search_wrapper">
			<h4>QnA</h4>
			    
			<div id="board_search_div">
				<form id="q_search" name="q_search">
					<input type="hidden" id="page" name="page" value="1" /> <select
						id="search" name="search" class="form-control">
						<option value="제목">제목</option>
						<option value="내용">내용</option>
						<option value="작성자">작성자</option>
					</select> <input type="text" name="keyword" id="keyword" class="form-control" /> 
					<button type="button" id="search_button" class="btn btn-default">Search</button>
				</form>
			</div>
		</div>



		<div id="qnaList">
			<table class="table table-striped table-hover" id="cQnaTable">
			<thead>
				<tr>
					<th>카테고리</th>
					<th width="10%">답변상태</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
				 </thead>
				<tbody id="List">
					<c:choose>
						<c:when test="${not empty qnaList}">
							<c:forEach var="qna" items="${qnaList}" varStatus="status">
								<tr class="tac" data-num="${qna.q_num}">
									<td>[${qna.q_category}]</td>
									<td width="10%">미답변</td>
									<c:if test="${ not empty qna.q_password }">
										<td width="10%" class="goDetail" data-value="${ qna.q_password }"><img
											src="/resources/image/lock.jpg" width="10px" />${qna.q_title}</td>
									</c:if>
									<c:if test="${ empty qna.q_password }">
										<td class="goDetail" data-value="${ qna.q_password }">${qna.q_title}</td>
									</c:if>
									<td>${qna.m_id}</td>
									<td>${qna.q_date}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
						<tr>
								<td colspan="5" class="empty_board_td"><p
										class="empty_board_p">등록된 게시물이 존재하지 않습니다.</p></td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			 <div>
			<div> <input type="button" id="qnaWhite" value="Q&A작성하기"  class="btn btn-default"></div> 
			
			<div id="passwd" align="center">
      비공개게시글입니다<br>작성시 입력한 비밀번호를입력해주세요<br><input type="text" id="passtext" name="passtext">
      <input type="button" value="확인" id="passcheck">
      </div> 
      </div>

		<nav aria-label="Page navigation example" id="paging_nav">

				<form id="actionForm" action="/qna/qnaList" method="get">
					<input type="hidden" name="search" value="${pageMaker.cri.search}">
					<input type="hidden" name="keyword"
						value="${pageMaker.cri.keyword}"> <input type="hidden"
						name="pageNum" value="${pageMaker.cri.pageNum}" /> <input
						type="hidden" name="amount" value="${pageMaker.cri.amount}">
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