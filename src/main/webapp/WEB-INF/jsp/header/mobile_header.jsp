<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/css/view/header/mobile_header.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<div class="header_background">
	</div>
	<header id="mobile_header">
		<div class="logo">
			<a href="main"><img alt="" src="${root}/img/header/m_logo.svg"></a>
		</div>
		
		<div class="category">
			<img alt="" src="${root}/img/header/search_color.svg" id="search_open_btn">
			<img alt="" src="${root}/img/header/category_icon.svg" id="nav_open_btn">
		</div>
	</header>
	
	<nav id="mobile_nav">
		<div class="nav_area_1">
			<div class="input_area">
				<div class="login_area">
					<c:if test="${empty sessionScope.id}">
						<a href="login">로그인</a>
					</c:if>
					<c:if test="${not empty sessionScope.id}">
						<a href="logout">로그아웃</a>
					</c:if>
				</div>
				<div class="img_area">
					<img alt="" src="${root}/img/header/search.svg">
					<img alt="" src="${root}/img/header/close_white.svg" id="nav_close_btn">
				</div>
			</div>
			
			<div class="text_area">
				<span>THE MICE에</span>
				<span>오신걸 환영합니다.</span>
			</div>
		</div>
		
		<div class="nav_area_2">
			<div class="nav_item">
				<div class="title_area">
					<span>전시</span>
					<img alt="" src="${root}/img/header/arrow_icon.svg" class="navi_btn_1">
					<img alt="" src="${root}/img/header/arrow_icon_close.svg" class="navi_close_1">
				</div>
				<div class="sub_area sub_area_1">
					<a href="list?term=0">전체일정</a>
					<a href="list?term=1">현재일정</a>
					<a href="list?term=2">지난일정</a>
				</div>
			</div>
			
			<div class="nav_item">
				<div class="title_area">
					<span>공지사항</span>
					<img alt="" src="${root}/img/header/arrow_icon.svg" class="navi_btn_2">
					<img alt="" src="${root}/img/header/arrow_icon_close.svg" class="navi_close_2">
				</div>
				<div class="sub_area sub_area_2">
					<a href="notice_list">공지사항</a>
				</div>
			</div>
			
			<div class="nav_item">
				<div class="title_area">
					<span>마이페이지</span>
					<img alt="" src="${root}/img/header/arrow_icon.svg" class="navi_btn_3">
					<img alt="" src="${root}/img/header/arrow_icon_close.svg" class="navi_close_3">
				</div>
				<div class="sub_area sub_area_3">
					<a href="member_info">회원정보 수정</a>
					<a href="member_payment">결재 내역</a>
					<a href="member_password_update">비밀번호 수정</a>
					<a href="member_secession">회원 탈퇴</a>
				</div>
			</div>
		</div>
	</nav>
	
	<div id="mobile_total_search">
		<div class="close_area">
			<img alt="" src="${root}/img/header/close_white.svg" id="search_close_btn">
		</div>
		<form action="list" method="get">
			<input type="text" name="keyword" placeholder="검색어를 입력해주세요.">
			<input type="submit" value="검색" id="m_total_search_btn">
			<label for="m_total_search_btn"><img alt="" src="${root}/img/header/search_black.svg"></label>
		</form>
	</div>
	
	<script type="text/javascript">
		$(function () {
			$('#nav_open_btn').click(function(){
				$('#mobile_nav').css('right', '0');
				$('.header_background').css('display', 'block');
			});
			
			$('#nav_close_btn').click(function(){
				$('#mobile_nav').css('right', '-80%');
				$('.header_background').css('display', 'none');
			});
			
			$('.navi_btn_1').click(function(){
				$('.navi_btn_1').css('display', 'none');
				$('.navi_close_1').css('display', 'block');
				$('.sub_area_1').css('height', 'auto');
			});
			
			$('.navi_btn_2').click(function(){
				$('.navi_btn_2').css('display', 'none');
				$('.navi_close_2').css('display', 'block');
				$('.sub_area_2').css('height', 'auto');
			});
			
			$('.navi_btn_3').click(function(){
				$('.navi_btn_3').css('display', 'none');
				$('.navi_close_3').css('display', 'block');
				$('.sub_area_3').css('height', 'auto');
			});
			
			$('.navi_close_1').click(function(){
				$('.navi_btn_1').css('display', 'block');
				$('.navi_close_1').css('display', 'none');
				$('.sub_area_1').css('height', '0');
			});
			
			$('.navi_close_2').click(function(){
				$('.navi_btn_2').css('display', 'block');
				$('.navi_close_2').css('display', 'none');
				$('.sub_area_2').css('height', '0');
			});
			
			$('.navi_close_3').click(function(){
				$('.navi_btn_3').css('display', 'block');
				$('.navi_close_3').css('display', 'none');
				$('.sub_area_3').css('height', '0');
			});
			
			$('#search_open_btn').click(function () {
				$('.header_background').css('display', 'block');
				$('#mobile_total_search').css('display', 'block');
			});
			
			$('#search_close_btn').click(function () {
				$('.header_background').css('display', 'none');
				$('#mobile_total_search').css('display', 'none');
			});
		});
	</script>
</body>
</html>