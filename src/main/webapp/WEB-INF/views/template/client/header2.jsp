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
      $("#lg").click(function(){
         event.preventDefault();
         alert('보안 문제로 로그인기능을 3분간 사용하실 수 없습니다.');
      });
        $("#join").click(function(){
            event.preventDefault();
           alert('해당기능을 이용할 수 없습니다.');
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
         <a class="navbar-brand" id="home1"><strong>Tumblove</strong></a>
      </div>
      <%
         if (session.getAttribute("m_id") == null) {
      %>
      <div id="navbar" class="navbar-collapse collapse">
         <ul class="nav navbar-nav" id="client_nav1">
            <li><a href="/member/error">Home</a></li>
            <li><a href="#" id="lg">로그인</a></li>
            <li><a href="#" id="join">회원가입</a></li>
            <li><a href="#" id="basket">장바구니</a></li>
            <li><a href="#" id="delivery">배송조회</a></li>
            <li><a href="#" id="mpage">마이페이지</a></li>
            <li class="dropdown"><a class="dropdown-toggle"
               data-toggle="dropdown" role="button" aria-expanded="false">고객센터
                  <span class="caret"></span>
            </a>
               <ul class="dropdown-menu" role="menu" id="client_nav_dropdown">
                  <li><a href="/notice/noticeList">공지사항</a></li>
                  <li><a href="/faq/faqList">자주 묻는 질문</a></li>
                  <li><a href="/qna/qna">Q&A</a></li>
                  <li class="divider"></li>
                  <li><a href="/manager/main/mainList">Manager</a></li>
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
            <li><a href="/cart/list">장바구니</a></li>
            <li><a href="/">배송조회</a></li>
            <li><a href="/member/myPage">마이페이지</a></li>
            <li class="dropdown"><a href="/" class="dropdown-toggle"
               data-toggle="dropdown" role="button" aria-expanded="false">고객센터
                  <span class="caret"></span>
            </a>
               <ul class="dropdown-menu" role="menu" id="client_nav_dropdown">
                  <li><a href="/notice/noticeList">공지사항</a></li>
                  <li><a href="/faq/faqList">자주 묻는 질문</a></li>
                  <li><a href="/qna/qna">Q&A</a></li>
                  <li class="divider"></li>
                  <li><a href="/manager/main/mainList">Manager</a></li>
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
               <li><a href="/product/productList/coffeebean">Coffee Bean</a></li>
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
               <li><a href="/product/productList/coffeebean">Coffee Bean</a></li>
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
<div class="modal fade" id="modal" tabindex="-1" role="dialog"
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="card align-middle"
            style="width: 32rem; border-radius: 20px;">
            <div class="card-title" style="margin-top: 30px;">
               <h2 class="card-title text-center" style="color: #113366;">로그인
                  폼</h2>
            </div>
            <div class="card-body">
               <form class="form-signin">
                  <h5 class="form-signin-heading">로그인 정보를 입력하세요</h5>
          
                  <label for="inputEmail" class="sr-only">Your ID</label> <input
                     type="text" id="lm_id" name="m_id" class="form-control"
                     placeholder="Your ID" required autofocus><BR> <label
                     for="inputPassword" class="sr-only">Password</label> <input
                     type="password" id="lm_password" name="m_password"
                     class="form-control" placeholder="Password" required><br>
                  <div style="display: none;" id="loginError">
                     <span style="color: red; font-weight: bold;">로그인 실패 5회 시
                        보안문제로<br> 5분간 로그인 기능이 잠깁니다.
                     </span>
                  </div>
                  <br> <a href="/member/findId">아이디</a>/<a
                     href="/member/findPw">비밀번호 찾기</a>&nbsp;&nbsp;&nbsp;&nbsp; <a
                     href="/member/joinAgree">회원가입</a> <input id="loginBtn"
                     class="btn btn-lg btn-primary btn-block" type="button"
                     value="로 그 인">
               </form>
               <input type="hidden" value="<%=count%>" id="count"> <input
                  type="hidden" value="${m_id}" id="idVerify"> <input
                  type="hidden" value="${m_password }" id="pwVerify">
            </div>
         </div>

      </div>
   </div>
</div>