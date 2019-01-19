<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$("#noticeRegistBtn").on("click", function() {
			$.ajax({
				url : "/manager/notice/regist",
				type : "post",
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "post"
				},
				success : function (result) {
					$("#board_area").html(result);
				},
				error : function (result) {
					alert("진행중 오류가 발생했습니다.");
				}
			});
		});
		
		$(".goDetail").click(function(result){
			/* $("#n_num").val(n_num); */
			// 상세 페이지로 이동하기 위해 form 추가 (id : detailForm) 
			$.ajax({
				url : "/manager/notice/noticeDetail",
				type : "post",
				headers : {
					"Content-type" : "application/json",
					"X-HTTP-Method-Override" : "post"
				},
				dataType : "text",
				data : JSON.stringify({
					n_num : $(this).parents("tr").attr("data-num"),
					search_option : $("input[name='search_option']").val(),
					search_keyword : $("input[name='search_keyword']").val(),
					pageNum : $("#pageNum").val(),
					amount : $("#amount").val()
				}),
				success : function(result) {
					$("#board_area").html(result);
				},
				error : function(result) {
					alert("진행중 오류가 발생했습니다.");
				}
			});
		});
		
		$(".page-item a").on("click", function(e){
			e.preventDefault();	
			$("#detail").find("input[name='pageNum']").val($(this).attr("href"));
			$.ajax({
				url : "/manager/notice/listWithPaging",
				type : "post",
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "post"
				},
				dataType : "text",
				data : JSON.stringify({
					search_option : $("input[name='search_option']").val(),
					search_keyword : $("input[name='search_keyword']").val(),
					pageNum : $(this).attr("href"),
					amount : $("#amount").val()
				}),
				success : function(result) {
					$("#board_area").html(result);
				},
				error : function(request, status, error) {
					alert("status : " + request.status + "\n" + "message : " + request.responseText + "\n" + "error : " + error);
				}
			});
		});
		
		$("#search_button").click(function(){
			if ($("#search_keyword").val() != null && $("#search_keyword").val() != "") {
				$.ajax({
					url : "/manager/notice/search",
					type : "post",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "post"
					},
					dataType : "text",
					data : JSON.stringify({
						search_option : $("#search_option").val(),
						search_keyword : $("#search_keyword").val()
					}),
					success : function(result) {
						$("#board_area").html(result);
					},
					error : function(result) {
						alert("진행중 오류가 발생했습니다.");
					}
				});
			} else {
				alert("검색어를 입력하십시오.")
			}
		});
	});
</script>
</head>
<body>
<div class="board_search_wrapper">
<h4>Notice Board</h4>
<div id="board_search_div">
<select id="search_option" class="form-control">
<option value="제목">제목</option>
<option value="내용">내용</option>
<option value="제목내용">제목/내용</option>
<option value="작성일">작성일</option>
</select>
<input type="text" id="search_keyword" class="form-control">
<button type="button" id="search_button" class="btn btn-default">Search</button>
</div>
</div>
<form name="detail" id="detail">
	<input type="hidden" name="n_num" id="n_num">
	<input type="hidden" name="pageNum" id="pageNum"  value="${pageMaker.cri.pageNum}">
	<input type="hidden" name="amount" id="amount" value="${pageMaker.cri.amount}">
	<input type="hidden" name="search_option" value="${pageMaker.cri.search_option}">
	<input type="hidden" name="search_keyword" value="${pageMaker.cri.search_keyword}">
</form>
<table summary="게시판 리스트" class="table table-striped table-hover" id="notice_table">
	<thead>
    	<tr>
        <th>글번호</th>
        <th>글제목</th>
        <th>작성자</th>
		<th>작성일  </th>
		<th>조회수</th>
        </tr>
    </thead>
	<tbody id="list">
	<c:choose>
		<c:when test="${empty noticeList}">
		<tr>
			<td colspan="5" class="empty_board_td"><p class="empty_board_p">등록된 글이 없습니다.</p></td>
		</tr>	
		</c:when>
		<c:when test="${!empty noticeList}">
		<c:forEach var="notice" items="${noticeList}" varStatus="status">
        <tr class="notice_tr" data-num="${notice.n_num}">
        	<td><%-- ${count - status.index} --%>${notice.n_num}</td> 
            <td class="goDetail tal"><a>${notice.n_title}</a></td>
            <td class="name">${notice.a_id}</td>
            <td>${notice.n_date}</td>
            <td>${notice.n_count}</td>
        </tr>
        </c:forEach>
		</c:when>
	</c:choose>	
	</tbody>
</table>
<!-- </form> -->
<div class="boardBtnDiv"><button id="noticeRegistBtn" class="btn btn-default">글쓰기</button></div>
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
</body>
</html>