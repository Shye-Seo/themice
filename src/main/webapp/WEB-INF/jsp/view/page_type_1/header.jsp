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
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="${root}/css/view/style.css">
<link rel="stylesheet" href="${root}/css/view/website/website_type_1.css">
</head>
<body>
	<header>
		<div>
			<ul>
				<li>
					<a href="website?contents_idx=${content_list.idx}">
						<img alt="" src="${root}/logo_path/${content_list.logo_name}" class="logo_btn">
					</a>
				</li>
				
				<li onclick="introduction();">전시소개</li>
				<li onclick="gallery();">갤러리</li>
				<li onclick="place();">위치안내</li>
				<li onclick="comment();">리뷰</li>
				<li onclick="refund();">환불규정</li>
				<li onclick="notice();">공지사항</li>
				<c:if test="${not empty sessionScope.business_id || not empty sessionScope.id}">
					 <li><a href="logout">로그아웃</a></li>
				</c:if>
				<c:if test="${empty sessionScope.id && empty sessionScope.business_id}">
					 <li><a href="login">로그인</a></li>
				</c:if>
				<c:if test="${sessionScope.business_id == content_list.business_num}">
					<li><a href="main_management?contents_idx=${content_list.idx}">환경설정</a></li>
				</c:if>
			</ul>
		</div>
	</header>
	
<!-- 	<div class="rotation_banner"> -->
<!-- 		<div class="scroll_area"> -->
<!-- 			<div class="scroll_item"> -->
<%-- 				<c:forEach begin="0" end="7"> --%>
<%-- 					<span>${content_list.title}</span> --%>
<%-- 				</c:forEach> --%>
<!-- 			</div> -->
			
<!-- 			<div class="scroll_item"> -->
<%-- 				<c:forEach begin="0" end="7"> --%>
<%-- 					<span>${content_list.title}</span> --%>
<%-- 				</c:forEach> --%>
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
</body>
</html>