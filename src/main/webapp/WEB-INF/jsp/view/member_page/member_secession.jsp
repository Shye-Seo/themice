<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/css/view/mypage/mypage.css">
<link rel="stylesheet" href="${root}/css/view/mypage/mobile_mypage.css">
<link rel="stylesheet" href="${root}/css/view/style.css">
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
			<span>개인회원</span>
			<span><img alt="" src="${root}/img/common/arrow_icon.svg"></span>
			<span>회원 탈퇴</span>
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
						<!-- <option value="member_info">회원정보 수정</option> -->
						<option value="login_check">회원정보 수정</option>
						<option value="member_payment">결재 내역</option>
						<option value="member_password_update">비밀번호 수정</option>
						<option value="member_secession" selected="selected">회원 탈퇴</option>
					</select>
				</li>
			</ul>
		</nav>
	</div>
	
	<section id="password_check">
		<div class="title_area">
			<span>회원 탈퇴</span>
		</div>
		
		<div class="contents_area">
			<div class="text_area">
				<span>- 본인 확인을 위해 비밀번호를 입력해주세요.</span>
				<span>- 비밀번호는 타인에게 노출되지 않도록 주의해주세요.</span>
			</div>
			<div class="input_area">
				<form method="post" action="member_secession">
					<input type="password" placeholder="비밀번호를 입력하세요." name="password" class="text_input">
					<input type="submit" value="확인" class="text_submit">
				</form>
			</div>
		</div>
	</section>
	
	<jsp:include page="/WEB-INF/jsp/footer/footer.jsp" />
	
	<section id="mobile_password_check">
		
		<a href="javascript:history.back();" id="back_area">
			<img alt="" src="${root}/img/common/back_btn.svg" class="back_btn">
			<span>회원탈퇴</span>
		</a>
		
		<div class="contents_area">
			<div class="contents_item">
				<div class="text_area">
					<span>- 본인 확인을 위해 비밀번호를 입력해주세요.</span>
					<span>- 비밀번호는 타인에게 노출되지 않도록 주의해주세요.</span>
				</div>
				<div class="input_area">
					<form method="post" action="member_secession">
						<input type="password" placeholder="비밀번호를 입력하세요." name="password" class="text_input">
						<input type="submit" value="확인" class="text_submit">
					</form>
				</div>
			</div>
		</div>
	</section>
	
	<jsp:include page="/WEB-INF/jsp/footer/mobile_footer.jsp" />
</body>
</html>