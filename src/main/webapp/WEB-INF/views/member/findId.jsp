<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<style type="text/css">
.btn {
   display: inline-block;
   padding: 6px 12px;
   margin-bottom: 0;
   font-size: 14px;
   font-weight: 400;
   line-height: 1.42857143;
   text-align: center;
   white-space: nowrap;
   vertical-align: middle;
   -ms-touch-action: manipulation;
   touch-action: manipulation;
   cursor: pointer;
   -webkit-user-select: none;
   -moz-user-select: none;
   -ms-user-select: none;
   user-select: none;
   background-image: none;
   border: 1px solid transparent;
   border-radius: 4px
}

.btn-primary {
   color: #fff;
   background-color: #337ab7;
   border-color: #2e6da4
}

button, input, optgroup, select, textarea {
   margin: 0;
   font: inherit;
   color: inherit
}

button {
   overflow: visible
}

button, select {
   text-transform: none
}

button, html input[type=button], input[type=reset], input[type=submit] {
   -webkit-appearance: button;
   cursor: pointer
}

button[disabled], html input[disabled] {
   cursor: default
}

button::-moz-focus-inner, input::-moz-focus-inner {
   padding: 0;
   border: 0
}
</style>
</head>
<body>
   <div class="container theme-showcase" role="main">
      <legend style="font-weight: bold; font-size: 12px;">아이디 찾기</legend>
      <fieldset>
         <form id="findIdForm" style="text-align: center;">
            <label for="findId">이메일 입력 : </label> <input type="email" min="11"
               maxlength="25" placeholder="ex)abc123@gmail.com" id="findId"><br />
            <br /> <input type="button" value="찾기" id="idFind"
               class="btn btn-primary"> <input type="hidden" id="hideFind">
         </form>
      </fieldset>
   </div>
</body>
<script type="text/javascript">
   $(function() {
      document.getElementById("udqt").style.display = "none";
      $("#idFind")
            .click(
                  function() {
                     var data = {
                        "m_mail" : $("#findId").val()
                     };
                     var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
                     var emailVal = $("#findId").val();
                     if (emailVal.match(regExp) != null) {
                        $.ajax({
                           url : "/member/findId2",
                           type : "post",
                           data : data,
                           error : function(resultData) {
                              alert("이메일을 찾을 수 없습니다.");
                              $("#findId").val("").focus();
                              popupOpen2();
                           },
                           success : function(resultData) {
                              console.log("resultData : "
                                    + resultData);
                              if (resultData != "") {
                                 popupOpen(resultData);
                                 location.href = "/";
                              }
                           }
                        });
                     } else {
                        alert("이메일 형식을 맞춰주세요");
                        $("#findId").val("").focus();
                     }
                  });
      var popup;
      function popupOpen(resultData) {
         var url = "/member/findIdPopUp?m_id=" + resultData; //팝업창 페이지 URL
         var scWidth = screen.availWidth;
         var scHeight = screen.availHeight;
         var left = (parseInt(scWidth) - 650) / 2;
         var top = (parseInt(scHeight) - 900) / 2;
         var winWidth = 360;
         var winHeight = 150;
         var popupOption = "width=" + winWidth + ", height=" + winHeight
               + ", top=" + top + ", left=" + left; //팝업창 옵션(option)
         popup = window.open(url, "", popupOption);
         window.focus(); //열린 페이지에 포커스를 준다. 열림과 동시에 앞쪽으로.
      }

      function popupOpen2() {
         var url = "/member/findIdPopUp"; //팝업창 페이지 URL
         var scWidth = screen.availWidth;
         var scHeight = screen.availHeight;
         var left = (parseInt(scWidth) - 650) / 2;
         var top = (parseInt(scHeight) - 900) / 2;
         var winWidth = 400;
         var winHeight = 200;
         var popupOption = "width=" + winWidth + ", height=" + winHeight
               + ", top=" + top + ", left=" + left; //팝업창 옵션(option)
         popup = window.open(url, "", popupOption);
         window.focus(); //열린 페이지에 포커스를 준다. 열림과 동시에 앞쪽으로.
      }
   });
</script>
</html>