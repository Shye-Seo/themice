<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>THE MICE</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="icon" href="${root}/img/common/favicon.svg">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="${root}/css/view/website2/header.css">
</head>
<body>
	<img id="goBack" class="mobile_back_btn" src="${root}/img/website2/back_arrow.png">
	<script>
// 		function goBack() {
// 			window.history.back();
// 		}
	</script>
	<div class="header">
		<div class="header_inner_wrap">
			<div class="header_logo">
				<img class="logo_img" src="${root}/img/website2/logo.svg">
			</div>
			<ul>
				<li style="background-color: #1D1D1D!improtant;"><a href="#"></a></li>
				<li><a href="${root}/website?contents_idx=${contents_idx}">갤러리</a></li>
				<li><a href="${root}/website?contents_idx=${contents_idx}">전시소개</a></li>
				<li><a href="${root}/website?contents_idx=${contents_idx}">공지사항</a></li>
				<li><a href="${root}/website?contents_idx=${contents_idx}">위치안내</a></li>
				<li><a href="${root}/website?contents_idx=${contents_idx}">환불규정</a></li>
				<li><a href="${root}/website?contents_idx=${contents_idx}">영상</a></li>
				<c:if test="${not empty sessionScope.business_id || not empty sessionScope.id}">
					 <li><a href="logout">로그아웃</a></li>
				</c:if>
				<c:if test="${empty sessionScope.id && empty sessionScope.business_id}">
					 <li><a href="login">로그인</a></li>
				</c:if>
				<c:if test="${sessionScope.business_id == content_list.business_num}">
					<li><a href="main_management?contents_idx=${contents_idx}">환경설정</a></li>
				</c:if>
			</ul>
			<div class="mobile_menu" id="mobile_menu">
				<div>
					<img src="${root}/img/website2/m_search.png">
				</div>
				<div>
					<img src="${root}/img/website2/m_hamburger.png">
				</div>
				<div>
					<img src="${root}/img/website2/m_login.png">
				</div>
			</div>
			<div class="mobile_title">공지사항</div>
		</div>
	</div>
</body>
</html>