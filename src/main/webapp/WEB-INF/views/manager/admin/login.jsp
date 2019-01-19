<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<% session.setAttribute("manager", "admin");%>
<html>
<head>
<script>
function submit_Function() {
	document.return_form.submit();
}

function init(){
	setTimeout("submit_Function()", 100);
}
</script>
</head>
<body onLoad="init()">
	<form name="return_form" action="/manager/admin/returnMain" method="post">
		<input type="hidden" name="a_id" value='${admin.a_id}'>
		<input type="hidden" name="a_password" value='${admin.a_password}'>
	</form>
</body>
</html> --%>