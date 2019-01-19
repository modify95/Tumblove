<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		alert('자동가입 방지문자를 잘못 입력하셨습니다. 회원가입 페이지로 돌아갑니다.');
		location.href = "joinForm";
	});
</script>