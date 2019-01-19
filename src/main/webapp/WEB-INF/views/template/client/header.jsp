<%@page import="com.tumbler.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
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

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script
   src="/resources/bootstrap/assets/js/ie-emulation-modes-warning.js"></script>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<!-- Fixed navbar -->
<script type="text/javascript">
   $(function(){
      $("#basket").click(function(){
         if(${empty sessionScope.m_id}){
            alert('회원만 이용가능합니다.');
         }
      });
      $("#mpage").click(function(){
         if(${empty sessionScope.m_id}){
            alert('회원만 이용가능합니다.');
         }
      });
      $("#delivery").click(function(){
         if(${empty sessionScope.m_id}){
            alert('회원만 이용가능합니다.');
         }
      });
   });
</script>
<nav class="navbar navbar-inverse navbar-fixed-top">
   <div class="container">
      <div class="navbar-header" id="nav_home1">
         <button type="button" class="navbar-toggle collapsed"
            data-toggle="collapse" data-target="#navbar" aria-expanded="false"
            aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span> <span
               class="icon-bar"></span> <span class="icon-bar"></span> <span
               class="icon-bar"></span>
         </button>
         <a class="navbar-brand" id="home1" href="/"><strong>Tumblove</strong></a>
      </div>
      <%
         if (session.getAttribute("m_id") == null) {
      %>
      <div id="navbar" class="navbar-collapse collapse">
         <ul class="nav navbar-nav" id="client_nav1">
            <li><a href="/">Home</a></li>
            <li><a data-toggle="modal" href="#modal" id="lg">로그인</a></li>
            <li><a href="/member/joinAgree">회원가입</a></li>
            <li><a data-toggle="modal" href="#modal" id="basket">장바구니</a></li>
            <li><a data-toggle="modal" href="#modal" id="delivery">배송조회</a></li>
            <li><a data-toggle="modal" href="#modal" id="mpage">마이페이지</a></li>
            <li class="dropdown"><a class="dropdown-toggle"
               data-toggle="dropdown" role="button" aria-expanded="false">고객센터
                  <span class="caret"></span>
            </a>
               <ul class="dropdown-menu" role="menu" id="client_nav_dropdown">
                  <li><a href="/notice/noticeList">공지사항</a></li>
                  <li><a href="/faq/faqList">자주 묻는 질문</a></li>
                  <li><a href="/qna/qnaList">Q&A</a></li>
                  <li class="divider"></li>
                  <li><a href="/manager/main">Manager</a></li>
               </ul></li>
         </ul>
      </div>
      <%
         } else {
      %>
      <div id="navbar" class="navbar-collapse collapse">
         <ul class="nav navbar-nav" id="client_nav1">
            <li><a href="/">Home</a></li>
            <li><a id="loginedName"><%=session.getAttribute("m_name")%>님
                  어서오세요</a></li>
            <li><a href="/member/logout">로그아웃</a></li>
            <li><a href="/cart/cartList">장바구니</a></li>
            <li><a href="/">배송조회</a></li>
            <li><a href="/member/myPage">마이페이지</a></li>
            <li class="dropdown"><a href="/" class="dropdown-toggle"
               data-toggle="dropdown" role="button" aria-expanded="false">고객센터
                  <span class="caret"></span>
            </a>
               <ul class="dropdown-menu" role="menu" id="client_nav_dropdown">
                  <li><a href="/notice/noticeList">공지사항</a></li>
                  <li><a href="/faq/faqList">자주 묻는 질문</a></li>
                  <li><a href="/qna/qnaList">Q&A</a></li>
                  <li class="divider"></li>
                  <li><a href="/manager/main">Manager</a></li>
               </ul></li>
         </ul>
      </div>
      <%
         }
      %>
      <!--/.nav-collapse -->
   </div>
</nav>

