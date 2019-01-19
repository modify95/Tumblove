<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/js/jquery.form.min.js"></script>
<link rel="stylesheet" href="/resources/css/client_review.css">
<script type="text/javascript">
	// 등록 Jquery
	$(function() {//
		var idCount = $
		{
			idCount
		}
		;
		var msg = "${msg}";
		var m_num = $("#m_num").val();
		var t_num = $("#t_num").val();

		$("#insert_button").click(
				function() {///
					if (m_num != "") { // 로그인 여부 m_num 로 확인 후 비로그인시 확인해달라는 if 문
						if (idCount == 0) { // 등록 1개로 제한 if 문
							if ($('#r_title').val() == "") {
								alert("제목을 입력해주세요.");
								return;
							} else if (msg == "거래내역없음") {
								alert("상품을 구매한 고객께서만 리뷰를 작성하실 수 있습니다.");
							} else if ($('#r_content').val() == "") {
								alert("내용을 입력해 주세요.");
								return;
							} else if ($('#r_score').val() == "") {
								alert("평점을 선택해 주세요.");
								return;
							} else {
								$.ajax({
									url : "/review/reviewInsert",
									type : "post",
									headers : {
										"Content-Type" : "application/json",
										"X-HTTP-Method-Overriding" : "post"
									},
									dataType : "text",
									data : JSON.stringify({
										r_title : $("#r_title").val(),
										r_writer : $("#r_writer").val(),
										p_num : $("#p_num").val(),
										r_content : $("#r_content").val(),
										r_score : $("#r_score").val(),
										pageNum : 1,
										amount : 10
									}),
									success : function(result) {
										$("#review_div").html(result);
									},
									error : function(request, status, error) {
										alert("status : " + request.status
												+ "\n" + "message : "
												+ request.responseText + "\n"
												+ "error : " + error);
									}

								});

								/* 
								$("#insert_form").attr({
									"method" : "post",
									"action" : "/review/reviewInsert"
								});
								$("#insert_form").submit(); */
								/* location.reload(); */
							}
						} else {
							alert("이미 등록한 리뷰가 있습니다 리뷰를 수정해 주세요.");
						} // 등록 1개로 제한 else 문
					} else {
						alert("로그인후 리뷰를 남겨주세요.");
					}// 로그인 여부 m_num 로 확인 후 비로그인시 확인해달라는 if 문
				});///
	});//

	// 수정 Jquery
	$(function() {
		$(".review_update_div").hide();
		$("#review_update")
				.click(
						function() {
							var ud_num = $(this).attr("data-num"); /* 다른 방법으로는 $(this).data("num") 으로도 불러올수 있다. */

							var update = "";
							update += "<form id = 'review_update_form' enctype='multipart/form-data'>";
							update += "<input type = 'hidden' value='"+ ud_num +"' name ='r_num'>";
							update += "<input type = 'text' id = 'update_title' value = '"
									+ $("#review_title").text()
									+ "' name = 'r_title' class='form-control'>";
							update += "<textarea rows='7' cols='123' id='update_content' style='resize: none;' name = 'r_content' class='form-control'>"
									+ $("#review_content").text()
									+ "</textarea>";
							/* update += "<label id ='update_score_text'>평점:</label>"; */
							update += "<select id='update_score' name ='r_score' class='form-control'>";
							update += "<option value = 1>★</option>";
							update += "<option value = 2>★★</option>";
							update += "<option value = 3>★★★</option>";
							update += "<option value = 4>★★★★</option>";
							update += "<option value = 5 selected = 'selected'>★★★★★</option>";
							update += "</select>";
							/* update += "<input type = 'file' id ='file' name='file'>"; */
							update += "<input type = 'button' value='Edit' id ='update_button' class='btn btn-default'>";
							update += "<input type = 'button' value='Cancel' id ='update_cancel' class='btn btn-default'>";
							update += "</form>";

							$(".review_update_div").html(update);
							$(".review_update_div").toggle();
						});
	});

	$(document).on(
			"click",
			"#update_button",
			function() {
				if ($("#update_title").val() == "") {
					alert("제목을 입력해 주세요.");
					return;
				} else if ($("#update_content").val() == "") {
					alert("내용을 입력해 주세요.");
					return;
				} else if ($("#update_score").val() == "") {
					alert("평점을 선택해 주세요.");
					return;
				} else {
					$.ajax({
						url : "/review/reviewUpdate",
						type : "post",
						headers : {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Overriding" : "post"
						},
						dataType : "text",
						data : JSON.stringify({
							r_num : $("#review_update_form").find(
									"input[name='r_num']").val(),
							r_title : $("#review_update_form").find(
									"input[name='r_title']").val(),
							r_content : $("#review_update_form").find(
									"textarea").val(),
							r_score : $("#review_update_form").find("select")
									.val(),
							pageNum : 1,
							amount : 10
						}),
						success : function(result) {
							$("#review_div").html(result);
						},
						error : function(request, status, error) {
							alert("status : " + request.status + "\n"
									+ "message : " + request.responseText
									+ "\n" + "error : " + error);
						}
					});
					alert("수정이 완료되었습니다.");
				}
			});

	$(document).on("click", "#update_cancel", function() {
		$(".review_update_div").hide();
	});

	// 삭제 Jquery
	$(function() {
		$("#review_delete").click(function() {
			var dt_num = $(this).attr("data-num");
			$("#d_num").val(dt_num);

			var reviewDeleteFrom = $("[id='review_delete_from']").serialize(); // serialize 는 form 을 TEXT 문서화 로 바꿔주는것이다.

			if (confirm("정말 삭제하시겠습니까?")) {
				$.ajax({
					url : "/review/reviewDelete",
					type : "post",
					data : reviewDeleteFrom,
					success : function(result) {
						location.reload();
					}
				});
			}
		});
	});
