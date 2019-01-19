<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<%@ page trimDirectiveWhitespaces="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>
</head>
<body>
<header>
<tiles:insertAttribute name="header"/>
</header>

<section>
<tiles:insertAttribute name="body"/>
</section>

<footer>
<tiles:insertAttribute name="footer"/>
</footer>
</body>
</html>