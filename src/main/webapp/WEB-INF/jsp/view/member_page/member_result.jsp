<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<title>THE MICE</title>
<link rel="icon" href="${root}/img/common/favicon.svg">
<link rel="stylesheet" href="${root}/css/view/style.css">
<link rel="stylesheet" href="${root}/css/view/find_info/find_info.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/header/header.jsp" />
	
	<div class="header">
		<div class="title">
			<span>마이페이지</span>
		</div>
	</div>
	
	<section class="result_area">
		<div class="title_area">
			<span>개인회원 아이디찾기</span>
		</div>
		
		<div class="text_area">
			<p>고객님의 정보와 일치하는 아이디입니다.</p>
		</div>
		
		<div class="contents_area">
			<div>
				<span>아이디&nbsp;:&nbsp;${list.id}</span>
				<span>가입일&nbsp;:&nbsp;${list.sign_date}</span>
			</div>
		</div>
		
		<div class="btn">
			<a href="login">로그인</a>
			<a href="member_pw_find">비밀번호 찾기</a>
		</div>
	</section>
	
	<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
</body>
</html>