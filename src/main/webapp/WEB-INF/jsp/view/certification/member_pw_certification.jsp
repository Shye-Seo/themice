<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<title>THE MICE</title>
<link rel="icon" href="${root}/img/common/favicon.svg">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<link rel="preconnect" href="https://fonts.googleapis.com"> 
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> 
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
</head>
<body>
	<c:if test="${check != 0}">
		<div align="center">
			인증번호를 입력해주세요.
			<form method="post">
				<input type="text" name="num" /> <input type="submit" value="확인" />
			</form>
		</div>
	</c:if>

	<c:if test="${check == 0}">
		<div align="center">인증이 완료되었습니다.</div>
		<input type="hidden" id="certification" value="${check}">
	</c:if>

	<div align="center">
		<span id="close">닫기</span>
		
		<script type="text/javascript">
			$(function () {
				$('#close').click(function() {
					
					var check = $('#certification').val();
					
					if(check == 0){
						window.opener.parent.location='member_pw_result';
						self.close();
					}
					
					if(check != 0){
						self.close();
					}
				});
			});
		</script>
	</div>
</body>
</html>