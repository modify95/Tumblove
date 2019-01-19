<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리 - 상품리스트</title>
<link rel="stylesheet" href="/resources/css/client_main.css">
<link rel="stylesheet" href="/resources/css/manager_productList.css">
<link rel="stylesheet" href="/resources/css/manager_main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var actionForm = $("#actionForm");
		$(".page-item a").on("click", function(e) {
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
		});
		
		var searchForm = $("#searchForm");
		$("#search_button").click(function() {
		var keyword = $("#search_product_material_input").val();
		var p_category = $("#search_option_category").val();
		var p_material = $("#search_option_material").val();
		var p_sub_category = "";
		$(".check").each(function() {
		if ($(this).is(":checked")) {p_sub_category += $(this).val()+ "";}
		});
		searchForm.find("input[name='p_category']").val(p_category);
		searchForm.find("input[name='p_sub_category']").val(p_sub_category);
		searchForm.find("input[name='p_material']").val(p_material);
		searchForm.find("input[name='keyword']").val(keyword);
		searchForm.submit();
		});
		
		var detailForm = $("#detailForm");
		$(".goDetail").on("click", function(e){
			e.preventDefault();
			detailForm.find("input[name='p_num']").val($(this).attr("data-num"));
			detailForm.submit();
		});

    $("#productInsertBtn").click(function() {
       if($('#file').val()!=""){
          if(!chkFile($('#file'))) return;
       } else {
    	   alert("상품의 사진을 등록하십시오.");
    	   return false;
       }
       if($('#file2').val()!=""){
          if(!chkFile($('#file2'))) return;
       }
       if($('#file3').val()!=""){
          if(!chkFile($('#file3'))) return;
       }
       if($('#file4').val()!=""){
          if(!chkFile($('#file4'))) return;
       }
       if($('#file5').val()!=""){
          if(!chkFile($('#file5'))) return;
       }
       $("#insertForm").attr({
          "method" : "POST",
          "action" : "/manager/product/productInsert"
       });
      
       $("#insertForm").submit();
    });
    function readURL(input) {

       if (input.files && input.files[0]) {
          var reader = new FileReader();

          reader.onload = function(e) {
             $('#image_section').attr('src', e.target.result);
          }

          reader.readAsDataURL(input.files[0]);
       }
    }

    $("#file").change(function() {
       readURL(this);
    });
    
    $("#fileadd").click(function(){
       $("#file2").fadeToggle();
       $("#file3").fadeToggle();
       $("#file4").fadeToggle();
       $("#file5").fadeToggle();
    });

 });
 function chkFile(item){
    var ext = item.val().split('.').pop().toLowerCase();
    if(jQuery.inArray(ext, ['gif','png','jpg','jpeg']) == -1) {
       alert('gif, png, jpg, jpeg 파일만 업로드 할수 있습니다.');
       return false;
    }else {
       return true;
    }
 }
 
/*  var num = "{}[]()<>?_|!'!@#$%^&*=+\"\\/";
 var check_val = "";
 for (var i=0; i < strFileName.length; i++) {
	 if (-1 != num.indextOf(strFileName.charAt(i))) check_val = "special";
 }
 if (check_val == "special") {
	 alert("파일명에 특수문자는 입력하실 수 없습니다.");
	 return false;
 } */
