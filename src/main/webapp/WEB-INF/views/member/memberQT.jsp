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
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
#quit_div {
	width: 1000px;
	margin: 20px auto;
}
legend {
	font-weight: bold;
}
#memQuit {
	margin-top: 20px;
	width: 100px;
	margin-left: 448px;
}

</style>
</head>
<body>
	<div id="quit_div">
		<fieldset>
			<legend>회원 탈퇴</legend>
			<form>
				<b style="color: red; font-size: 20px; display: table; margin-left: auto; margin-right: auto;">회원탈퇴
					시</b><span
					style="font-size: 20px; font-weight: bold; display: table; margin-left: auto; margin-right: auto;">
					마일리지가 소멸되며 복구할 수 없습니다.</span> <span
					style="font-size: 20px; font-weight: bold; display: table; margin-left: auto; margin-right: auto;">그래도
					회원 탈퇴를 계속 진행하시겠습니까?</span> 
					<input type="hidden" id="m_number" value="<%=session.getAttribute("m_id")%>">
			</form>
		</fieldset>
		<div class="buttons"><input type="button" id="memQuit" value="확인" class="btn btn-primary"></div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		document.getElementById("udqt").style.display = "none";
		$("#memQuit").click(function() {
			var data = {
				"m_id" : $("#m_number").val()
			};
			$.ajax({
				url : "/member/memberQT",
				type : "post",
				data : data,
				error : function() {
					alert('사이트 접속에 문제로 정상 작동하지 못하였습니다. 잠시 후 다시 시도해 주세요.');
				},
				success : function(resultData) {
					alert("회원탈퇴 처리가 완료되었습니다.");
					location.href = 'logout2';
				}
			});
		});
	});
</script>
</html>