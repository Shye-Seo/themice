<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>THE MICE</title>
<link rel="icon" href="${root}/img/common/favicon.svg">
<link rel="stylesheet" href="${root}/css/view/mypage/mypage.css">
<link rel="stylesheet" href="${root}/css/view/mypage/mobile_mypage.css">
<link rel="stylesheet" href="${root}/css/view/style.css">
</head>
<body>
	<section id="mobile_mypage">
		
		<a href="javascript:history.back();" id="back_area">
			<img alt="" src="${root}/img/common/back_btn.svg" class="back_btn">
			<span>마이페이지</span>
		</a>
		
		<div class="contents_area">
			<div class="content_item_1">
				<p><span>${sessionScope.id}님</span> 더 마이스를 사용해주셔서 감사합니다.</p>
			</div>
			
			<div class="content_item_2">
				<a href="member_payment"><img alt="" src="${root}/img/member_page/payment_icon.svg"><span>나의결제 현황</span></a>
				<div class="line_area"></div>
				<a href="member_info"><img alt="" src="${root}/img/member_page/profile_icon.svg"><span>회원정보수정</span></a>
				<div class="line_area"></div>
				<a href="notice_list"><img alt="" src="${root}/img/member_page/notice_icon.svg"><span>공지사항</span></a>
			</div>
			
			<div class="content_item_3">
				<a href="member_payment">나의 결제현황</a>
				<a href="member_info">회원정보 수정</a>
			</div>
			
			<div class="content_item_4">
				<a href="notice_list">공지사항</a>
				<a href="logout">로그아웃</a>
				<a href="member_secession">회원탈퇴</a>
			</div>
		</div>
	</section>
	
	<jsp:include page="/WEB-INF/jsp/footer/mobile_footer.jsp" />
</body>
</html>