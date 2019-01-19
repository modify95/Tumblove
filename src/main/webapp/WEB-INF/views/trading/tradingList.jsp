<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문</title>
<link rel="stylesheet" href="/resources/css/trading/trading.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
</head>
<body class="trading">
   <div id="container" class="trading">
      <div class="order_sc">
         <div class="order_content">
            <form method="post" id="formTrading">
               <div class="product_area">
                  <table class="tb_products">
                     <colgroup>
                        <col width="500">
                        <col width="120">
                        <col width="90">
                        <col width="110">
                        <col>
                     </colgroup>
                     <thead>
                        <tr>
                           <th>상품정보</th>
                           <th>배송비</th>
                           <th>수량</th>
                           <th>상품금액</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:choose>
                           <c:when test="${not empty orderList}">
                              <input type="hidden" name="url" value="cart" id="url">
                              <c:forEach var="orderList" items="${orderList}">
                                 <tr>
                                    <td class="p_num_info" data-p_num="${orderList.p_num}">
                                       <div class="product_info">
                                          <a href="http://localhost:8080/product/productDetail?p_num=${orderList.p_num}" target="_blank" class="product_thmb">
                                             <img alt="${orderList.p_name}" src="/upload/product/${oderList.image1}" width="auto" height="92px">
                                          </a>
                                          <div class="product_dsc">
                                             <a href="http://localhost:8080/product/productDetail?p_num=${orderList.p_num}" target="_blank" class="product_name">
                                                <strong>${orderList.p_name}</strong>
                                             </a>
                                          </div>
                                       </div>
                                    </td>
                                    <td>
                                       <span> <fmt:formatNumber value="3000" pattern="#,###" /> 원
                                       </span>
                                    </td>
                                    <td class="o_amount_info" data-o_amount="${orderList.c_amount}">${orderList.c_amount}개</td>
                                    <td>
                                       <strong><em><fmt:formatNumber value="${orderList.p_price * orderList.c_amount}" pattern="#,###" /></em>원</strong>
                                    </td>
                                 </tr>
                                 <c:set var="totalProPrice" value="${totalProPrice + (orderList.p_price * orderList.c_amount)}" />
                                 <c:set var="totalDelPrice" value="${totalDelPrice + 3000}" />
                              </c:forEach>
                           </c:when>
                           <c:otherwise>
                              <input type="hidden" name="url" value="detail" id="url">
                              <tr>
                                 <td data-p_num="${order.p_num}">
                                    <div class="product_info">
                                       <a href="http://localhost:8080/product/productDetail?p_num=${order.p_num}" target="_blank" class="product_thmb">
                                          <img alt="${order.p_name}" src="/upload/product/${order.image1}" width="auto" height="92px">
                                       </a>
                                       <div class="product_dsc">
                                          <a href="http://localhost:8080/product/productDetail?p_num=${order.p_num}" target="_blank" class="product_name">
                                             <strong>${order.p_name}</strong>
                                          </a>
                                       </div>
                                    </div>
                                 </td>
                                 <td>
                                    <span> <fmt:formatNumber value="3000" pattern="#,###" /> 원
                                    </span>
                                 </td>
                                 <td data-o_amount="${amount}">${amount}개</td>
                                 <td>
                                    <strong><em><fmt:formatNumber value="${order.p_price * amount}" pattern="#,###" /></em>원 </strong>
                                 </td>
                              </tr>
                              <c:set var="totalProPrice" value="${totalProPrice + (order.p_price * amount)}" />
                              <c:set var="totalDelPrice" value="${totalDelPrice + 3000}" />
                           </c:otherwise>
                        </c:choose>
                     </tbody>
                  </table>
               </div>
               <div class="destination_wrap">
                  <div class="deliver_wrap">
                     <h4><b>받는사람 정보</b></h4>
                     <div class="deliver_option_wrap">
                        <strong>배송지선택</strong>
                        <div class="deliver_option">
                           <input type="radio" name="delivery" id="deliveryBase" checked="checked">
                           <label for="deliveryBase">기본 배송지</label>
                           <input type="radio" name="delivery" id="deliveryNew">
                           <label for="deliveryNew">신규 배송지</label>
                        </div>
                     </div>
                     <div id="deliveryBaseInfo">
                        <ul class="addr_list">
                           <li>
                              <strong>${memberInfo.m_name}</strong>
                              <input type="hidden" id="t_recipient" value="${memberInfo.m_name}" name="t_recipient" class="baseInfo">
                           </li>
                           <li>
                              <strong> ${memberInfo.m_phone}</strong>
                              <input type="hidden" id="t_phone" name="t_phone" class="baseInfo" value="${memberInfo.m_phone}">
                           </li>
                           <li>
                              <strong>${memberInfo.m_address}</strong>
                              <input type="hidden" name="t_address" class="baseInfo" value="${memberInfo.m_address}">
                           </li>
                        </ul>
                     </div>
                     <div id="deliveryNewInfo" style="display: none;">
                        <div class="deliver_option_wrap">
                           <strong>수령인</strong>
                           <div class="deliver_option">
                              <input type="text" name="t_recipient" class="newInfo" disabled="disabled">
                           </div>
                        </div>
                        <div class="deliver_option_wrap">
                           <strong>휴대전화</strong>
                           <div class="deliver_option">
                              <input type="text" name="t_phone" class="newInfo" disabled="disabled">
                           </div>
                        </div>
                        <div class="deliver_option_wrap">
                           <strong>배송지 주소</strong>
                           <div class="deliver_option">
                              <div id="deliveryAddress">
                                 <input type="text" id="postcode" placeholder="우편번호">
                                 <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                                 <br>
                                 <input type="text" id="address" placeholder="주소">
                                 <br>
                                 <input type="text" id="detailAddress" placeholder="상세주소">
                                 <input type="text" id="extraAddress" placeholder="참고항목">
                                 <input type="hidden" name="t_address" id="t_address" class="newInfo" disabled="disabled">
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="deliver_option_wrap">
                        <strong>배송 메모</strong>
                        <input type="text" name="t_memo" id="t_memo">
                     </div>
                  </div>
                  <div class="userinfo_wrap">
                     <h4><b>주문자 정보</b></h4>
                     <ul class="user_info">
                        <li>${memberInfo.m_name}</li>
                        <li>${memberInfo.m_phone}</li>
                        <li>${memberInfo.m_mail}</li>
                     </ul>
                  </div>
               </div>
               <div class="discount_wrap">
                  <h4><b>결제정보</b></h4>
                  <div>
                     <input type="radio" name="t_payment_option" id="nonBankbook" class="paymentMode" value="bank">
                     <label for="nonBankbook">무통장입금</label>
                     <input type="radio" name="t_payment_option" id="creditcart" class="paymentMode" value="card">
                     <label for="creditcart">신용카드</label>
                     <div id="receipt" style="display: none;">
                        <label for="t_receipt">현금영수증 발행</label>
                        <input type="checkbox" id="t_receipt" name="t_receipt" value="1">
                     </div>
                  </div>
                  <div>
                     <label for="useMileage">마일리지 사용 : </label>
                     <input type="text" id="useMileage">
                     <button type="button" id="btnUseAll" class="btn btn-default">전액사용</button>
                  </div>
                  <div>
                     <span> (보유 마일리지 : <strong><fmt:formatNumber value="${memberInfo.m_mileage}" pattern="#,###" /></strong>원)
                     </span>
                  </div>
                  <div>
                     <div class="price_sum">
                        <h4><b>결제금액</b></h4>
                        <c:set var="totalPrice" value="${totalProPrice + totalDelPrice}"></c:set>
                        <div class="sum">
                           <strong class="totalPrice"><fmt:formatNumber value="${totalPrice}" pattern="#,###" /></strong>원
                        </div>
                        <ul>
                           <li>
                              총 상품금액 <span> <em><fmt:formatNumber value="${totalProPrice}" pattern="#,###" /></em>원
                              </span>
                           </li>
                           <li>
                              배송비 <span> (+) <em><fmt:formatNumber value="${totalDelPrice}" pattern="#,###" /></em>원
                              </span>
                           </li>
                           <li>
                              포인트 사용금액 <span> (-) <em class="useMileaged">0</em>원
                              </span>
                           </li>
                        </ul>
                     </div>
                  </div>
               </div>
               <div class="emailAgreement">
                  <input type="checkbox" value="1" name="t_mail_agreement" id="t_mail_agreement">
                  <label for="t_mail_agreement">이메일 수신 동의</label>
               </div>
               <div class="payment_agree_wrap">
                  <button type="button" id="btnPayment">결제하기</button>
               </div>
               <c:choose>
                  <c:when test="${memberInfo.m_grade == 'bronze'}">
                     <c:set var="persent" value="0.007" />
                  </c:when>
                  <c:when test="${memberInfo.m_grade == 'gold'}">
                     <c:set var="persent" value="0.012" />
                  </c:when>
                  <c:when test="${memberInfo.m_grade == 'platinum'}">
                     <c:set var="persent" value="0.015" />
                  </c:when>
                  <c:when test="${memberInfo.m_grade == 'vip'}">
                     <c:set var="persent" value="0.02" />
                  </c:when>
               </c:choose>
               <fmt:parseNumber var="mileage" integerOnly="true" value="${totalProPrice * persent}" />
               <input type="hidden" name="t_price" id="t_price" value="${totalPrice}">
               <input type="hidden" name="t_mileage" id="t_mileage" value="${mileage}">
               <input type="hidden" name="m_mileage" id="m_mileage" value="0">
               <input type="hidden" name="t_delivery_charge" id="t_delivery_charge" value="${totalDelPrice}">
               <input type="hidden" name="t_depositor" id="t_depositor">
               <input type="hidden" name="t_bank" id="t_bank">
               <input type="hidden" name="pnumlist[]" id="pnumlist">
               <input type="hidden" name="amountlist[]" id="amountlist">
               <input type="hidden" name="cnumlist[]" id="cnumlist" value="${param.clist}">
            </form>
         </div>
      </div>
   </div>
   <form id="paymentInfo" method="post">
      <input type="hidden" id="price" name="price" value="${totalPrice}">
      <input type="hidden" id="mode" name="mode" value="">
   </form>
   <script type="text/javascript">
      $(function() {
         $("#postcode").blur(function() {
            checkAddress();
         });

         $("#address").blur(function() {
            checkAddress();
         });

         $("#detailAddress").blur(function() {
            checkAddress();
         });

         $("#extraAddress").blur(function() {
            checkAddress();
         });

         $("#deliveryBase").change(function() {
            infoReset();
            $("#deliveryNewInfo").hide();
            $("#deliveryBaseInfo").show();
            $(".baseInfo").prop("disabled", false);
            $(".newInfo").prop("disabled", true);
         });

         $("#deliveryNew").change(function() {
            infoReset();
            $("#deliveryBaseInfo").hide();
            $("#deliveryNewInfo").show();
            $(".baseInfo").prop("disabled", true);
            $(".newInfo").prop("disabled", false);
         });

         $("#btnPayment").click(
               function() {
                  if (!paymentCheck()) {
                     alert("결제 방식을 선택해주세요.");
                     return false;
                  }

                  if (!checkAddress()) {
                     alert("주소를 입력해주세요.");
                     return false;
                  }

                  if (!checkName()) {
                     alert("수령인을 입력해주세요.");
                     return false;
                  }

                  if (!checkPhone()) {
                     alert("휴대전화를 입력해주세요.");
                     return false;
                  }

                  order_trading();
                  window.open("about:blank", "paymentpop",
                        "status=no,menubar=no,width=490,height=500");
                  $("#paymentInfo").attr("action", "/trading/payment");
                  $("#paymentInfo").attr("target", "paymentpop");
                  $("#paymentInfo").submit();
               });

         $(".paymentMode").change(function() {
            var mode = $(this).val();
            $("#mode").val(mode);

            if (mode == "bank") {
               $("#receipt").show();
            } else {
               $("#receipt").hide();
            }
         });

         $("#useMileage").keyup(function() {
            var mileage = Number($("#useMileage").val());
            var totalPrice = '${totalPrice}' - mileage;
            var maxMileage = '${memberInfo.m_mileage}';

            if (mileage > maxMileage) {
               alert("보유 금액 이상 사용은 불가능 합니다.");
               mileage = maxMileage;
               totalPrice = '${totalPrice}' - mileage;
               $("#useMileage").val(mileage);
            }

            if (mileage == "") {
               $("#useMileage").val("0");
               mileage = 0;
            }

            $(".useMileaged").html(mileage);
            $(".totalPrice").html(totalPrice);

            $("#price").val(totalPrice);
            $("#t_price").val(totalPrice);
            $("#m_mileage").val(mileage);
         }).click(function() {
            var mileage = Number($("#useMileage").val());

            if (mileage == 0) {
               $("#useMileage").val("0");
            }
         });

         $("#btnUseAll").click(function() {
            var maxMileage = '${memberInfo.m_mileage}';
            var totalPrice = '${totalPrice}' - maxMileage;

            $("#useMileage").val(maxMileage);
            $(".useMileaged").html(maxMileage);
            $(".totalPrice").html(totalPrice);

            $("#price").val(totalPrice).replaceAll(",","");
            $("#t_price").val(totalPrice).replaceAll(",","");
            $("#m_mileage").val(maxMileage).replaceAll(",","");
         });
      });

      function paymentCheck() {
         var check = $("input:radio[name='t_payment_option']")
               .is(":checked");

         if (!check) {
            return false;
         }

         return true;
      }

      function infoReset() {
         $("#t_recipient").val("");
         $("#t_phone").val("");
         $("#postcode").val("");
         $("#address").val("");
         $("#detailAddress").val("");
         $("#extraAddress").val("");
      }

      function checkAddress() {
         var postcode = $("#postcode").val();
         var address = $("#address").val();
         var detailAddress = $("#detailAddress").val();
         var extraAddress = $("#extraAddress").val();
         var check = $("input:radio[id='deliveryNew']").is(":checked");

         if (check) {
            if (postcode == "" || address == "") {
               return false;
            }
         }

         var finalAddress = "(" + postcode + ")" + address + detailAddress
               + extraAddress;

         $("#t_address").val(finalAddress);

         return true;
      }

      function order_trading() {
         var num = [];
         var amount = [];

         $(".p_num_info").each(function() {
            num.push($(this).data("p_num"));
         });

         $(".o_amount_info").each(function() {
            amount.push($(this).data("o_amount"));
         });

         $("#pnumlist").val(num);
         $("#amountlist").val(amount);
      }

      function checkName() {
         var name = $("#t_recipient").val();

         if (name == "") {
            return false;
         }

         return true;
      }

      function checkPhone() {
         var phone = $("#t_phone").val();

         if (phone == "") {
            return false;
         }

         return true;
      }
   </script>
   <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   <script>
      function sample6_execDaumPostcode() {
         new daum.Postcode(
               {
                  oncomplete : function(data) {
                     // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                     // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                     // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                     var addr = ''; // 주소 변수
                     var extraAddr = ''; // 참고항목 변수

                     //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                     if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                     } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                     }

                     // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                     if (data.userSelectedType === 'R') {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== ''
                              && /[동|로|가]$/g.test(data.bname)) {
                           extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== ''
                              && data.apartment === 'Y') {
                           extraAddr += (extraAddr !== '' ? ', '
                                 + data.buildingName
                                 : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== '') {
                           extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("extraAddress").value = extraAddr;

                     } else {
                        document.getElementById("extraAddress").value = '';
                     }

                     // 우편번호와 주소 정보를 해당 필드에 넣는다.
                     document.getElementById('postcode').value = data.zonecode;
                     document.getElementById("address").value = addr;
                     // 커서를 상세주소 필드로 이동한다.
                     document.getElementById("detailAddress").focus();
                  }
               }).open();
      }
   </script>
</body>
</html>