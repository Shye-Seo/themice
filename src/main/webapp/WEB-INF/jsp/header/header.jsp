<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THE MICE</title>
<link rel="icon" href="${root}/img/common/favicon.svg">
<link rel="stylesheet" href="${root}/css/view/header/header.css">
</head>
<body>
	<header id="header">
		<div class="background">
			<img alt="" src="${root}/img/header/background.png">
		</div>

		<div class="header_item">
			<div class="navi_area">
				<div class="logo">
					<a href="main"><img src="${root}/img/header/logo.svg"></a>
				</div>
	
				<c:if test="${not empty sessionScope.business_id}">
					<div class="menu">
						<ul>
							<li><a href="list">전시</a></li>
							<li><a href="insertContents">전시등록</a></li>
							<li><a href="login_check">마이페이지</a></li>
							<li><a href="logout">로그아웃</a></li>
							<li>
								<img id="search" src="${root}/img/header/search.svg">
								<img id="close_btn" src="${root}/img/header/close_btn.svg">
							</li>
						</ul>
					</div>
				</c:if>
	
				<c:if test="${empty sessionScope.id && empty sessionScope.business_id}">
					<div class="menu">
						<ul>
							<li><a href="divison">화면분할</a></li>
							<li><a href="list">전시</a></li>
							<li><a href="insertContents">전시등록</a></li>
							<li><a href="login">로그인</a></li>
							<li><a href="join">회원가입</a></li>
							<li><a href="login_check">마이페이지</a></li>
							<li>
								<img id="search" src="${root}/img/header/search.svg">
								<img id="close_btn" src="${root}/img/header/close_btn.svg">
							</li>
						</ul>
					</div>
				</c:if>
	
				<c:if test="${not empty sessionScope.id}">
					<div class="menu">
						<ul>
							<li><a href="list">전시</a></li>
							<li><a href="login_check">마이페이지</a></li>
							<li><a href="logout">로그아웃</a></li>
							<li>
								<img id="search" src="${root}/img/header/search.svg">
								<img id="close_btn" src="${root}/img/header/close_btn.svg">
							</li>
						</ul>
					</div>
				</c:if>
			</div>
			
			<div class="search_area">
				<form action="list" method="get">
					<input type="text" name="keyword">
					<input type="submit" value="검색">
					<img alt="" src="${root}/img/header/search_black.svg">
				</form>
			</div>
			
			<script type="text/javascript">
				$(function () {
					$('#search').click(function(){
						$('.search_area').css('display', 'block');
						$('#search').css('display', 'none');
						$('#close_btn').css('display', 'block');
						$('.background').addClass('background_before');
						$('section').addClass('section_before');
						$('header .header_item .navi_area .menu ul li a').css('color', '#333333');
					});
					
					$('#close_btn').click(function(){
						$('.search_area').css('display', 'none');
						$('#search').css('display', 'block');
						$('#close_btn').css('display', 'none');
						$('.background').removeClass('background_before');
						$('section').removeClass('section_before');
						$('header .header_item .navi_area .menu ul li a').css('color', 'white');
					});
				});
			</script>
		</div>
	</header>
</body>
</html>