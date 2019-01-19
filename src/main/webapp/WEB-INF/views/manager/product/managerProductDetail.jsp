<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/manager_productDetail.css">
<link rel="stylesheet" href="/resources/css/manager_main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#productOkBtn").click(function() {
			history.go(-1);
		});
		
		$("#productDeleteBtn").click(function() {
			var deleteConfirm = confirm("상품을 삭제하시겠습니까?");
			if (deleteConfirm) {
				$("#updateForm").find("input[name='up_price']").val(0);
				$("#updateForm").attr({
			          "method" : "POST",
			          "action" : "/manager/product/delete"
			    });
				 $("#updateForm").submit();
			} 
		});
		
		$("#editProductImageBtn").click(function() {
			$("#file").fadeToggle(1000);
			$("#file2").fadeToggle(1000);
			$("#file3").fadeToggle(1000);
			$("#file4").fadeToggle(1000);
			$("#file5").fadeToggle(1000);
		});
		
		$("#productEditBtn").click(function() {
		var editConfirm = confirm("상품을 수정하시겠습니까?");
		if (editConfirm) {
		       if($('#file').val()!=""){
		          if(!chkFile($('#file'))) return;
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
		       $("#updateForm").find("input[name='up_price']").val($("#price").val().split(",").join(""));
		       $("#updateForm").attr({
		          "method" : "POST",
		          "action" : "/manager/product/update"
		       });
		       $("#updateForm").submit();
		       }
		    });
		
		   function readURL(input) {

		       if (input.files && input.files[0]) {
		          var reader = new FileReader();

		          reader.onload = function(e) {
		             $('#productImage img').attr('src', e.target.result);
		          }

		          reader.readAsDataURL(input.files[0]);
		       }
		    }

		    $("#file").change(function() {
		       readURL(this);
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
</script>  
</head>
<body>
	<section id="datailWrapper">
	<span>Product Information</span>
		<form id="updateForm" name="updateForm" enctype="multipart/form-data">
			<div id="productImage">
			 <img alt="상품사진" src="/upload/product/${product.image1}">
			</div>
			<div id="productInformation">
				<div class="form-group">
					<label>상품번호</label> 
					<input type="text" class="form-control" id="p_num" name="up_num" value="${product.p_num}"
					readonly="readonly">
				</div>
				<div class="form-group">
					<label>상품명</label> 
					<input type="text" class="form-control" id="p_name" name="up_name" 
					value="${product.p_name}" readonly="readonly">
				</div>
				<div class="form-group">
					<label>카테고리1</label> 
					<select class="form-control" id="p_category" name="up_category">
					<c:choose>
					<c:when test="${product.p_category eq 'starbucks'}">
						<option value="${product.p_category}">${product.p_category}</option>
						<option value="coffeebean">coffeebean</option>
						<option value="kakaofriends">kakaofriends</option>
						<option value="locknlock">locknlock</option>
						<option value="stanley">stanley</option>
						<option value="mosh">mosh</option>
						<option value="kinto">kinto</option>
						<option value="corksicle">corksicle</option>
						<option value="thermos">thermos</option>
						<option value="bluebottle">bluebottle</option>
					</c:when>	
					<c:when test="${product.p_category eq 'coffeebean'}">
						<option value="${product.p_category}">${product.p_category}</option>
						<option value="starbucks">starbucks</option>
						<option value="kakaofriends">kakaofriends</option>
						<option value="locknlock">locknlock</option>
						<option value="stanley">stanley</option>
						<option value="mosh">mosh</option>
						<option value="kinto">kinto</option>
						<option value="corksicle">corksicle</option>
						<option value="thermos">thermos</option>
						<option value="bluebottle">bluebottle</option>
					</c:when>	
					<c:when test="${product.p_category eq 'kakaofriends'}">
						<option value="${product.p_category}">${product.p_category}</option>
						<option value="starbucks">starbucks</option>
						<option value="coffeebean">coffeebean</option>
						<option value="locknlock">locknlock</option>
						<option value="stanley">stanley</option>
						<option value="mosh">mosh</option>
						<option value="kinto">kinto</option>
						<option value="corksicle">corksicle</option>
						<option value="thermos">thermos</option>
						<option value="bluebottle">bluebottle</option>
					</c:when>	
					<c:when test="${product.p_category eq 'locknlock'}">
						<option value="${product.p_category}">${product.p_category}</option>
						<option value="starbucks">starbucks</option>
						<option value="coffeebean">coffeebean</option>
						<option value="kakaofriends">kakaofriends</option>
						<option value="stanley">stanley</option>
						<option value="mosh">mosh</option>
						<option value="kinto">kinto</option>
						<option value="corksicle">corksicle</option>
						<option value="thermos">thermos</option>
						<option value="bluebottle">bluebottle</option>
					</c:when>	
					<c:when test="${product.p_category eq 'stanley'}">
						<option value="${product.p_category}">${product.p_category}</option>
						<option value="starbucks">starbucks</option>
						<option value="coffeebean">coffeebean</option>
						<option value="kakaofriends">kakaofriends</option>
						<option value="locknlock">locknlock</option>
						<option value="mosh">mosh</option>
						<option value="kinto">kinto</option>
						<option value="corksicle">corksicle</option>
						<option value="thermos">thermos</option>
						<option value="bluebottle">bluebottle</option>
					</c:when>	
					<c:when test="${product.p_category eq 'mosh'}">
						<option value="${product.p_category}">${product.p_category}</option>
						<option value="starbucks">starbucks</option>
						<option value="coffeebean">coffeebean</option>
						<option value="kakaofriends">kakaofriends</option>
						<option value="locknlock">locknlock</option>
						<option value="stanley">stanley</option>
						<option value="kinto">kinto</option>
						<option value="corksicle">corksicle</option>
						<option value="thermos">thermos</option>
						<option value="bluebottle">bluebottle</option>
					</c:when>	
					<c:when test="${product.p_category eq 'kinto'}">
						<option value="${product.p_category}">${product.p_category}</option>
						<option value="starbucks">starbucks</option>
						<option value="coffeebean">coffeebean</option>
						<option value="kakaofriends">kakaofriends</option>
						<option value="locknlock">locknlock</option>
						<option value="stanley">stanley</option>
						<option value="mosh">mosh</option>
						<option value="corksicle">corksicle</option>
						<option value="thermos">thermos</option>
						<option value="bluebottle">bluebottle</option>
					</c:when>	
					<c:when test="${product.p_category eq 'corksicle'}">
						<option value="${product.p_category}">${product.p_category}</option>
						<option value="starbucks">starbucks</option>
						<option value="coffeebean">coffeebean</option>
						<option value="kakaofriends">kakaofriends</option>
						<option value="locknlock">locknlock</option>
						<option value="stanley">stanley</option>
						<option value="mosh">mosh</option>
						<option value="kinto">kinto</option>
						<option value="thermos">thermos</option>
						<option value="bluebottle">bluebottle</option>
					</c:when>	
					<c:when test="${product.p_category eq 'thermos'}">
						<option value="${product.p_category}">${product.p_category}</option>
						<option value="starbucks">starbucks</option>
						<option value="coffeebean">coffeebean</option>
						<option value="kakaofriends">kakaofriends</option>
						<option value="locknlock">locknlock</option>
						<option value="stanley">stanley</option>
						<option value="mosh">mosh</option>
						<option value="kinto">kinto</option>
						<option value="corksicle">corksicle</option>
						<option value="bluebottle">bluebottle</option>
					</c:when>	
					<c:when test="${product.p_category eq 'bluebottle'}">
						<option value="${product.p_category}">${product.p_category}</option>
						<option value="starbucks">starbucks</option>
						<option value="coffeebean">coffeebean</option>
						<option value="kakaofriends">kakaofriends</option>
						<option value="locknlock">locknlock</option>
						<option value="stanley">stanley</option>
						<option value="mosh">mosh</option>
						<option value="kinto">kinto</option>
						<option value="corksicle">corksicle</option>
						<option value="thermos">thermos</option>
					</c:when>	
					</c:choose>	
					</select>
				</div>
				<div class="form-group">
					<label>카테고리2</label> 
					<select class="form-control" name="up_sub_category">
					<c:choose>
					<c:when test="${product.p_sub_category eq '일반'}">
						<option value="${product.p_sub_category}">${product.p_sub_category}</option>
						<option value="손잡이">손잡이</option>
						<option value="빨대">빨대</option>
						<option value="물병">물병</option>
						<option value="보온">보온</option>
					</c:when>
					<c:when test="${product.p_sub_category eq '손잡이'}">
						<option value="${product.p_sub_category}">${product.p_sub_category}</option>
						<option value="일반">일반</option>
						<option value="빨대">빨대</option>
						<option value="물병">물병</option>
						<option value="보온">보온</option>
					</c:when>
					<c:when test="${product.p_sub_category eq '빨대'}">
						<option value="${product.p_sub_category}">${product.p_sub_category}</option>
						<option value="일반">일반</option>
						<option value="손잡이">손잡이</option>
						<option value="물병">물병</option>
						<option value="보온">보온</option>
					</c:when>
					<c:when test="${product.p_sub_category eq '물병'}">
						<option value="${product.p_sub_category}">${product.p_sub_category}</option>
						<option value="일반">일반</option>
						<option value="손잡이">손잡이</option>
						<option value="빨대">빨대</option>
						<option value="보온">보온</option>
					</c:when>
					<c:when test="${product.p_sub_category eq '보온'}">
						<option value="${product.p_sub_category}">${product.p_sub_category}</option>
						<option value="일반">일반</option>
						<option value="손잡이">손잡이</option>
						<option value="빨대">빨대</option>
						<option value="물병">물병</option>
					</c:when>
					</c:choose>
					</select>
				</div>
				<div class="form-group">
					<label>가격</label> 
					<input type="text" class="form-control" id="price"
					value="<fmt:formatNumber value="${product.p_price}" pattern="#,###,###"/>">
					<input type="hidden" name="up_price">
				</div>
				<div class="form-group">
					<label>재질</label> 
					<select class="form-control" name="up_material">
					<c:choose>
					<c:when test="${product.p_material eq 'plastic'}">
						<option value="${product.p_material}">${product.p_material}</option>
						<option value="stainless">stainless</option>
					</c:when>	
					<c:when test="${product.p_material eq 'stainless'}">
						<option value="${product.p_material}">${product.p_material}</option>
						<option value="plastic">plastic</option>
					</c:when>	
					</c:choose>	
					</select>
				</div>
				<div class="form-group">
					<label>컬러</label> 
					<select class="form-control" name="up_color">
					<c:choose>
					<c:when test="${empty product.p_color}">
						<option value="white">white</option>
						<option value="black">black</option>
						<option value="red">red</option>
						<option value="blue">blue</option>
						<option value="yellow">yellow</option>
						<option value="gray">gray</option>
						<option value="pink">pink</option>
						<option value="lightblue">lightblue</option>
					</c:when>
					<c:when test="${product.p_color eq 'white'}">
						<option value="${product.p_color}">${product.p_color}</option>
						<option value="black">black</option>
						<option value="red">red</option>
						<option value="blue">blue</option>
						<option value="yellow">yellow</option>
						<option value="gray">gray</option>
						<option value="pink">pink</option>
						<option value="lightblue">lightblue</option>
					</c:when>	
					<c:when test="${product.p_color eq 'black'}">
						<option value="${product.p_color}">${product.p_color}</option>
						<option value="white">white</option>
						<option value="red">red</option>
						<option value="blue">blue</option>
						<option value="yellow">yellow</option>
						<option value="gray">gray</option>
						<option value="pink">pink</option>
						<option value="lightblue">lightblue</option>
					</c:when>	
					<c:when test="${product.p_color eq 'red'}">
						<option value="${product.p_color}">${product.p_color}</option>
						<option value="white">white</option>
						<option value="black">black</option>
						<option value="blue">blue</option>
						<option value="yellow">yellow</option>
						<option value="gray">gray</option>
						<option value="pink">pink</option>
						<option value="lightblue">lightblue</option>
					</c:when>	
					<c:when test="${product.p_color eq 'blue'}">
						<option value="${product.p_color}">${product.p_color}</option>
						<option value="white">white</option>
						<option value="black">black</option>
						<option value="red">red</option>
						<option value="yellow">yellow</option>
						<option value="gray">gray</option>
						<option value="pink">pink</option>
						<option value="lightblue">lightblue</option>
					</c:when>	
					<c:when test="${product.p_color eq 'yellow'}">
						<option value="${product.p_color}">${product.p_color}</option>
						<option value="white">white</option>
						<option value="black">black</option>
						<option value="red">red</option>
						<option value="blue">blue</option>
						<option value="gray">gray</option>
						<option value="pink">pink</option>
						<option value="lightblue">lightblue</option>
					</c:when>	
					<c:when test="${product.p_color eq 'gray'}">
						<option value="${product.p_color}">${product.p_color}</option>
						<option value="white">white</option>
						<option value="black">black</option>
						<option value="red">red</option>
						<option value="blue">blue</option>
						<option value="yellow">yellow</option>
						<option value="pink">pink</option>
						<option value="lightblue">lightblue</option>
					</c:when>	
					<c:when test="${product.p_color eq 'pink'}">
						<option value="${product.p_color}">${product.p_color}</option>
						<option value="white">white</option>
						<option value="black">black</option>
						<option value="red">red</option>
						<option value="blue">blue</option>
						<option value="yellow">yellow</option>
						<option value="gray">gray</option>
						<option value="lightblue">lightblue</option>
					</c:when>	
					<c:when test="${product.p_color eq 'lightblue'}">
						<option value="${product.p_color}">${product.p_color}</option>
						<option value="white">white</option>
						<option value="black">black</option>
						<option value="red">red</option>
						<option value="blue">blue</option>
						<option value="yellow">yellow</option>
						<option value="gray">gray</option>
						<option value="pink">pink</option>
					</c:when>	
					</c:choose>	
					</select>
				</div>
				<div class="form-group">
					<label>용량</label> 
					<input type="text" class="form-control" value="${product.p_capacity}" name="up_capacity">
				</div>
				<div class="form-group">
					<label>열온도</label> 
					<input type="text" class="form-control" value="${product.p_temperature}" name="up_temperature">
				</div>

				<div class="form-group">
					<label>제조국</label> 
					<input type="text" class="form-control" value="${product.p_country}" name="up_country">
				</div>
				<div class="form-group">
					<label>재고</label> 
					<input type="text" class="form-control" value="${product.p_stock}" name="up_stock">
				</div>
				<div class="form-group">
					<label>상품상태</label>
					<select class="form-control" name="up_state">
					<c:choose>
					<c:when test="${product.p_state eq '일반상품'}">
						<option value="${product.p_state}">${product.p_state}</option>
						<option value="품절상품">품절상품</option>
						<option value="단종상품">단종상품</option>
					</c:when>	
					<c:when test="${product.p_state eq '품절상품'}">
						<option value="${product.p_state}">${product.p_state}</option>
						<option value="일반상품">일반상품</option>
						<option value="단종상품">단종상품</option>
					</c:when>	
					<c:when test="${product.p_state eq '단종상품'}">
						<option value="${product.p_state}">${product.p_state}</option>
						<option value="일반상품">일반상품</option>
						<option value="품절상품">품절상품</option>
					</c:when>	
					</c:choose>	
					</select>
				</div>
			</div>
			<div id="productInformation2">
				<div class="form-group">
					<label>누적판매량</label> 
					<input type="text" class="form-control" readonly="readonly"
					value='<fmt:formatNumber value="${product.p_sales_volume}" pattern="#,###,###"/>' name="up_sales_volume">
				</div>
				<div class="form-group">
					<label>평점</label> 
					<input type="text" class="form-control" value="${product.p_grade}" readonly="readonly" name="up_grade">
				</div>
				<div class="form-group">
					<label>등록일</label> 
					<input type="text" class="form-control" readonly="readonly" value="${product.p_date}" name="up_date">
				</div>
				<div class="form-group">
				<br>
					<button type="button" class="btn btn-primary" id="editProductImageBtn">상품 사진 변경</button>
					<input type="file" id="file" name="ufile1" onchange="readURL(this);">
					<input type="file" id="file2" name="ufile2">
					<input type="file" id="file3" name="ufile3">
					<input type="file" id="file4" name="ufile4">
					<input type="file" id="file5" name="ufile5">
					<input type="hidden" name="ui_num" value="${product.i_num}">
					<input type="hidden" name="uimage1" value="${product.image1}">
					<input type="hidden" name="uimage2" value="${product.image2}">
					<input type="hidden" name="uimage3" value="${product.image3}">
					<input type="hidden" name="uimage4" value="${product.image4}">
					<input type="hidden" name="uimage5" value="${product.image5}">
				</div>
			</div>
			<div id="detailButtons">
				<button type="button" class="btn btn-primary" id="productOkBtn">확인</button>
				<button type="button" class="btn btn-default" id="productEditBtn">수정</button>
				<button type="button" class="btn btn-default" id="productDeleteBtn">삭제</button>
			</div>
		</form>
	</section>
</body>
</html>