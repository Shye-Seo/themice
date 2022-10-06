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
		<c:set var="link" value="/WEB-INF/jsp/view/main.jsp" />
		<c:set var="URI" value="${pageContext.request.requestURI}" />
		<c:if test="${URI ne link}">
		<div class="background">
			<div></div>
		</div>
		</c:if>

		<div class="header_item">
			<div class="navi_area">
				<div class="logo">
					<a href="main"><img src="${root}/img/header/logo.svg"></a>
				</div>
	
				<c:if test="${not empty sessionScope.business_id}">
				<div class="navi_bar">
					<div class="menu">
						<ul>
							<li><a href="list" id="tab">전시</a></li>
							<li><a href="insertContents" id="tab">전시등록</a></li>
							<li><a href="notice_list" id="tab">공지사항</a></li>
							<li><a href="login_check" id="tab">마이페이지</a></li>
						</ul>
					</div>
					<div class="small">
						<ul>
							<li><a href="logout" id="logout">로그아웃</a></li>
							<li>
								<img id="search" src="${root}/img/header/search.svg">
								<img id="close_btn" src="${root}/img/header/close_btn.svg">
							</li>
						</ul>
					</div>
				</div>
				</c:if>
	
				<c:if test="${empty sessionScope.id && empty sessionScope.business_id}">
				<div class="navi_bar">
					<div class="menu">
						<ul>
<!-- 							<li><a href="divison">화면분할</a></li> -->
							<li><a href="list" id="tab">전시</a></li>
							<li><a href="insertContents" id="tab">전시등록</a></li>
							<li><a href="notice_list" id="tab">공지사항</a></li>
							<li><a href="login_check" id="tab">마이페이지</a></li>
						</ul>
					</div>
					<div class="small">
						<ul>
							<li><a href="login" id="login">로그인</a></li>
							<li><a href="join" id="join">회원가입</a></li>
							<li>
								<img id="search" src="${root}/img/header/search.svg">
								<img id="close_btn" src="${root}/img/header/close_btn.svg">
							</li>
						</ul>
					</div>
				</div>
				</c:if>
	
				<c:if test="${not empty sessionScope.id}">
				<div class="navi_bar">
					<div class="menu">
						<ul>
							<li><a href="list" id="tab">전시</a></li>
							<li><a href="notice_list" id="tab">공지사항</a></li>
							<li><a href="login_check" id="tab">마이페이지</a></li>
						</ul>
					</div>
					<div class="small">
						<ul>
							<li><a href="logout" id="logout">로그아웃</a></li>
							<li>
								<img id="search" src="${root}/img/header/search.svg">
								<img id="close_btn" src="${root}/img/header/close_btn.svg">
							</li>
						</ul>
					</div>
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
						$('header .header_item .navi_area .menu ul li a').css('color', '#222222');
					});
					
					$('#close_btn').click(function(){
						$('.search_area').css('display', 'none');
						$('#search').css('display', 'block');
						$('#close_btn').css('display', 'none');
						$('.background').removeClass('background_before');
						$('section').removeClass('section_before');
						$('header .header_item .navi_area .menu ul li a').css('color', '#222222');
					});
				});
			</script>
		</div>
	</header>
</body>
</html>