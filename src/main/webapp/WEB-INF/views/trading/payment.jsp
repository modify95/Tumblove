<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
button {
	height: 24px;
	width: 80px;
	padding-top: 3.4px;
}
.btn {
	padding-top: 3px;
}
.form-control {
	display: inline;
	height: 24px;
	width: 100px;
	padding: 3px;
}
.paymentContainer {
	width: 55%;
	margin: 0px auto;
}
#cardnum {
	width: 180px;
}
table tr td:first-child {
	padding-right: 10px;
}
#buttons {
	width: 188px;
	margin: 10px auto;
}
</style>
<meta charset="UTF-8">
<title>결제하기</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
</head>
<body>
   <div id="container" class="paymentContainer">
      <div>
         <table>
            <c:choose>
               <c:when test="${mode == 'card'}">
                  <tr>
                     <td>
                        <label for="name">이름</label>
                     </td>
                     <td>
                        <input type="text" id="name" class="form-control">
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <label for="cardCompany">카드회사</label>
                     </td>
                     <td>
                        <select id="cardCompany" class="form-control">
                           <option>국민</option>
                           <option>비씨</option>
                           <option>신한</option>
                           <option>현대</option>
                           <option>삼성</option>
                           <option>롯데</option>
                           <option>외환</option>
                           <option>NH</option>
                           <option>하나</option>
                           <option>우리</option>
                           <option>광주</option>
                           <option>수협</option>
                           <option>씨티</option>
                           <option>전북</option>
                           <option>제주</option>
                           <option>카카오뱅크</option>
                           <option>케이뱅크</option>
                        </select>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <label for="cardnum">카드번호</label>
                     <td>
                        <input type="text" id="cardnum" class="form-control">
                     </td>
                  </tr>
               </c:when>
               <c:otherwise>
                  <tr>
                     <td>
                        <label for="name">입금자명</label>
                     </td>
                     <td>
                        <input type="text" id="name" class="form-control">
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <label for="bank">입금은행</label>
                     </td>
                     <td>
                        <select id="bank" class="form-control">
                           <option value="농협">농협</option>
                           <option value="국민은행">국민은행</option>
                           <option value="신한은행">신한은행</option>
                           <option value="우리은행">우리은행</option>
                           <option value="기업은행">기업은행</option>
                           <option value="하나은행">KEB하나은행</option>
                           <option value="대구은행">대구은행</option>
                           <option value="부산은행">부산은행</option>
                           <option value="우체국">우체국</option>
                           <option value="스탠다드차타드은행">스탠다드차타드은행</option>
                           <option value="광주은행">광주은행</option>
                           <option value="경남은행">경남은행</option>
                        </select>
                     </td>
                  </tr>
               </c:otherwise>
            </c:choose>
            <tr>
               <td>
                  <label>금액</label>
               </td>
               <td>
                  <span>
                     <fmt:formatNumber value="${price}" pattern="#,###" />
                     원
                  </span>
               </td>
            </tr>
         </table>
      </div>
      <div id="buttons">
         <button type="button" id="btnFinalPayment" class="btn btn-primary">결제하기</button>
         <button type="button" onclick="javascript:window.close();" class="btn btn-default">취소</button>
      </div>
   </div>
   <script type="text/javascript">
      $(function() {
         $("#btnFinalPayment").click(
               function() {
                  var depositor = $("#name").val();
                  var bank = $("#bank").val();

                  if (!checkFinalPayment()) {
                     return false;
                  }

                  $("#t_depositor", opener.document).val(depositor);
                  $("#t_bank", opener.document).val(bank);

                  $("#formTrading", opener.document).attr("action",
                        "/trading/paymentComplete");
                  $("#formTrading", opener.document).submit();
                  window.close();
               });
      });

      function checkFinalPayment() {
         var mode = "${mode}";
         var name = $("#name").val();
         var cardnum = $("#cardnum").val();

         if (name == "") {
            alert("이름을 입력해주세요.");
            return false;
         }

         if (mode == "card") {
            if (cardnum == "") {
               alert("카드 번호를 입력해주세요");
               return false;
            }
         }

         return true;
      }
   </script>
</body>
</html>