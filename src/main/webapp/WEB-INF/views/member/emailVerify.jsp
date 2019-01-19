<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="/resources/js/common.js"></script>
<title>Insert title here</title>
<!-- Bootstrap core CSS -->
<link href="/resources/bootstrap/dist/css/bootstrap.min.css"
   rel="stylesheet">
<!-- Bootstrap theme -->
<link href="/resources/bootstrap/dist/css/bootstrap-theme.min.css"
   rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/bootstrap/css/theme.css" rel="stylesheet">
<link href="/resources/bootstrap/css/sticky-footer-navbar.css"
   rel="stylesheet">
<script type="text/javascript">
   $(function() {
      $("#logout").click(function() {
         location.href = "member/logout";
      });
      $("#emailvrf").click(function(event) {
         console.log('click');
         popupOpen();
      });
      function popupOpen() {
         var url = "member/eVer"; //팝업창 페이지 URL
         var scWidth = screen.availWidth;
         var scHeight = screen.availHeight;
         var left = (parseInt(scWidth) - 650) / 2;
         var top = (parseInt(scHeight) - 900) / 2;
         var winWidth = 400;
         var winHeight = 260;
         var popupOption = "width=" + winWidth + ", height=" + winHeight
               + ", top=" + top + ", left=" + left; //팝업창 옵션(option)
         window.open(url, "", popupOption);
         win.focus(); //열린 페이지에 포커스를 준다. 열림과 동시에 앞쪽으로.
      }
      ;
   })
</script>
<style type="text/css">
#email_verify_wrapper {
   width: 900px;
   margin: 0 auto;
}

#email_verify_div {
   width: 602px;
   margin: 30px auto;
   border: 1px solid silver;
   border-radius: 5px;
   padding: 0px;
}

#email_verify_div img {
   border-radius: 5px;
}

#email_verify_wrapper p {
   font-size: 24px;
   font-weight: bold;
   text-align: center;
}

#email_verify_buttons {
   margin: 30px auto;
   width: 602px;
   text-align: center;
}

#email_verify_buttons button {
   font-weight: bold;
}
</style>
</head>
<body>
   <div id="email_verify_wrapper">
      <p>이메일 인증</p>
      <hr>
      <div class="container theme-showcase" role="main"
         id="email_verify_div" style="text-align: center;">
         <img alt="회원가입 축하화면" src="/resources/image/congratulation.png"
            width="439px" height="586px">
      </div>
      <form id="verForm" name=verForm>
         <div id="email_verify_buttons">
            <button type="button" id="emailvrf" name=evrf
               class="btn btn-primary">인증하기</button>
            <button type="button" id="logout" class="btn btn-default">로그아웃</button>
         </div>
         <%
            session.getAttribute("m_mail");
         %>
      </form>

   </div>
</body>
</html>