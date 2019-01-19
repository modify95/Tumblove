<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String m_mail = request.getParameter("m_mail");
	%>
	<div>
		<span
			style="font-size: 20px; font-weight: bold; display: table; margin-left: auto; margin-right: auto;">입력하신</span><b
			style="color: blue; font-size: 20px; font-weight: bold; display: table; margin-left: auto; margin-right: auto;"><%=m_mail%></b><span
			style="font-size: 20px; font-weight: bold; display: table; margin-left: auto; margin-right: auto;">
			이메일로 </span> <span
			style="font-size: 20px; font-weight: bold; display: table; margin-left: auto; margin-right: auto;">임시
			비밀번호를 발송했습니다.</span>
		<p align="center">
			<input type="button" name="close" value="닫기 ⓧ"
				onclick="window.close()">
		</p>
	</div>
</body>
</html>