<div class="container theme-showcase" role="main">
   <!-- Main jumbotron for a primary marketing message or call to action -->
   <div class="jumbotron">
      <h1>☆ Tumblove ★</h1>
   </div>
   <%
      if (session.getAttribute("m_statement").equals("대기회원")) {
   %>
   <nav class="navbar navbar-inverse" style="display: none;">
      <div class="container">
         <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
               data-toggle="collapse" data-target=".navbar-collapse">
               <span class="sr-only">Toggle navigation</span> <span
                  class="icon-bar"></span> <span class="icon-bar"></span> <span
                  class="icon-bar"></span>
            </button>
            <a class="navbar-brand" id="home2"><strong>Brand</strong></a>
         </div>
         <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav" id="client_nav2">
               <li><a href="/product/productList/starbucks">Starbucks</a></li>
               <li><a href="/product/productList/coffeebean">Coffee bean</a></li>
               <li><a href="/product/productList/locknlock">Lock&Lock</a></li>
               <li><a href="/product/productList/kakaofriends">Kakao
                     Friends</a></li>
               <li><a href="/product/productList/staley">Stanley</a></li>
               <li><a href="/product/productList/mosh">Mosh</a></li>
               <li><a href="/product/productList/kinto">Kinto</a></li>
               <li><a href="/product/productList/corksicle">Corksicle</a></li>
               <li><a href="/product/productList/theroms">Thermos</a></li>
               <li><a href="/product/productList/bluebottl">Blue Bottle</a></li>
            </ul>
         </div>
         <!--/.nav-collapse -->
      </div>
   </nav>
   <%
      } else {
   %>
   <nav class="navbar navbar-inverse" id="udqt">
      <div class="container">
         <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
               data-toggle="collapse" data-target=".navbar-collapse">
               <span class="sr-only">Toggle navigation</span> <span
                  class="icon-bar"></span> <span class="icon-bar"></span> <span
                  class="icon-bar"></span>
            </button>
            <a class="navbar-brand" id="home2"><strong>Brand</strong></a>
         </div>
         <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav" id="client_nav2">
               <li><a href="/product/productList/starbucks">Starbucks</a></li>
               <li><a href="/product/productList/coffeebean">Coffee bean</a></li>
               <li><a href="/product/productList/locknlock">Lock&Lock</a></li>
               <li><a href="/product/productList/kakaofriends">Kakao
                     Friends</a></li>
               <li><a href="/product/productList/staley">Stanley</a></li>
               <li><a href="/product/productList/mosh">Mosh</a></li>
               <li><a href="/product/productList/kinto">Kinto</a></li>
               <li><a href="/product/productList/corksicle">Corksicle</a></li>
               <li><a href="/product/productList/theroms">Thermos</a></li>
               <li><a href="/product/productList/bluebottl">Blue Bottle</a></li>
            </ul>
         </div>
         <!--/.nav-collapse -->
      </div>
   </nav>
   <%
      }
   %>
</div>
<!-- /container -->
<%
   MemberVO mvo = new MemberVO();
   int count = mvo.getCount();
