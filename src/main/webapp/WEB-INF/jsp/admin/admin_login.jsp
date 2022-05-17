<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/css/admin_style.css">
</head>
<body>
	<div id="admin_login">
		<div class="contents_area">
			<div class="img">
				<img src="${root}/img/admin/logo.svg">
			</div>
			<div class="login">
				<form action="admin_login_check">
					<div class="id">
						<input type="text" name="id" placeholder="아이디">
					</div>

					<div class="password">
						<input type="password" name="password" placeholder="비밀번호">
					</div>

					<div class="check">
						<input type="checkbox">
						<p>아이디 저장</p>
					</div>

					<div class="sign_in">
						<input type="submit" value="관리자 로그인">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>