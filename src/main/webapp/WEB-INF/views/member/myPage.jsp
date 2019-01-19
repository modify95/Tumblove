<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<style type="text/css">
#mypage_wrapper {
	background: rgba(0,0,0,0.8);
	width: 1000px;
	margin: 20px auto;
	border-radius: 5px;
	color: white;
	padding-bottom: 30px;
}
#mypage_div {
	width: 900px;
	margin: 20px auto;
}

#mypage_div p {
	margin-top: 28px;
	font-size: 20px;
	font-weight: bold;	
}

#myInformation {
	margin-top: 18px;
	width: 47%;
	float: left;
	height: 300px;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	padding-top: 10px;
	padding-bottom: 20px;
	background-color: white;
}

#myPage {
	margin-top: 18px;
	width: 53%;
	float: right;
	height: 300px;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	padding-top: 10px;
	padding-bottom: 20px;
	background-color: white;
}

.mypage_table {
	margin-top: 20px;
	border-collapse: collapse;
	border: 1px solid white;;
	width: 100%;
	text-align: center;
	background: white;
	color: black;
	border-radius: 5px;
}

.mypage_table tr td {
	height: 60px;
}

.mypage_table tr td input[type='button']{
	/* height: 30px;
	padding-top: 4.2px; */
	width: 220px;
	font-weight: bold;
}

.mypage_table tr:last-child td input[type='button']{
	/* height: 30px;
	padding-top: 4.2px; */
	width: 140px; 
	margin-left: 20px;
	margin-right: 20px;
	font-weight: bold;
}

#myInformation table tr td {
	height: 80px;
	font-weight: bold;
}
</style>
</head>	
<body>
<div id="mypage_wrapper">
	<div class="container theme-showcase" role="main" id="mypage_div">
		<p>마이 페이지</p>
		<hr>
		<div id="myInformation">
			<table border="1" class="mypage_table">
				<tr>
					<td>-------- <b style="color: rgba(30,100,220,1);"><%=session.getAttribute("m_name")%></b>님의 마이페이지 --------</td>
				</tr>
				<tr>
					<td>고객님의 회원등급은 <b style="color: rgba(30,100,220,1);"><b style="color: rgba(30,100,220,1);">◈</b> <%=session.getAttribute("m_grade")%></b> 등급
						입니다.</td>
				</tr>
				<tr>
					<td>-------- 보유 마일리지  <b style="color: rgba(30,100,220,1);"><%=session.getAttribute("m_mileage")%>
					</b>pt --------</td>
				</tr>
			</table>
		</div>
		<div id="myPage">
			<table border="1" class="mypage_table">
				<tr>
					<td><input type="button" id="writtenQnA" class="btn btn-default"
						value="본인 작성QnA 보러 가기 " onclick="location.href='#';"></td>
				</tr>
				<tr>
					<td><input type="button" id="writtenReview" class="btn btn-default"
						value="본인 작성리뷰 보러 가기 " onclick="location.href='#';"></td>
				</tr>
				<tr>
					<td><input type="button" id="orderCheck" class="btn btn-default"
						value="주문 내역 조회" onclick="location.href='#';"></td>
				</tr>
				<tr>
					<td><input type="button" id="memInfoUpdate" class="btn btn-default" value="회원 정보수정 ">
					<input type="button" id="memQuit" class="btn btn-default" value="회원 탈퇴"></td>
				</tr>
			</table>
		</div>
	</div>
</div>	
</body>
<script type="text/javascript">
	$(function() {
		document.getElementById("udqt").style.display = "none";
		$("#memInfoUpdate").click(function() {
			popupOpen();
		});
		$("#memQuit").click(function() {
			popupOpen2();
		});
		function popupOpen() {
			var url = "/member/updatePopUp"; //팝업창 페이지 URL
			var scWidth = screen.availWidth;
			var scHeight = screen.availHeight;
			var left = (parseInt(scWidth) - 650) / 2;
			var top = (parseInt(scHeight) - 900) / 2;
			var winWidth = 400;
			var winHeight = 150;
			var popupOption = "width=" + winWidth + ", height=" + winHeight
					+ ", top=" + top + ", left=" + left; //팝업창 옵션(option)
			popup = window.open(url, "", popupOption);
			window.focus(); //열린 페이지에 포커스를 준다. 열림과 동시에 앞쪽으로.
		}
		function popupOpen2() {
			var url = "/member/quitPopUp"; //팝업창 페이지 URL
			var scWidth = screen.availWidth;
			var scHeight = screen.availHeight;
			var left = (parseInt(scWidth) - 650) / 2;
			var top = (parseInt(scHeight) - 900) / 2;
			var winWidth = 400;
			var winHeight = 150;
			var popupOption = "width=" + winWidth + ", height=" + winHeight
					+ ", top=" + top + ", left=" + left; //팝업창 옵션(option)
			popup = window.open(url, "", popupOption);
			window.focus(); //열린 페이지에 포커스를 준다. 열림과 동시에 앞쪽으로.
		}
	});
</script>
</html>