%>
<!-- /container -->
<div class="modal fade" id="modal" tabindex="-1" role="dialog"
   aria-labelledby="myModalLabel" aria-hidden="true"
   data-backdrop="static">
   <div class="modal-dialog" id="modal-dialog">
      <div class="modal-content" id="modal-content">
         <div class="card align-middle" id="login_modal_content">
            <div class="card-title">
               <h2>Member Login</h2>
            </div>
            <div class="card-body">
               <form class="form-signin">
                  <label for="inputEmail" class="sr-only">Your ID</label> <input
                     type="text" id="lm_id" name="m_id" class="form-control"
                     placeholder="Enter your ID" required autofocus><BR>
                  <label for="inputPassword" class="sr-only">Password</label> <input
                     type="password" id="lm_password" name="m_password"
                     class="form-control" placeholder="Enter your password" required>
                  <div style="display: none;" id="loginError">
                     <span style="color: red; font-weight: bold;">로그인 실패 5회 시
                        보안문제로<br> 5분간 로그인 기능이 잠깁니다.
                     </span>
                  </div>
                  <a href="/member/findId">아이디/</a><a href="/member/findPw">비밀번호
                     찾기</a>&nbsp;&nbsp;&nbsp;&nbsp; <a href="/member/joinAgree">회원가입</a>
                  <button id="loginBtn" class="btn btn-lg btn-default btn-block"
                     type="button">Login</button>
                  <button id="closeBtn" class="btn btn-lg btn-default btn-block"
                     data-dismiss="modal" type="button">Close</button>
               </form>
               <input type="hidden" value="<%=count%>" id="count"> <input
                  type="hidden" value="${m_id }" id="idVerify"> <input
                  type="hidden" value="${m_password }" id="pwVerify">
            </div>
         </div>
         <script type="text/javascript">
            $(function() {
               count = $("#count").val();
               $("#loginBtn").click(function() {
                  var data = {
                     "m_id" : $("#lm_id").val(),
                     "m_password" : $("#lm_password").val()
                  };
                  $.ajax({
                            url : "/member/login",
                            type : "post",
                            data : data,
                            error : function() {
                               var error = document.getElementById("loginError");
                              if($("#lm_id").val() != $("#idVerify").val() && $("#lm_password").val() != $("#pwVerify").val()){
                                 count++;
                                 error.style.display = 'block';
                                 alert('로그인 실패' + count + '회');
                                 $("#lm_password").val("");
                                 $("#lm_id").val("").focus();
                              }else if($("#lm_id").val("") || $("#lm_password").val()){
                                 count++;
                                 error.style.display = 'block';
                                 alert('로그인 실패' + count + '회');
                                 $("#lm_password").val("");
                                 $("#lm_id").val("").focus();
                              }else{
                                  alert("시스템 오류. 관리자에게 문의");
                              }
                              if(count == 5){
                                 alert('5분간 로그인 기능 비활성화.');
                                 location.href = "/member/error";
                              }
                            },
                            success : function() {                                                      
                               alert("로그인 성공!");
                               window.location.reload();
                            }
                         });
               });

               $("#lm_id").keydown(function(e) {
                  var key = e.keyCode;
                  if (key == 13 && $("#lm_id").val() == "") {
                     alert("아이디를 입력해주세요 ㅎㅎ");
                     return false;
                  }
               });
                 $("#lm_password").keydown(function(e) {
                           var key = e.keyCode;
                           if (key == 13 && $("#lm_password").val() == "") {
                              alert("비밀번호를 입력해주세요 ㅎㅎ");
                              return false;
                           } else if (key == 13 && $("#lm_password").val() != "") {
                              var data = {
                                 "m_id" : $("#lm_id").val(),
                                 "m_password" : $("#lm_password").val()
                              };
                              $.ajax({
                                 url : "/member/login",
                                 type : "post",
                                 data : data,
                                 error : function() {
                                    var error = document.getElementById("loginError");
                                   if($("#lm_id").val() != $("#idVerify").val() && $("#lm_password").val() != $("#pwVerify").val()){
                                      count++;
                                      error.style.display = 'block';
                                      alert('로그인 실패' + count + '회');
                                      $("#lm_password").val("");
                                      $("#lm_id").val("").focus();
                                   }else if($("#lm_id").val("") || $("#lm_password").val("")){
                                      count++;
                                      error.style.display = 'block';
                                      alert('로그인 실패' + count + '회');
                                      $("#lm_password").val("");
                                      $("#lm_id").val("").focus();
                                   }else{
                                       alert("시스템 오류. 관리자에게 문의");
                                   }
                                   if(count == 5){
                                      alert('로그인 기능이 잠깁니다.');
                                      location.href = "/member/error";
                                   }
                                 },
                                 success : function() {
                                    alert("로그인 성공!");
                                    window.location.reload();
                                 }
                              });
                           }
                        });
            });
         </script>
      </div>
   </div>
</div>