</script>
</head>
<body>
	<c:choose>
		<c:when test="${empty productList }">
			<div id="product_list_wrapper">
				<br><span id="product_label_span">Product List</span>
				<div id="manager_search_product">
					<div id="checkbox_div">
					<input type="checkbox" id="p_sub_category01" name="p_sub_category"
						checked="checked" value="일반" class="check"> 
					<label for="p_sub_category01">일반</label> 
					<input type="checkbox" id="p_sub_category02" name="p_sub_category" value="손잡이" class="check"> 
					<label for="p_sub_category02">손잡이</label> 
					<input type="checkbox" id="p_sub_category03" name="p_sub_category" value="빨대" class="check"> 
					<label for="p_sub_category03">빨대</label>
					<input type="checkbox" id="p_sub_category04" name="p_sub_category" value="물병" class="check"> 
					<label for="p_sub_category04">물병</label>
					<input type="checkbox" id="p_sub_category05" name="p_sub_category" value="보온" class="check"> 
					<label for="p_sub_category05">보온</label>	
					</div>
					<select id="search_option_category" name="p_category">
						<option value="starbucks">Starbucks</option>
						<option value="coffeebean">Coffee Been</option>
						<option value="locknlock">Lock&Lock</option>
						<option value="kakaofriends">Kakao Friends</option>
						<option value="staley">Stanley</option>
						<option value="mosh">Mosh</option>
						<option value="kinto">Kinto</option>
						<option value="corksicle">Corksicle</option>
						<option value="theroms">Thermos</option>
						<option value="bluebottl">Blue Bottle</option>
					</select> 	
					<select id="search_option_material" name="p_material">
						<option value="plastic">플라스틱</option>
						<option value="stainless">스테인레스</option>
					</select> 
					<input type="text" class="form-control" placeholder="Product Name" id="search_product_material_input">
					<button type="button" id="search_button" class="btn btn-default">Search</button>
					<button type="button" id="register_button" class="btn btn-primary"
					data-toggle="modal"  data-target="#productInsert" data-whatever="@mdo">Register</button>
					<form id="searchForm" action="/manager/product/search" method="get">
						<input type="hidden" name="p_category"> 
						<input type='hidden' name='p_sub_category'> 
						<input type='hidden' name='p_material'> 
						<input type='hidden' name='keyword'>
					</form>
				</div>
			</div>		
			<div id="list_null_div">등록된 상품이 없습니다.</div>
		</c:when>
		<c:when test="${!empty productList }">
			<div id="product_list_wrapper">
				<br><span id="product_label_span">Product List</span>
				<div id="manager_search_product">
					<div id="checkbox_div">
					<input type="checkbox" id="p_sub_category01" name="p_sub_category"
						checked="checked" value="일반" class="check"> 
					<label for="p_sub_category01">일반</label> 
					<input type="checkbox" id="p_sub_category02" name="p_sub_category" value="손잡이" class="check"> 
					<label for="p_sub_category02">손잡이</label> 
					<input type="checkbox" id="p_sub_category03" name="p_sub_category" value="빨대" class="check"> 
					<label for="p_sub_category03">빨대</label>
					<input type="checkbox" id="p_sub_category04" name="p_sub_category" value="물병" class="check"> 
					<label for="p_sub_category04">물병</label>
					<input type="checkbox" id="p_sub_category05" name="p_sub_category" value="보온" class="check"> 
					<label for="p_sub_category05">보온</label>	
					</div>
					<select id="search_option_category" name="p_category">
						<option value="starbucks">Starbucks</option>
						<option value="coffeebean">Coffee Been</option>
						<option value="locknlock">Lock&Lock</option>
						<option value="kakaofriends">Kakao Friends</option>
						<option value="staley">Stanley</option>
						<option value="mosh">Mosh</option>
						<option value="kinto">Kinto</option>
						<option value="corksicle">Corksicle</option>
						<option value="theroms">Thermos</option>
						<option value="bluebottl">Blue Bottle</option>
					</select> 	
					<select id="search_option_material" name="p_material">
						<option value="plastic">플라스틱</option>
						<option value="stainless">스테인레스</option>
					</select> 
					<input type="text" class="form-control" placeholder="Product Name" id="search_product_material_input">
					<button type="button" id="search_button" class="btn btn-default">Search</button>
					<button type="button" id="register_button" class="btn btn-primary"
					data-toggle="modal"  data-target="#productInsert" data-whatever="@mdo">Register</button>
					<form id="searchForm" action="/manager/product/search" method="get">
						<input type="hidden" name="p_category"> 
						<input type='hidden' name='p_sub_category'> 
						<input type='hidden' name='p_material'> 
						<input type='hidden' name='keyword'>
					</form>
				</div>
				<br>
				<c:forEach items="${productList}" var="product">
					<form id="actionForm" action="/manager/product/productList" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> 
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
					</form>
					<ul id="product_list">
						<li id="product1_4x4">
						<a class="goDetail" href="/manager/product/detail" data-num="${product.p_num}">
						<form id="detailForm" name="detailForm" action="/manager/product/detail">
							<input type="hidden" name="p_num">
				   	    </form>
							<div id="thumbnail_area">
								<div id="thumbnail_image">
									<!-- <a id="goDetail" href="/manager/product/detail" target="_blank">  -->
									<img alt="상품사진" src="/upload/product/${product.image1}">
								</div>
								<div id="thumbnail_text">${product.p_name} 
								<strong>
								<fmt:formatNumber value=" ${product.p_price}" pattern="#,###,###" />원
								</strong>
								</div>
							</div><!-- </a> -->
						</a>	
						</li>
					</ul>
				</c:forEach>
			</div>
			<br>
			<nav aria-label="Page navigation example" id="paging_nav">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li class='page-item previouce' id="prev"><a
							class="page-link" href="${pageMaker.startPage - 1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								<span class="sr-only">Previous</span>
						</a></li>
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
								aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
						</a></li>
					</c:if>
				</ul>
			</nav>
		</c:when>
	</c:choose>

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
                  <form id="insertForm" name="insertForm"
                     enctype="multipart/form-data">
                     <div class="modal-body2">
                        <div class="imageView">
                           <img id="image_section" class="img-thumbnail" />
                              
                        </div>
                        <div class="filebox">
                           <label for="file" id="fileLabel" class="btn btn-primary">업로드</label>
                           <input type="file" name="file" id="file"
                              onchange="readURL(this);" class="btn btn-primary">
                           <input type="button" id="fileadd" name="fileadd"  class="btn btn-default" value="추가업로드"/>
                           <input type="file" name="file2" id="file2"> 
                           <input type="file" name="file3" id="file3"> 
                           <input type="file" name="file4" id="file4"> 
                           <input type="file" name="file5" id="file5">
                        </div>
                     </div>

                     <div class="form-group">
                        <label for="p_name" class="control-label">상품명</label> <input
                           type="text" name="p_name" id="p_name" class="form-control">
                     </div>
                     <div class="form-group">
                        <label for="p_material" class="control-label">재질</label> <select
                           name="p_material" id="p_material" class="form-control">
                           <option value="plastic">Plastic</option>
                           <option value="stainless">Stainless</option>
                        </select>
                     </div>
                     <div class="form-group">
                        <label for="p_category" class="control-label">카테고리</label> <select
                           name="p_category" id="p_category" class="form-control">
                           <option value="starbucks">starbucks</option>
                           <option value="coffeebean">coffeebean</option>
						   <option value="kakaofriends">kakaofriends</option>
						   <option value="locknlock">locknlock</option>
						   <option value="stanley">stanley</option>
						   <option value="mosh">mosh</option>
						   <option value="kinto">kinto</option>
						   <option value="corksicle">corksicle</option>
						   <option value="thermos">thermos</option>
						   <option value="bluebottle">bluebottle</option>
                        </select>
                     </div>

                     <div class="form-group">
                        <label for="p_sub_category" class="control-label">하위카테고리</label>
                        <select name="p_sub_category" id="p_sub_category"
                           class="form-control">
                           <option value="일반">일반</option>
                           <option value="손잡이">손잡이</option>
                           <option value="빨대">빨대</option>
                           <option value="물병">물병</option>
                           <option value="보온">보온</option>
                        </select>

                     </div>
                     <div class="form-group">
                        <label for="p_price" class="control-label">가격</label> <input
                           type="text" name="p_price" id="p_price" class="form-control">
                     </div>
                     <div class="form-group">
                        <label for="p_temperature" class="control-label">열온도</label> <input
                           type="text" name="p_temperature" id="p_temperature"
                           class="form-control">
                     </div>
                     <div class="form-group">
                        <label for="p_stock" class="control-label">재고</label> <input
                           type="text" name="p_stock" id="p_stock" class="form-control">
                     </div>
                     <div class="form-group">
                        <label for="p_capacity" class="control-label">용량</label> <input
                           type="text" name="p_capacity" id="p_capacity"
                           class="form-control">
                     </div>
                     <div class="form-group">
                        <label for="p_country" class="control-label">제조국</label> <input
                           type="text" name="p_country" id="p_country"
                           class="form-control">
                     </div>
                     <div class="form-group">
                        <label for="p_color" class="control-label">색상</label> <select
                           name="p_color" id="p_color" class="form-control">
                           <option value="white">White</option>
                           <option value="black">Black</option>
                           <option value="red">Red</option>
                           <option value="blue">Blue</option>
                           <option value="green">Green</option>
                           <option value="yellow">Yellow</option>
                           <option value="gray">Gray</option>
                           <option value="pink">Pink</option>
                           <option value="lightblue">Light Blue</option>
                        </select>

                     </div>
                  </form>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-primary"
                     id="productInsertBtn">상품 등록</button>
                  <button type="button" class="btn btn-default" data-dismiss="modal"
                     id="cancle">닫기</button>          
               </div>
            </div>
         </div>
      </div>
   </div>	
</body>
</html>

