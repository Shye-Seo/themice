<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/css/view/style.css">
<link rel="stylesheet" href="${root}/css/view/mypage/mypage.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>THE MICE</title>
<link rel="icon" href="${root}/img/common/favicon.svg">
<style type="text/css">
#footer{
	position: absolute;
	bottom: 0;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/header/header.jsp" />
	
	<div class="header">
		<div class="title">
			<span>마이페이지</span>
		</div>
		<div class="root">
			<img alt="" src="${root}/img/list/home_icon.svg">
			<span><img alt="" src="${root}/img/common/arrow_icon.svg"></span>
			<span>기업회원</span>
			<span><img alt="" src="${root}/img/common/arrow_icon.svg"></span>
			<span>비밀번호 확인</span>
		</div>
	</div>
	
	<div id="navi_area">
		<nav>
			<ul>
				<li>
					<a href="main">
						<img alt="" src="${root}/img/member_page/home_icon.svg">
					</a>
				</li>
				
				<li>
					<a href="#">전시</a>
				</li>
				<li>
					<select onchange="window.location.href=this.value">
						<option value="business_info" selected="selected">회원정보 수정</option>
						<option value="business_contents_list">내 전시 리스트</option>
						<option value="business_payment">결제 내역</option>
						<option value="business_password_update">비밀번호 수정</option>
						<option value="business_secession">회원 탈퇴</option>
					</select>
				</li>
			</ul>
		</nav>
	</div>
	
	<section id="password_check">
		<div class="title_area">
			<span>비밀번호 확인</span>
		</div>
		
		<div class="contents_area">
			<div class="text_area">
				<span>- 본인 확인을 위해 비밀번호를 입력해주세요.</span>
				<span>비밀번호는 타인에게 노출되지 않도록 주의해주세요.</span>
			</div>
			<div class="input_area">
				<form method="post" action="business_password_check">
					<input type="password" placeholder="비밀번호를 입력하세요." name="password" class="text_input">
					<input type="submit" value="확인" class="text_submit">
				</form>
			</div>
		</div>
	</section>
	
	<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
</body>
</html>