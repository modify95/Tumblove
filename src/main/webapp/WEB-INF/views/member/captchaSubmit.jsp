<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="nl.captcha.Captcha"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>Insert title here</title>
</head>
<body onload="setTimeout(function() {window.close()}, 3000)">
	<%
		String captcha = (String) session.getAttribute("captcha"); //라이브러리가 생성한 자동가입방지 문자
		request.setCharacterEncoding("UTF-8"); //Do this so we can capture non-Latin chars
		String answer = request.getParameter("captcha"); //사용자 입력값
		if (captcha.equals(answer)) {
	%>
	<b>자동가입 방지문자 검사 : </b>
	<input type="text" id="problem" value="문제 없음."
		style="font-weight: bold; font-size: 20px; color: blue; align-content: center;"
		readonly="readonly" maxlength="9" min="9">
	<!-- <span style="color: blue" id="problem">문제 없음.</span> -->
	<p align="center">
		<input type="button" name="close" value="닫기 ⓧ" id="close"
			onclick="window.close()">
	</p>
	<%
		} else {
	%>
	<b>자동가입 방지문자 검사 : </b>
	<input type="text" id="problem" value="문제 있음."
		style="font-weight: bold; font-size: 20px; color: red; align-content: center;"
		readonly="readonly" maxlength="9" min="9">
	<!-- <span style="color: red" id="problem">문제 있음.</span> -->
	<br />
	<p align="center">
		<input type="button" name="close" value="닫기 ⓧ"
			onclick="window.close()">
	</p>
	<%
		}
	%>
</body>
</html>