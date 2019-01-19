<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$("#registReviewBtn").on("click", function() {
			$.ajax({
				url : "/manager/review/regist",
				type : "post",
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "post"
				},
				dataType : "text",
				data : JSON.stringify({
				}),
				success : function(result) {
					$("#board_area").html(result);
				},
				error : function(result) {
					alert("진행중 오류가 발생했습니다.")
				}
			});
		});
		
		$(".goDetail").click(function(){
			if($(this).attr("id") == "notice_title") {
				$.ajax({
					url : "/manager/review/noticeDetail",
					type : "post",
					headers : {
						"Content-type" : "application/json",
						"X-HTTP-Method-Override" : "post"
					},
					dataType : "text",
					data : JSON.stringify({
						r_num : $(this).parents("tr").attr("data-num"),
					}),
					success : function(result) {
						$("#board_area").html(result);
					},
					error : function(result) {
						alert("진행중 오류가 발생했습니다.");
					}
				});	
				
			} else {
				$.ajax({
					url : "/manager/review/detail",
					type : "post",
					headers : {
						"Content-type" : "application/json",
						"X-HTTP-Method-Override" : "post"
					},
					dataType : "text",
					data : JSON.stringify({
						r_num : $(this).parents("tr").attr("data-num"),
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
			}		
		});
		
		$(".page-item a").on("click", function(e){
			e.preventDefault();	
			$("#detail").find("input[name='pageNum']").val($(this).attr("href"));
			$.ajax({
				url : "/manager/review/listWithPaging",
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
				error : function(result) {
					alert("진행중 오류가 발생했습니다.");
				}
			});
		});
		
		$("#review_search_button").click(function() {
			if ($("#review_search_option").val() == '공지사항') {
				$.ajax({
					url : "/manager/review/noticeAll",
					type : "post",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "post"
					},
					dataType : "text",
					data : JSON.stringify({
						search_option : $("#review_search_option").val(),
						search_keyword : $("#review_search_keyword").val()
					}),
					success : function(result) {
						$("#board_area").html(result);						
					},
					error : function(result) {
						alert("진행중 오류가 발생했습니다.");
					}
				});
			} else {
				if ($("#review_search_keyword").val() != null && $("#review_search_keyword").val() != "") {
					$.ajax({
						url : "/manager/review/listWithPaging",
						type : "post",
						headers : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "post"
						},
						dataType : "text",
						data : JSON.stringify({
							search_option : $("#review_search_option").val(),
							search_keyword : $("#review_search_keyword").val(),
							pageNum : $(this).attr("href"),
							amount : $("#amount").val()
						}),
						success : function(result) {
							$("#board_area").html(result);
						},
						error : function(result) {
							alert("진행중 오류가 발생했습니다.");
						}
					});
				} else {
					alert("검색어를 입력하십시오.");
				}
			}
		});
		
		$("#review_search_keyword").on("focus", function() {
			if ($("#review_search_option").val() == '공지사항') {
				$(this).attr("placeholder", "※ Search click →").attr("readonly", true);
				$("#review_search_button").focus();
			} else {
				$(this).attr("placeholder", "").attr("readonly", false);
			}
		});
	});
</script>
</head>
<body>
<div class="board_search_wrapper">
<h4>Review Board</h4>
<div id="board_search_div">
<select id="review_search_option" class="form-control">
<option value="제목">제목</option>
<option value="내용">내용</option>
<option value="작성자">작성자</option>
<option value="제목내용">제목/내용</option>
<option value="상품명">상품명</option>
<option value="작성일">작성일</option>
<option value="공지사항">Notice All</option>
</select>
<input type="text" id="review_search_keyword" class="form-control">
<button type="button" id="review_search_button" class="btn btn-default">Search</button>
</div>
</div>
<form name="detail" id="detail">
	<input type="hidden" name="q_num" id="q_num">
	<input type="hidden" name="pageNum" id="pageNum"  value="${pageMaker.cri.pageNum}">
	<input type="hidden" name="amount" id="amount" value="${pageMaker.cri.amount}">
	<input type="hidden" name="search_option" value="${pageMaker.cri.search_option}">
	<input type="hidden" name="search_keyword" value="${pageMaker.cri.search_keyword}">
</form>
<table summary="게시판 리스트" class="table table-striped table-hover">
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
		<c:when test="${empty reviewNoticeList && empty reviewList}">
		<tr>
			<td colspan="5" class="empty_board_td"><p class="empty_board_p">등록된 글이 없습니다.</p></td>
		</tr>	
		</c:when>
		<c:when test="${!empty reviewNoticeList && empty reviewList}">
		<c:forEach var="notice" items="${reviewNoticeList}" varStatus="status">
        <tr class="tac" data-num="${notice.r_num}" id="review_notice_tr">
        	<td>${notice.r_num}</td> 
            <td class="goDetail tal" id="notice_title"><a>${notice.r_title}</a></td>
            <td class="name">${notice.r_writer}</td>
            <td>${notice.r_date}</td>
            <td>${notice.r_count}</td>
        </tr>
        </c:forEach>
		</c:when>
		<c:when test="${!empty reviewNoticeList && !empty reviewList}">
		<c:forEach var="notice" items="${reviewNoticeList}" varStatus="status">
        <tr class="notice_tr" data-num="${notice.r_num}">
        	<td>${notice.r_num}</td> 
            <td class="goDetail tal" id="notice_title"><a>${notice.r_title}</a></td>
            <td class="name">${notice.r_writer}</td>
            <td>${notice.r_date}</td>
            <td>${notice.r_count}</td>
        </tr>
        </c:forEach>
        <c:forEach var="review" items="${reviewList}" varStatus="status">
        <tr class="tac" data-num="${review.r_num}">
        	<td>${review.r_num}</td> 
            <td class="goDetail tal" id="review_title"><a>${review.r_title}</a></td>
            <td class="name">${review.r_writer}</td>
            <td>${review.r_date}</td>
            <td>${review.r_count}</td>
        </tr>
        </c:forEach>
		</c:when>
	</c:choose>	
	</tbody>
</table>
<!-- </form> -->
<div class="boardBtnDiv"><button id="registReviewBtn" class="btn btn-default">글쓰기</button></div>
<button type="button" id="register_button" class="btn btn-primary" data-toggle="modal"  data-target="#productInsert" data-whatever="@mdo">Register</button>

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

<div class="modal fade" id="productInsert" tabindex="-1" role="dialog"
      aria-labelledby="galleryModalLabel" aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">

               <button type="button" class="close" data-dismiss="modal"
                  aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
               <h4 class="modal-title" id="galleryModalLabel">상품 등록</h4>
            </div>
            <div class="modal-body">
               <div class="modal-size">
                  <form id="insertForm" name="insertForm" enctype="multipart/form-data" action="/manager/review/insert"
                  method="post">
      
         		  	  m_num : <input type="text" name="m_num">
         		  	  t_num : <input type="text" name="t_num">
         		  	  p_num : <input type="text" name="p_num">
         		  	  r_title : <input type="text" name="r_title">
         		  	  r_content : <input type="text" name="r_content">
  
        
                      <input type="file" name="file" id="file">
                      <button type="submit" class="btn btn-primary" id="productInsertBtn">상품 등록</button>
                  </form>
             </div>
             </div>
             </div>
             </div>
</body>
</html>