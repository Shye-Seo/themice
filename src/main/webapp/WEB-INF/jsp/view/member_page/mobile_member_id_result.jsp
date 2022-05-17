<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${root}/css/view/style.css">
<link rel="stylesheet" href="${root}/css/view/find_info/mobile_find.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>THE MICE</title>
<link rel="icon" href="${root}/img/common/favicon.svg">
</head>
<body>
	<a href="javascript:history.back();" id="back_area"> <img alt=""
		src="${root}/img/common/back_btn.svg" class="back_btn"> <span>아이디 찾기</span>
	</a>
	
	<section id="mobile_id_find">
		<div class="title">
			<span>아이디 찾기</span>
		</div>
		
		<div class="content_area">
			<span>고객님의 정보와 일치하는 아이디입니다.</span>
			
			<div class="result_area">
				<span>${mv.id}</span>
				<span>${mv.sign_date}</span>
			</div>
		</div>
		
		<div class="btn_area">
			<a href="login">로그인</a>
			<a href="member_pw_find">비밀번호 찾기</a>
		</div>
	</section>
</body>
</html>