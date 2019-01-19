<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body onload="setTimeout(function() {window.close()}, 3000)">
	<%
		request.setCharacterEncoding("UTF-8"); //Do this so we can capture non-Latin chars
		String m_id = request.getParameter("m_id");
	%>
	<%
		if (m_id != null) {
	%>
	<div>
		<span
			style="font-size: 20px; font-weight: bold; display: table; margin-left: auto; margin-right: auto;">고객님의
			아이디는</span> <b
			style="color: blue; font-size: 20px; display: table; margin-left: auto; margin-right: auto;"><%=m_id%></b>
		<span
			style="font-size: 20px; font-weight: bold; display: table; margin-left: auto; margin-right: auto;">입니다.</span>
		<p align="center">
			<input type="button" name="close" value="닫기 ⓧ"
				onclick="window.close()">
		</p>
	</div>
	<%
		} else if (m_id == null) {
	%>
	<div>
		<span
			style="font-size: 20px; font-weight: bold; display: table; margin-left: auto; margin-right: auto;">해당
			입력 <b style="color: blue;">이 메일</b>에 부합하는
		</span><br /> <span
			style="font-size: 20px; font-weight: bold; display: table; margin-left: auto; margin-right: auto;"><b
			style="color: red;">아이디</b>를 찾지 못하였습니다. </span><br /> <span
			style="font-size: 20px; font-weight: bold; display: table; margin-left: auto; margin-right: auto;">올바른
			<b style="color: blue;">이메일</b>로 재입력 부탁 드립니다.
		</span>
		<p align="center">
			<input type="button" name="close" value="닫기 ⓧ"
				onclick="window.close()">
		</p>
	</div>
	<%
		}
	%>
</body>
</html>