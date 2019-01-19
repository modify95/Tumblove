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
<body onload="setTimeout(function() {window.close()}, 10000)">
   <div class="container theme-showcase" role="main">
      <legend style="font-weight: bold; font-size: 12px;">비밀번호 찾기</legend>
      <fieldset>
         <form id="findPwForm" style="text-align: left;">
            <label for="findPw">아이디 입력 : </label> <input type="text" id="findPw"><br />
            <br /> <label for="findPw2">이메일 입력 : </label> <input type="email"
               id="findPw2">&nbsp; <input type="button" value="본인 확인"
               id="selfVerify" class="btn btn-primary">
         </form>
         <br /> <input type="button" id="temporaryPw" value="임시비밀번호 발급"
            disabled="disabled" class="btn btn-primary">
      </fieldset>
   </div>
</body>
<script type="text/javascript">
   $(function() {
      $("#temporaryPw").click(function() {
         var data = {
            "m_mail" : $("#findPw2").val(),
            "m_id" : $("#findPw").val()
         };
         $.ajax({
            url : "/member/temporaryPwPopUp",
            type : "post",
            data : data,
            error : function() {
               alert('사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
            },
            success : function(resultData) {
               if (resultData == 1) {
                  popupOpen2();
               }
            }
         });
      });
      document.getElementById("udqt").style.display = "none";
      $("#selfVerify")
            .click(
                  function() {
                     var data = {
                        "m_id" : $("#findPw").val(),
                        "m_mail" : $("#findPw2").val()
                     }
                     var reg_uid = /^[a-z0-9]{6,16}$/; // 5~16자 영문소문자, 숫자 사용가능
                     var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
                     var idVal = $("#findPw").val();
                     var emailVal = $("#findPw2").val();
                     if (idVal.match(reg_uid) != null) {
                        if (emailVal.match(regExp) != null) {
                           $
                                 .ajax({
                                    url : "/member/findPw2",
                                    type : "post",
                                    data : data,
                                    error : function() {
                                       alert('사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
                                    },
                                    success : function(resultData) {
                                       console.log("resultData : "
                                             + resultData);
                                       if (resultData == "1") {
                                          popupOpen();
                                          $("#temporaryPw").attr(
                                                "disabled",
                                                false);
                                       } else if (resultData == "0") {
                                          alert("입력하신 정보에 해당하는 회원데이터가 존재하지 않습니다.             다시 입력해주세요.")
                                          $("#findPw").val("");
                                          $("#findPw2").val("");
                                          $("#findPw").focus();
                                          $("#temporaryPw").attr(
                                                "disabled",
                                                true);
                                       }
                                    }
                                 });
                        } else {
                           alert("이메일 형식을 맞춰주세요.");
                           $("#findPw2").val("").focus();
                        }
                     } else {
                        alert("아이디 형식을 맞춰주세요");
                        $("#findPw").val("").focus();
                     }
                  });
      function popupOpen() {
         var url = "/member/findPwPopUp"; //팝업창 페이지 URL
         var scWidth = screen.availWidth;
         var scHeight = screen.availHeight;
         var left = (parseInt(scWidth) - 650) / 2;
         var top = (parseInt(scHeight) - 900) / 2;
         var winWidth = 400;
         var winHeight = 80;
         var popupOption = "width=" + winWidth + ", height=" + winHeight
               + ", top=" + top + ", left=" + left; //팝업창 옵션(option)
         popup = window.open(url, "", popupOption);
         window.focus(); //열린 페이지에 포커스를 준다. 열림과 동시에 앞쪽으로.
      }

      function popupOpen2() {
         var url = "/member/temporaryPw?m_mail=" + $("#findPw2").val(); //팝업창 페이지 URL
         var scWidth = screen.availWidth;
         var scHeight = screen.availHeight;
         var left = (parseInt(scWidth) - 650) / 2;
         var top = (parseInt(scHeight) - 900) / 2;
         var winWidth = 500;
         var winHeight = 180;
         var popupOption = "width=" + winWidth + ", height=" + winHeight
               + ", top=" + top + ", left=" + left; //팝업창 옵션(option)
         popup = window.open(url, "", popupOption);
         window.focus(); //열린 페이지에 포커스를 준다. 열림과 동시에 앞쪽으로.
      }
   });
</script>
</html>