</script>
<script type="text/javascript">
	$(function() {
		$(".page-item a").click(function(event) {
		event.preventDefault(); /* <a> 태그를 클릭해도 페이지 이동이 없도록 한것 */
        $.ajax({
            url : "/review/reviewlist",
            type : "post",
            headers : {
               "Content-Type" : "application/json",
               "X-HTTP-Method-Override" : "post"
            },
            dataType : "text",
            data : JSON.stringify({
            	 p_num : $("#actionForm").find("input[name='p_num']").val(),
    			 m_num : $("#actionForm").find("input[name='m_num']").val(),
               pageNum : $(this).attr("href"),
               amount : $("#actionForm").find("input[name='amount']").val()
            }),
            success : function(result) {
               $("#review_div").html(result);
            },
            error : function(result) {
               alert("진행중 오류가 발생했습니다.");
            }
         });
		});
	});
</script>
</head>
<body>
	<div id="review_container">
		<h1>Product Reviews</h1>
		<div id="insert_container">
			<div id="insert_text_button">
				<form id="insert_form" enctype="multipart/form-data">
					<input type="text" name="r_title" id="r_title" placeholder="리뷰제목"
						class="form-control"> <input type="hidden" name="r_writer"
						id="r_writer" value="${sessionScope.m_id}"> <input
						type="hidden" name="p_num" id="p_num" value="${p_num}">
					<textarea rows="7" cols="86" style="resize: none;" id="r_content"
						name="r_content" placeholder="리뷰내용" class="form-control"></textarea>
					<select id="r_score" name="r_score" class="form-control">
						<option value="1" id="select_option_one">★</option>
						<option value="2" id="select_option_two">★★</option>
						<option value="3" id="select_option_three">★★★</option>
						<option value="4" id="select_option_four">★★★★</option>
						<option value="5" id="select_option_five" selected="selected">★★★★★</option>
					</select> <input type="button" value="Regist" id="insert_button"
						class='btn btn-default'>
					<div id="insert_file_div">
						<!-- <label for="file">사진선택</label>
						<input type="file" id="file" name="file"> -->
					</div>
				</form>
			</div>
		</div>

		<div id="delete_container">
			<form id='review_delete_from'>
				<input id='d_num' type='hidden' name='r_num' />
			</form>
		</div>

		<br>
		<div id="score_container">
			<div id="score_avg">${score_avg}</div>
			<div id="score_list_box">
				<ul id="stage_score">
					<li id="score_five" class="score_li">
						<div id="score_text_five" class="score_text">5 Star</div>
						<div id="score_score_five" class="score_level">(${score_five})</div>
						<div class="score_gauge">
							<div id="score_gauge_five" style="width: ${avgFive}%"></div>
						</div>
					</li>
					<li id="score_four" class="score_li">
						<div id="score_text_four" class="score_text">4 Star</div>
						<div id="score_score_four" class="score_level">(${score_four})</div>
						<div class="score_gauge">
							<div id="score_gauge_four" style="width: ${avgFour}%"></div>
						</div>
					</li>
					<li id="score_three" class="score_li">
						<div id="score_text_three" class="score_text">3 Star</div>
						<div id="score_score_three" class="score_level">(${score_three})</div>
						<div class="score_gauge">
							<div id="score_gauge_three" style="width: ${avgThree}%"></div>
						</div>
					</li>
					<li id="score_two" class="score_li">
						<div id="score_text_two" class="score_text">2 Star</div>
						<div id="score_score_two" class="score_level">(${score_two})</div>
						<div class="score_gauge">
							<div id="score_gauge_two" style="width: ${avgTwo}%"></div>
						</div>
					</li>
					<li id="score_one" class="score_li">
						<div id="score_text_one" class="score_text">1 Star</div>
						<div id="score_score_one" class="score_level">(${score_one})</div>
						<div class="score_gauge">
							<div id="score_gauge_one" style="width: ${avgOne}%"></div>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<c:if test="${empty list}">
			<div id="review_null_area">
				<p>작성된 리뷰가 없습니다.</p>
			</div>
		</c:if>
		<c:forEach var="review_list" items="${list}">
			<div id="list_container">
				<div id="r_list">
					<input type="hidden" value="${review_list.r_num}" id="review_num"
						class="review_num_class"> <input type="hidden"
						value="${review_list.r_image}" id="review_image">
					<div id="review_score" class="review_li">
						<c:choose>
							<c:when test="${review_list.r_score == 5}">
								<span class="review_list_starImage"><img
									src="/resources/image/review/star5.png" width="90" height="20" /></span>
							</c:when>
							<c:when test="${review_list.r_score == 4}">
								<span class="review_list_starImage"><img
									src="/resources/image/review/star4.png" width="90" height="20" /></span>
							</c:when>
							<c:when test="${review_list.r_score == 3}">
								<span class="review_list_starImage"><img
									src="/resources/image/review/star3.png" width="90" height="20" /></span>
							</c:when>
							<c:when test="${review_list.r_score == 2}">
								<span class="review_list_starImage"><img
									src="/resources/image/review/star2.png" width="90" height="20" /></span>
							</c:when>
							<c:when test="${review_list.r_score == 1}">
								<span class="review_list_starImage"><img
									src="/resources/image/review/star1.png" width="90" height="20" /></span>
							</c:when>
						</c:choose>
					</div>
					<ul id=reviewlist>
						<li id="review_title" class="review_li">${review_list.r_title}</li>
						<li id="review_date" class="review_li">${review_list.r_date}</li>
						<li id="review_writer" class="review_li">${review_list.r_writer}</li>
					</ul>
					<div id="review_content" class="review_li">${review_list.r_content}</div>
					<c:if test="${review_list.r_writer == sessionScope.m_id}">
						<div id="review_buttons">
							<button id="review_update" data-num="${review_list.r_num}"
								class="btn btn-primary">Edit</button>
							<button id="review_delete" data-num="${review_list.r_num}"
								class="btn btn-default">Delete</button>
						</div>
					</c:if>
					<%-- <c:if test="${!empty review_list.r_image}">
						<div id="review_image" class="review_li">
							<img id="review_list_img" src="/uploadStorage/review/${review_list.r_image}" />
						</div>
					</c:if> --%>
					<c:if test="${review_list.r_writer == sessionScope.m_id}">
						<div class="review_update_div"></div>
						<div class="review_delete_div"></div>
					</c:if>
				</div>
			</div>
		</c:forEach>
		<div>
			<form id="actionForm" method="post">
			 	<input type="hidden" name="m_num" value="${reviewData.m_num}">
			 	<input type="hidden" name="p_num" value="${reviewData.p_num}">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			</form>
		</div>
		<nav aria-label="Page navigation example" id="paging_nav">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li class='page-item previouce' id="prev"><a class="page-link"
						href="${pageMaker.startPage - 1}" aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
					</a></li>
				</c:if>
				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li class='page-item ${pageMaker.cri.pageNum == num ? "active":""}'
						id="active"><a class="page-link" href="${num}">${num}</a></li>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<li class='page-item next' id="next"><a class="page-link"
						href="${pageMaker.endPage + 1}" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
					</a></li>
				</c:if>
			</ul>
		</nav>
		<!-- end Pagination -->
	</div>
</body>
</html>