<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="/resources/js/common.js"></script>
<meta charset="UTF-8">
<!-- Bootstrap core CSS -->
<link href="/resources/bootstrap/dist/css/bootstrap.min.css"
   rel="stylesheet">
<!-- Bootstrap theme -->
<link href="/resources/bootstrap/dist/css/bootstrap-theme.min.css"
   rel="stylesheet">
<title>Insert title here</title>
<style type="text/css">
.box {
   margin: 0 auto;
   height: 240px;
   width: 380px;
}

.container-1 {
   width: 300px;
   vertical-align: middle;
   white-space: nowrap;
   position: relative;
}
</style>
</head>
<body>
   <div class="box">
      <form>
         <legend style="font-size: 12px; font-weight: bold;">인증받을
            이메일을 입력하세요.</legend>
         <fieldset class="container-1" style="text-align: right;">
            <label for="eVer">이메일 입력 : </label> <input type="email" name="eVer"
               id="eVer" placeholder="<%=session.getAttribute("m_mail")%>"><br />
            <br /> <input type="button" value="인증하기" id="eVeri"
               class="btn btn-primary"> <input type="hidden" id="m_number"
               value="<%=session.getAttribute("m_id")%>">
         </fieldset>
      </form>
      <br />
      <form>
         <div class="hidden1">
            <legend style="font-size: 12px; font-weight: bold;">인증번호를
               입력하세요.</legend>
            <fieldset class="container-1" style="text-align: right;">
               <label for="autoNum">인증번호 입력 :</label>&nbsp;<input type="number"
                  name=autoNum id="autoNum" maxlength="8">&nbsp;&nbsp; <input
                  type="button" id="autoSub" value="확인" class="btn btn-primary"><br />
               <br /> <input type="hidden" id="hideAutoN">
               <div id="countdown"
                  style="color: red; font-family: Verdana, Arial, sans-serif; font-size: 18px; font-weight: bold; text-decoration: none; text-align: center;"></div>
            </fieldset>

         </div>
      </form>
   </div>
</body>
<script type="text/javascript">
   $(document)
         .ready(
               function() {
                  $(".hidden1").hide(); //div 기본값 숨김
                  $("#eVeri")
                        .click(
                              function() {
                                 $("#eVeri").hide();
                                 var data = {
                                    "m_mail" : $("#eVer").val()
                                 };
                                 $(".hidden1").show(); //클릭 시 숨김해제
                                 countdown("countdown", 5, 0); //인증번호 보낸 후로 3분카운트다운

                                 $
                                       .ajax({
                                          url : "/member/eVer",
                                          type : "post",
                                          data : data,
                                          error : function() {
                                             alert('사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
                                          },
                                          success : function(
                                                resultData) {
                                             /* alert(resultData); */
                                             $("#hideAutoN")
                                                   .val(
                                                         resultData);
                                          }
                                       });
                              });
                  $("#autoSub")
                        .click(
                              function() {
                                 var data = {
                                    "m_id" : $("#m_number").val()
                                 };
                                 if ($("#hideAutoN").val() == $(
                                       "#autoNum").val()) {
                                    $
                                          .ajax({
                                             url : "/member/eVer2",
                                             type : "post",
                                             data : data,
                                             error : function() {
                                                alert('사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
                                                window.close();
                                             },
                                             success : function(
                                                   resultData) {
                                                console
                                                      .log("resultData : "
                                                            + resultData);
                                                alert('인증번호 정답!');
                                                alert('다시 로그인 해주세요!');
                                                opener.parent.location = 'logout2';
                                                window.close();
                                             }
                                          });
                                 } else {
                                    alert("인증번호를 잘못 입력하셨습니다.");
                                    alert("창이 닫힙니다.");
                                    window.close();
                                 }
                              });
                  /* function msg_time() {   // 1초씩 카운트
                     var SetTime = 300;
                     m = Math.floor(SetTime / 60) + "분 " + (SetTime % 60) + "초";   // 남은 시간 계산
                     var msg = "현재 남은 시간은 <font color='red'>" + m + "</font> 입니다.";
                     document.all.ViewTimer.innerHTML = msg;      // div 영역에 보여줌 
                     SetTime--;               // 1초씩 감소
                     if (SetTime < 0) {         // 시간이 종료 되었으면..   
                        clearInterval(tid);      // 타이머 해제
                        alert("종료");
                     }   
                  }
                  window.onload = function TimerStart(){ tid=setInterval('msg_time()',1000) }; */
                  function countdown(elementName, minutes, seconds) {
                     var element, endTime, hours, mins, msLeft, time;

                     function twoDigits(n) {
                        return (n <= 9 ? "0" + n : n);
                     }

                     function updateTimer() {
                        msLeft = endTime - (+new Date);
                        if (msLeft < 1000) {
                           element.innerHTML = "countdown's over!";
                           window.close(); // 카운트다운 끝나면 팝업 창 닫힘
                        } else {
                           time = new Date(msLeft);
                           hours = time.getUTCHours();
                           mins = time.getUTCMinutes();
                           element.innerHTML = (hours ? hours + ':'
                                 + twoDigits(mins) : mins)
                                 + ':'
                                 + twoDigits(time.getUTCSeconds());
                           setTimeout(updateTimer, time
                                 .getUTCMilliseconds() + 500);
                        }
                     }

                     element = document.getElementById(elementName);
                     endTime = (+new Date) + 1000
                           * (60 * minutes + seconds) + 500;
                     updateTimer();
                  }

               });
</script>
</html>